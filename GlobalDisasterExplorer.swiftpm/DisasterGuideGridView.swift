//
//  DisasterGuideGridView.swift
//  ssc2025
//

import SwiftUI

struct DisasterGuideGridView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            ScrollView {
                // Set minimum grid cell size to 150 and reduce spacing to 10
                let columns = [GridItem(.adaptive(minimum: 150), spacing: 10)]
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(disasterGuides) { guide in
                        NavigationLink(destination: DisasterGuideDetailView(guide: guide)) {
                            VStack {
                                Image(guide.iconName)  // Load image from Assets
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 60)
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
            .navigationTitle("Disaster Safety Guidelines")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") {
                        dismiss()
                    }
                }
            }
        }
    }
}
