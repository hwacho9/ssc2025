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
    @State private var selectedTopFilter: TopTimeFilter = .all  // Default filter: All
    @State private var selectedCentury: Int? = nil  // For CE (1500 and later) filter: century selection
    @State private var showGuideGrid: Bool = false  // To show the disaster guide grid page
    
    // Filter events based on the selected time filter
    var filteredEvents: [DisasterEvent] {
        switch selectedTopFilter {
        case .all:
            return sampleEvents
        case .bce:
            return sampleEvents.filter { $0.year < 0 }
        case .ceBefore1500:
            return sampleEvents.filter { $0.year > 0 && $0.year < 1500 }
        case .ceAfter1500:
            let eventsAfter1500 = sampleEvents.filter { $0.year >= 1500 }
            if let century = selectedCentury {
                return eventsAfter1500.filter { $0.year >= century && $0.year < century + 100 }
            } else {
                return eventsAfter1500
            }
        }
    }
    
    // Dynamically generate available centuries for events after 1500
    var availableCenturies: [Int] {
        let centuries = Set(sampleEvents.filter { $0.year >= 1500 }.map { ($0.year / 100) * 100 })
        return centuries.sorted()
    }
    
    var body: some View {
        ZStack {
            VStack {
                // Top filter buttons
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
                                    Text("\(century)-\(century+99)")
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
                    
                    if let event = selectedEvent {
                        VStack {
                            Spacer()
                            EventDetailView(event: event) {
                                withAnimation {
                                    selectedEvent = nil
                                }
                            }
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(12)
                            .padding()
                        }
                        .transition(.move(edge: .bottom))
                    }
                }
            }
            
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
        }
        .sheet(isPresented: $showGuideGrid) {
            DisasterGuideGridView()
        }
    }
}
