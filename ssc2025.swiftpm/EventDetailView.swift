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
        VStack(alignment: .leading, spacing: 16) {
            Text(event.title)
                .font(.title)
                .bold()
            Text(event.description)
                .font(.body)
            Divider()
            Text("대피 방법")
                .font(.headline)
            Text(event.evacuationInstructions)
                .font(.body)
            Spacer()
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
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(12)
        .padding()
    }
}
