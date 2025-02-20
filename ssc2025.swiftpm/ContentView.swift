import SwiftUI

enum TopTimeFilter: String, CaseIterable, Identifiable {
    case all = "전체"
    case bce = "기원전"
    case ceBefore1500 = "기원후 (1500 이전)"
    case ceAfter1500 = "1500년 이후"
    
    var id: String { self.rawValue }
}

struct ContentView: View {
    @State private var selectedEvent: DisasterEvent? = nil
    @State private var selectedTopFilter: TopTimeFilter = .all  // 기본 필터: 전체
    @State private var selectedCentury: Int? = nil  // 1500년 이후 필터의 100년 단위 선택
    @State private var showGuideGrid: Bool = false  // 재해 가이드 그리드 페이지 표시 여부
    
    // 선택된 필터에 따라 이벤트 필터링
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
    
    // 1500년 이후 이벤트들의 100년 단위 구분값 동적 생성
    var availableCenturies: [Int] {
        let centuries = Set(sampleEvents.filter { $0.year >= 1500 }.map { ($0.year / 100) * 100 })
        return centuries.sorted()
    }
    
    var body: some View {
        ZStack {
            VStack {
                // 상단 필터 버튼
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(TopTimeFilter.allCases) { filter in
                            Button(action: {
                                selectedTopFilter = filter
                                selectedCentury = nil  // 필터 전환 시 100년 선택 초기화
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
                
                // 1500년 이후 선택 시 세부 100년 단위 버튼 표시
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
            
            // 오른쪽 하단 플로팅 버튼 (EventDetailView가 표시 중이면 숨김)
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
