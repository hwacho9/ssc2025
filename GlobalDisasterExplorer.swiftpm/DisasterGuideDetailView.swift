//
//  DisasterGuideDetailView.swift
//  ssc2025
//

import SwiftUI

struct DisasterGuideDetailView: View {
    var guide: DisasterGuide
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(guide.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                Text(guide.name)
                    .font(.title)
                    .bold()
                Text(guide.description)
                    .font(.body)
                Divider()
                Text("Recommended Actions")
                    .font(.headline)
                Text(guide.recommendedActions)
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
            }
            .padding()
        }
        .navigationTitle(guide.name)
    }
}
