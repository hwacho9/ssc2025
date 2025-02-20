//
//  DisasterGuideGridView.swift
//  ssc2025
//
//  Created by 조성화 on 2025/02/21.
//

import SwiftUI

enum DisasterCategory: String, CaseIterable, Identifiable {
    case earthquake = "지진"
    case tsunami = "쓰나미"
    case volcano = "화산"
    
    var id: String { self.rawValue }
}

struct DisasterGuide: Identifiable {
    let id = UUID()
    let category: DisasterCategory
    let emoji: String
    let name: String
    let description: String
    let recommendedActions: String
}

let disasterGuides: [DisasterGuide] = [
    DisasterGuide(
        category: .earthquake,
        emoji: "💥",
        name: "지진",
        description: "지진은 땅이 갑자기 흔들리는 자연 현상입니다.",
        recommendedActions: "건물 내부에서는 튼튼한 구조물 아래로 대피하고, 야외에서는 열린 공간으로 이동하세요."
    ),
    DisasterGuide(
        category: .tsunami,
        emoji: "🌊",
        name: "쓰나미",
        description: "쓰나미는 해저 지진이나 화산 활동으로 발생하는 거대한 해일입니다.",
        recommendedActions: "해안가에 있다면 즉시 내륙으로 대피하고, 높은 지대로 이동하세요."
    ),
    DisasterGuide(
        category: .volcano,
        emoji: "🌋",
        name: "화산",
        description: "화산은 마그마가 지표면으로 분출하는 현상입니다.",
        recommendedActions: "화산 폭발 경보 시 즉시 높은 지대로 대피하고, 화산재를 피하세요."
    )
]

struct DisasterGuideGridView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            ScrollView {
                // 그리드 셀 최소 크기를 키우고, 셀 간격을 줄임
                let columns = [GridItem(.adaptive(minimum: 150), spacing: 10)]
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(disasterGuides) { guide in
                        NavigationLink(destination: DisasterGuideDetailView(guide: guide)) {
                            VStack {
                                Text(guide.emoji)
                                    .font(.system(size: 60))
                                Text(guide.name)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, minHeight: 150)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        }
                    }
                }
                .padding(10)
            }
            .navigationTitle("재해 가이드")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("닫기") {
                        dismiss()
                    }
                }
            }
        }
    }
}
