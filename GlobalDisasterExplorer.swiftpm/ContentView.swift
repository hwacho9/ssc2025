import SwiftUI

enum TopTimeFilter: String, CaseIterable, Identifiable {
    case all = "All"
    case bce = "BCE"
    case ceBefore1500 = "CE (Before 1500)"
    case ceAfter1500 = "CE (1500 and later)"
    
    var id: String { self.rawValue }
}

struct ContentView: View {
    @State private var selectedEvent: DisasterEvent? = nil
    @State private var selectedTopFilter: TopTimeFilter = .all  // Default time filter
    @State private var selectedCentury: Int? = nil             // For CE (1500 and later) filter: century selection
    @State private var showGuideGrid: Bool = false             // To show the disaster guide grid page
    @State private var selectedDisasterTypes: Set<EventType> = Set([.earthquake, .volcano, .flood, .tornado, .earthquakeAndTsunami])
    
    // Combine time filtering and disaster type filtering
    var filteredEvents: [DisasterEvent] {
        let timeFiltered: [DisasterEvent]
        switch selectedTopFilter {
        case .all:
            timeFiltered = sampleEvents
        case .bce:
            timeFiltered = sampleEvents.filter { $0.year < 0 }
        case .ceBefore1500:
            timeFiltered = sampleEvents.filter { $0.year > 0 && $0.year < 1500 }
        case .ceAfter1500:
            let eventsAfter1500 = sampleEvents.filter { $0.year >= 1500 }
            if let century = selectedCentury {
                timeFiltered = eventsAfter1500.filter { $0.year >= century && $0.year < century + 100 }
            } else {
                timeFiltered = eventsAfter1500
            }
        }
        if !selectedDisasterTypes.isEmpty {
            return timeFiltered.filter { selectedDisasterTypes.contains($0.type) }
        } else {
            return timeFiltered
        }
    }
    
    // Dynamically generate available centuries for events after 1500
    var availableCenturies: [Int] {
        let centuries = Set(sampleEvents.filter { $0.year >= 1500 }.map { ($0.year / 100) * 100 })
        return centuries.sorted()
    }
    
    // All disaster types available in the model
    let allDisasterTypes: [EventType] = [.earthquake, .volcano, .flood, .tornado, .earthquakeAndTsunami]
    
    // Color mapping for disaster types
    func color(for type: EventType) -> Color {
        switch type {
        case .earthquake:
            return .red
        case .volcano:
            return .orange
        case .flood:
            return .blue
        case .tornado:
            return .yellow
        case .earthquakeAndTsunami:
            return .purple
        }
    }
    
    // Label mapping for disaster types
    func label(for type: EventType) -> String {
        switch type {
        case .earthquake:
            return "Earthquake"
        case .volcano:
            return "Volcano"
        case .flood:
            return "Flood"
        case .tornado:
            return "Tornado"
        case .earthquakeAndTsunami:
            return "Earthquake & Tsunami"
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                // Top time filter buttons
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(TopTimeFilter.allCases) { filter in
                            Button(action: {
                                selectedTopFilter = filter
                                selectedCentury = nil  // Reset century selection when switching filters
                            }) {
                                Text(filter.rawValue)
                                    .padding(8)
                                    .background(selectedTopFilter == filter ? Color.ceruleanBlue : Color.gray.opacity(0.3))
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                // For CE (1500 and later), show century selection buttons
                if selectedTopFilter == .ceAfter1500 {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(availableCenturies, id: \.self) { century in
                                Button(action: {
                                    selectedCentury = century
                                }) {
                                    Text("\(century.noGrouping)-\(min(century + 99, 2025).noGrouping)")
                                        .padding(8)
                                        .background(selectedCentury == century ? Color.ceruleanBlue : Color.gray.opacity(0.3))
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                ZStack {
                    GlobeView(selectedEvent: $selectedEvent, events: filteredEvents)
                        .edgesIgnoringSafeArea(.all)
                }
            }
            
            // Centered popup overlay for event details
            if let event = selectedEvent {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                EventDetailView(event: event) {
                    withAnimation {
                        selectedEvent = nil
                    }
                }
                .frame(maxWidth: 600, maxHeight: 600)
                .transition(.scale)
                .zIndex(1)
            }
            
            // Disaster type legend with checkboxes (top-right)
            VStack(alignment: .leading, spacing: 8) {
                ForEach(allDisasterTypes, id: \.self) { type in
                    Button(action: {
                        if selectedDisasterTypes.contains(type) {
                            selectedDisasterTypes.remove(type)
                        } else {
                            selectedDisasterTypes.insert(type)
                        }
                    }) {
                        HStack(spacing: 4) {
                            Image(systemName: selectedDisasterTypes.contains(type) ? "checkmark.square" : "square")
                                .font(.caption)
                                .foregroundColor(.white)
                            Circle()
                                .fill(color(for: type))
                                .frame(width: 16, height: 16)
                            Text(label(for: type))
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .padding(8)
            .background(Color.black.opacity(0.7))
            .cornerRadius(8)
            .padding(.trailing, 16)
            .padding(.top, 100)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            
            // Floating button at bottom-right – hide if EventDetailView is shown
            if selectedEvent == nil {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            showGuideGrid = true
                        }) {
                            Image(systemName: "square.grid.2x2.fill")
                                .font(.title)
                                .padding()
                                .background(Color.ceruleanBlue)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                        .padding()
                    }
                }
            }
            
            // Credit text at bottom-left
            VStack {
                Spacer()
                HStack {
                    Text("Image credit: NASA Visible Earth")
                        .font(.footnote)
                        .foregroundColor(.white)
                        .padding(4)
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(4)
                    Spacer()
                }
                .padding([.leading, .bottom], 8)
            }
        }
        .sheet(isPresented: $showGuideGrid) {
            DisasterGuideGridView()
        }
    }
}
