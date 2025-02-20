import SwiftUI
import SceneKit

struct GlobeView: UIViewRepresentable {
    @Binding var selectedEvent: DisasterEvent?
    var events: [DisasterEvent]
    
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        let scene = SCNScene()
        sceneView.scene = scene
        sceneView.allowsCameraControl = true
        sceneView.backgroundColor = UIColor.black
        sceneView.autoenablesDefaultLighting = true
        
        // Camera setup
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 0, 3.5)
        scene.rootNode.addChildNode(cameraNode)
        
        // Add globe (earth texture)
        let earthSphere = SCNSphere(radius: 1.0)
        if let earthImage = UIImage(named: "Earth", in: .module, with: nil) {
            earthSphere.firstMaterial?.diffuse.contents = earthImage
        } else {
            earthSphere.firstMaterial?.diffuse.contents = UIColor.systemBlue
        }
        let earthNode = SCNNode(geometry: earthSphere)
        earthNode.name = "earth"
        scene.rootNode.addChildNode(earthNode)
        
        // Add tectonic plates overlay
//        if let platesImage = UIImage(named: "plates_texture") {
//            let platesSphere = SCNSphere(radius: 1.02)
//            platesSphere.firstMaterial?.diffuse.contents = platesImage
//            platesSphere.firstMaterial?.lightingModel = .constant
//            platesSphere.firstMaterial?.isDoubleSided = true
//            platesSphere.firstMaterial?.transparency = 0.8
//            let platesNode = SCNNode(geometry: platesSphere)
//            platesNode.name = "plates"
//            scene.rootNode.addChildNode(platesNode)
//        }
        
        // Create container node for event markers
        let markersContainer = SCNNode()
        markersContainer.name = "markers"
        scene.rootNode.addChildNode(markersContainer)
        
        // Add event markers with offset for overlapping positions
        addMarkers(to: markersContainer, events: events)
        
        // Add tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(_:)))
        sceneView.addGestureRecognizer(tapGesture)
        
        return sceneView
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        // Update markers when events change
        guard let scene = uiView.scene,
              let markersContainer = scene.rootNode.childNode(withName: "markers", recursively: false) else { return }
        
        markersContainer.childNodes.forEach { $0.removeFromParentNode() }
        addMarkers(to: markersContainer, events: events)
    }
    
    /// Groups events with similar coordinates and applies a small offset to each marker within the group.
    private func addMarkers(to container: SCNNode, events: [DisasterEvent]) {
        // Group events by rounded coordinates (to 1 decimal place)
        var groups = [String: [DisasterEvent]]()
        for event in events {
            let key = "\( (event.latitude * 10).rounded() / 10 )_\( (event.longitude * 10).rounded() / 10 )"
            groups[key, default: []].append(event)
        }
        
        // For each group, add markers with an offset if needed
        for group in groups.values {
            let count = group.count
            for (index, event) in group.enumerated() {
                // Compute the base position from the event's true coordinates
                var basePosition = positionOnGlobe(latitude: event.latitude, longitude: event.longitude, radius: 1.05)
                if count > 1 {
                    // If multiple events share similar coordinates, calculate an offset in a circle
                    let angle = (2 * Float.pi / Float(count)) * Float(index)
                    let offset: Float = 0.02 // 조정 가능한 오프셋 크기
                    basePosition.x += offset * cos(angle)
                    basePosition.z += offset * sin(angle)
                }
                
                // Create an invisible hit-test node at the offset position
                let hitTestSphere = SCNSphere(radius: 0.06)
                let hitTestMaterial = SCNMaterial()
                hitTestMaterial.diffuse.contents = UIColor.clear
                hitTestSphere.materials = [hitTestMaterial]
                let hitTestNode = SCNNode(geometry: hitTestSphere)
                hitTestNode.name = event.id.uuidString
                hitTestNode.position = basePosition
                
                // Create the visible marker as a child node
                let visibleMarker = SCNSphere(radius: 0.03)
                let markerMaterial = SCNMaterial()
                switch event.type {
                case .earthquake:
                    markerMaterial.diffuse.contents = UIColor.red
                case .volcano:
                    markerMaterial.diffuse.contents = UIColor.orange
                case .flood:
                    markerMaterial.diffuse.contents = UIColor.blue
                case .tornado:
                    markerMaterial.diffuse.contents = UIColor.yellow
                case .earthquakeAndTsunami:
                    markerMaterial.diffuse.contents = UIColor.purple
                }
                visibleMarker.materials = [markerMaterial]
                let visibleMarkerNode = SCNNode(geometry: visibleMarker)
                visibleMarkerNode.position = SCNVector3(0, 0, 0)
                
                hitTestNode.addChildNode(visibleMarkerNode)
                container.addChildNode(hitTestNode)
            }
        }
    }
    
    // Converts latitude/longitude to 3D coordinates on a sphere of given radius.
    func positionOnGlobe(latitude: Double, longitude: Double, radius: Float) -> SCNVector3 {
        let latRad = Float(latitude * .pi / 180)
        let lonRad = Float(longitude * .pi / 180)
        let x = radius * cos(latRad) * sin(lonRad)
        let y = radius * sin(latRad)
        let z = radius * cos(latRad) * cos(lonRad)
        return SCNVector3(x, y, z)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Coordinator handles tap gestures on markers.
    class Coordinator: NSObject {
        var parent: GlobeView
        init(_ parent: GlobeView) {
            self.parent = parent
        }
        
        @MainActor @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
            guard let scnView = gestureRecognizer.view as? SCNView else { return }
            let location = gestureRecognizer.location(in: scnView)
            let hitResults = scnView.hitTest(location, options: nil)
            if let hit = hitResults.first, let nodeName = hit.node.name {
                if let event = parent.events.first(where: { $0.id.uuidString == nodeName }) {
                    DispatchQueue.main.async {
                        self.parent.selectedEvent = event
                    }
                }
            }
        }
    }
}
