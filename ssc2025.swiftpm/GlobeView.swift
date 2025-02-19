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
        
        // 카메라 설정
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 0, 3.5)
        scene.rootNode.addChildNode(cameraNode)
        
        // 지구본 추가 (지구 텍스처)
        let earthSphere = SCNSphere(radius: 1.0)
        if let earthImage = UIImage(named: "Earth", in: .module, with: nil) {
            earthSphere.firstMaterial?.diffuse.contents = earthImage
        } else {
            earthSphere.firstMaterial?.diffuse.contents = UIColor.systemBlue
        }
        let earthNode = SCNNode(geometry: earthSphere)
        earthNode.name = "earth"
        scene.rootNode.addChildNode(earthNode)
        
        // 판 경계(지진대/화산대) 오버레이 추가
        if let platesImage = UIImage(named: "plates_texture") {
            let platesSphere = SCNSphere(radius: 1.02) // 지구보다 약간 크게
            platesSphere.firstMaterial?.diffuse.contents = platesImage
            platesSphere.firstMaterial?.lightingModel = .constant  // 조명 영향 없이 보여주기
            platesSphere.firstMaterial?.isDoubleSided = true
            platesSphere.firstMaterial?.transparency = 0.8  // 적당한 투명도 설정
            let platesNode = SCNNode(geometry: platesSphere)
            platesNode.name = "plates"
            scene.rootNode.addChildNode(platesNode)
        }
        
        // 이벤트 마커들을 담을 컨테이너 노드 생성
        let markersContainer = SCNNode()
        markersContainer.name = "markers"
        scene.rootNode.addChildNode(markersContainer)
        
        // 초기 이벤트 마커 추가
        addMarkers(to: markersContainer, events: events)
        
        // 탭 제스처 추가
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(_:)))
        sceneView.addGestureRecognizer(tapGesture)
        
        return sceneView
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        // 필터링된 이벤트 배열에 따라 마커 업데이트
        guard let scene = uiView.scene,
              let markersContainer = scene.rootNode.childNode(withName: "markers", recursively: false) else {
            return
        }
        
        // 기존 마커 삭제
        markersContainer.childNodes.forEach { $0.removeFromParentNode() }
        
        // 새 이벤트들에 대해 마커 추가
        addMarkers(to: markersContainer, events: events)
    }
    
    /// 각 이벤트에 대해, 보이는 마커와 터치 영역(보이지 않는 히트테스트 노드)을 함께 추가합니다.
    private func addMarkers(to container: SCNNode, events: [DisasterEvent]) {
        for event in events {
            // 보이지 않는 터치 영역(히트테스트용)
            let hitTestSphere = SCNSphere(radius: 0.06)
            let hitTestMaterial = SCNMaterial()
            hitTestMaterial.diffuse.contents = UIColor.clear
            hitTestSphere.materials = [hitTestMaterial]
            let hitTestNode = SCNNode(geometry: hitTestSphere)
            // 이벤트 id를 노드 이름에 저장하여 식별
            hitTestNode.name = event.id.uuidString
            hitTestNode.position = positionOnGlobe(latitude: event.latitude, longitude: event.longitude, radius: 1.05)
            
            // 실제 보이는 마커 (작은 원)
            let visibleMarker = SCNSphere(radius: 0.03)
            let markerMaterial = SCNMaterial()
            switch event.type {
            case .earthquake:
                markerMaterial.diffuse.contents = UIColor.red
            case .volcano:
                markerMaterial.diffuse.contents = UIColor.orange
            }
            visibleMarker.materials = [markerMaterial]
            let visibleMarkerNode = SCNNode(geometry: visibleMarker)
            visibleMarkerNode.position = SCNVector3(0, 0, 0)
            
            // 보이는 마커를 터치 영역의 자식으로 추가
            hitTestNode.addChildNode(visibleMarkerNode)
            container.addChildNode(hitTestNode)
        }
    }
    
    // 위도/경도를 3D 좌표로 변환하는 함수
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
    
    // Coordinator: 제스처 인식 및 이벤트 선택 처리
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
