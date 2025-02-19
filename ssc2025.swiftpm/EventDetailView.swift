//
//  EventDetailView.swift
//  ssc2025
//
//  Created by 조성화 on 2025/02/19.
//

import SwiftUI

struct EventDetailView: View {
    var event: DisasterEvent
    var onClose: () -> Void
    
    var body: some View {
        ScrollView {  // 내용이 길 경우 스크롤 가능하도록 ScrollView 추가
            VStack(alignment: .leading, spacing: 16) {
                // 제목 및 연도 정보
                Text(event.title)
                    .font(.title)
                    .bold()
                Text(event.year >= 0 ? "AD \(event.year)" : "BC \(-event.year)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                // 기본 설명
                Text(event.description)
                    .font(.body)
                
                Divider()
                
                // 강도 정보
                Text("강도")
                    .font(.headline)
                Text(event.intensity)
                    .font(.body)
                
                Divider()
                
                // 피해 기록
                Text("피해 기록")
                    .font(.headline)
                Text(event.damageReport)
                    .font(.body)
                
                Divider()
                
                // 대피 지침
                Text("대피 지침")
                    .font(.headline)
                Text(event.evacuationInstructions)
                    .font(.body)
                
                Divider()
                
                // 대피 단계 및 주의사항 (순차적으로)
                Text("대피 단계 및 주의사항")
                    .font(.headline)
                ForEach(Array(event.evacuationSteps.enumerated()), id: \.offset) { index, step in
                    HStack(alignment: .top) {
                        Text("\(index + 1).")
                            .bold()
                        Text(step)
                    }
                    .font(.body)
                }
                
                Spacer(minLength: 20)
                
                // 닫기 버튼
                Button(action: {
                    onClose()
                }) {
                    Text("닫기")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.ceruleanBlue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(12)
        .padding()
    }
}

