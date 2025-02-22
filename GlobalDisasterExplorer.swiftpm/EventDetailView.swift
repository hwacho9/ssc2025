//
//  EventDetailView.swift
//  ssc2025
//

import SwiftUI

// Int extension: Convert number to string without grouping separators
extension Int {
    var noGrouping: String {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = false
        formatter.numberStyle = .none
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}

struct EventDetailView: View {
    var event: DisasterEvent
    var onClose: () -> Void
    
    var body: some View {
        ScrollView {  // Allows scrolling if content is long
            VStack(alignment: .leading, spacing: 16) {
                // Title and Year (without grouping separators)
                Text(event.title)
                    .font(.title)
                    .bold()
                Text(event.year >= 0 ? "AD \(event.year.noGrouping)" : "BC \((-event.year).noGrouping)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                // Description
                Text(event.description)
                    .font(.body)
                
                Divider()
                
                // Intensity
                Text("Intensity")
                    .font(.headline)
                Text(event.intensity)
                    .font(.body)
                
                Divider()
                
                // Damage Report
                Text("Damage Report")
                    .font(.headline)
                Text(event.damageReport)
                    .font(.body)
                
                Divider()
                
                // Evacuation Instructions
                Text("Evacuation Instructions")
                    .font(.headline)
                Text(event.evacuationInstructions)
                    .font(.body)
                
                // Evacuation Steps (only if available)
                if !event.evacuationSteps.isEmpty {
                    Divider()
                    Text("Evacuation Steps")
                        .font(.headline)
                    ForEach(Array(event.evacuationSteps.enumerated()), id: \.offset) { index, step in
                        HStack(alignment: .top) {
                            Text("\(index + 1).")
                                .bold()
                            Text(step)
                        }
                        .font(.body)
                    }
                }
                
                Spacer(minLength: 20)
                
                // Close Button
                Button(action: {
                    onClose()
                }) {
                    Text("Close")
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
        // Limit the size so it doesn't cover the entire screen
        .frame(maxWidth: 600, maxHeight: 600)
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(12)
        .padding()
    }
}

