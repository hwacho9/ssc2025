//
//  DisasterGuideDetailView.swift
//  ssc2025
//
//  Created by 조성화 on 2025/02/21.
//

import SwiftUI

struct DisasterGuideDetailView: View {
    var guide: DisasterGuide
    var body: some View {
        VStack(spacing: 20) {
            Text(guide.emoji)
                .font(.system(size: 80))
            Text(guide.name)
                .font(.title)
                .bold()
            Text(guide.description)
                .font(.body)
            Divider()
            Text("행동 요령")
                .font(.headline)
            Text(guide.recommendedActions)
                .font(.body)
            Spacer()
        }
        .padding()
        .navigationTitle(guide.name)
    }
}

