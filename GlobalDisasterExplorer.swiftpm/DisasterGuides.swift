//
//  DisasterGuides.swift
//  ssc2025
//


import SwiftUI

enum DisasterCategory: String, CaseIterable, Identifiable {
    case earthquake = "Earthquake"
    case tsunami = "Tsunami"
    case volcano = "Volcano"
    case tornado = "Tornado"
    
    var id: String { self.rawValue }
}

struct DisasterGuide: Identifiable {
    let id = UUID()
    let category: DisasterCategory
    let iconName: String    // 예: "earthquake", "tsunami", "volcano", "tornado"
    let name: String
    let description: String
    let recommendedActions: String
}

let disasterGuides: [DisasterGuide] = [
    DisasterGuide(
        category: .earthquake,
        iconName: "earthquake",
        name: "Earthquake",
        description: "An earthquake is a sudden shaking of the ground caused by the movement of tectonic plates.",
        recommendedActions: """
        During an earthquake, follow CDC guidelines: DROP, COVER, and HOLD ON.
        • If indoors, take cover under sturdy furniture away from windows and exterior walls.
        • If outdoors, move to an open area away from buildings, trees, and utility wires.
        • If in a vehicle, stop safely, remain inside, and avoid using elevators.
        Stay alert for aftershocks and follow instructions from local emergency services.
        
        (Source: https://www.cdc.gov/earthquakes/safety/stay-safe-during-an-earthquake.html)
        """
    ),
    DisasterGuide(
        category: .tsunami,
        iconName: "tsunami",
        name: "Tsunami",
        description: "A tsunami is a series of huge ocean waves caused by underwater earthquakes or volcanic eruptions.",
        recommendedActions: """
        When a tsunami warning is issued, immediately evacuate to higher ground away from the coast.
        • Do not wait for the first wave to subside; subsequent waves may be larger.
        • Follow local emergency alerts and evacuation orders.
        • Avoid returning to the coast until authorities declare it safe.
        
        (Source: https://jla-lifesaving.or.jp/en/watersafety/tsunami/)
        """
    ),
    DisasterGuide(
        category: .volcano,
        iconName: "volcano",
        name: "Volcano",
        description: "A volcano is an opening in the Earth’s crust that allows magma, gases, and debris to escape.",
        recommendedActions: """
        Before a volcanic eruption, know your risk and sign up for local emergency alerts.
        • If an eruption occurs, follow local instructions immediately:
          - If indoors, close windows, doors, and ventilation systems.
          - If outdoors, evacuate to higher ground.
        • Protect yourself from ash by wearing an N95 mask, goggles, and long-sleeved clothing.
        • Prepare an emergency kit with food, water, medications, and important documents.
        
        (Source: https://www.redcross.org/get-help/how-to-prepare-for-emergencies/types-of-emergencies/volcano.html)
        """
    ),
    DisasterGuide(
        category: .tornado,
        iconName: "tornado",
        name: "Tornado",
        description: "A tornado is a violently rotating column of air extending from a thunderstorm to the ground.",
        recommendedActions: """
        When a tornado warning is issued, take immediate action:
        • Seek shelter in a basement or an interior room on the lowest floor away from windows.
        • If outdoors or in a mobile home, move to a sturdy building or lie in a low-lying area and cover your head.
        • Do not wait until you see the tornado—act as soon as a warning is issued.
        Follow instructions from your local National Weather Service.
        
        (Source: https://www.weather.gov/bmx/sps_torsafetyrules)
        """
    )
]
