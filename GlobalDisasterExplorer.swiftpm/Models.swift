//
//  Models.swift
//  ssc2025
//

import SwiftUI

enum EventType {
    case earthquake, volcano, flood, tornado, earthquakeAndTsunami
}

struct DisasterEvent: Identifiable {
    let id = UUID()
    let title: String
    let type: EventType
    let latitude: Double
    let longitude: Double
    let year: Int   // Negative: BCE, Positive: CE
    let description: String
    let intensity: String         // e.g. "Magnitude 7", "VEI 5", etc.
    let damageReport: String      // Detailed damage report
    let evacuationInstructions: String  // For ancient events, historical record notes or "Historical record: No evacuation instructions available."
    let evacuationSteps: [String] // For ancient events, empty if not available
}

let sampleEvents: [DisasterEvent] = [
    // 1. BCE / Ancient events (5 items)
    DisasterEvent(
        title: "1920 BC Qinghai Jishi Gorge Outburst Flood",
        type: .flood,
        latitude: 36.0,
        longitude: 100.0,
        year: -1920,
        description: "Around 1920 BC, landslides triggered by an earthquake dammed the Yellow River in the Jishi Gorge, resulting in a colossal outburst flood.",
        intensity: "N/A",
        damageReport: "Sediment deposits and geological evidence indicate a catastrophic flood that dramatically altered the river’s course.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "479 BC Potidaea Earthquake",
        type: .earthquake,
        latitude: 39.7,
        longitude: 23.3,
        year: -479,
        description: "A major earthquake in 479 BC in the North Aegean Sea, triggering a tsunami that, according to ancient accounts, saved the colony of Potidaea from Persian invasion.",
        intensity: "Approx. 7.0",
        damageReport: "Ancient records mention a tsunami event with severe coastal impact.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "464 BC Sparta Earthquake",
        type: .earthquake,
        latitude: 37.08,
        longitude: 22.43,
        year: -464,
        description: "An earthquake in Sparta around 464 BC that led to widespread destruction and contributed to social unrest.",
        intensity: "Approx. 7.2",
        damageReport: "Historical sources note extensive damage to public and religious structures.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "226 BC Rhodes Earthquake",
        type: .earthquake,
        latitude: 36.0,
        longitude: 28.0,
        year: -226,
        description: "An earthquake in 226 BC that destroyed the Colossus of Rhodes and the city of Kameiros.",
        intensity: "N/A",
        damageReport: "Ancient texts document the complete destruction of iconic structures.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "60 BC Portugal and Galicia Earthquake",
        type: .earthquake,
        latitude: 41.0,
        longitude: -8.0,
        year: -60,
        description: "A devastating earthquake along the coasts of Portugal and Galicia around 60 BC, estimated at magnitude 8.5, which triggered a destructive tsunami.",
        intensity: "Approx. 8.5",
        damageReport: "Ancient sources describe extensive coastal devastation due to the tsunami.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    // 2. Additional Ancient/Medieval events (11 items)
    DisasterEvent(
        title: "1033 Jordan Valley Earthquake",
        type: .earthquake,
        latitude: 32.5,
        longitude: 35.5,
        year: 1033,
        description: "A major earthquake struck the Jordan Valley in 1033, causing widespread destruction across the Levant.",
        intensity: "Approx. 7.3",
        damageReport: "Historical records estimate high fatalities with severe damage to ancient settlements.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "1138 Aleppo Earthquake",
        type: .earthquake,
        latitude: 36.1,
        longitude: 36.8,
        year: 1138,
        description: "A catastrophic earthquake in Aleppo in 1138 with estimates of up to 230,000 fatalities.",
        intensity: "Approx. 7.1",
        damageReport: "Contemporary accounts detail widespread collapse of temples and markets.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "1139 Ganja Earthquake",
        type: .earthquake,
        latitude: 40.3,
        longitude: 46.2,
        year: 1139,
        description: "An earthquake in 1139 that devastated the city of Ganja in Azerbaijan, with fatalities estimated between 230,000 and 300,000.",
        intensity: "Approx. 7.7",
        damageReport: "Historical accounts describe total destruction and catastrophic loss of life.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "1157 Hama Earthquake",
        type: .earthquake,
        latitude: 35.1,
        longitude: 36.3,
        year: 1157,
        description: "A destructive earthquake near Hama in 1157, noted for its prolonged sequence.",
        intensity: "Approx. 7.2",
        damageReport: "Records indicate severe damage in Hama and surrounding areas.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "1556 Shaanxi Earthquake",
        type: .earthquake,
        latitude: 34.5,
        longitude: 109.7,
        year: -1556,
        description: "The deadliest recorded earthquake in 1556 in Shaanxi, China, with an estimated death toll exceeding 830,000.",
        intensity: "8.2–8.3",
        damageReport: "Ancient records describe entire villages leveled and catastrophic loss of life.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "1575 Valdivia Earthquake",
        type: .earthquake,
        latitude: -39.8,
        longitude: -73.2,
        year: 1575,
        description: "A major earthquake in Valdivia, Chile, which triggered a destructive tsunami and altered the coastal landscape.",
        intensity: "8.5",
        damageReport: "Historical accounts report widespread structural collapse and extensive coastal flooding.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "1700 Cascadia Earthquake",
        type: .earthquake,
        latitude: 44.0,
        longitude: -124.0,
        year: 1700,
        description: "An inferred megathrust earthquake along the Cascadia subduction zone, known from tsunami deposits in Japan.",
        intensity: "9.0 (estimated)",
        damageReport: "Geological evidence indicates massive uplift and extensive disruption along the Pacific Northwest coast.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "1707 Hōei Earthquake and Tsunami",
        type: .earthquakeAndTsunami, // If not defined, you can use .earthquake
        latitude: 33.0,
        longitude: 136.0,
        year: 1707,
        description: "On October 28, 1707, the Hōei earthquake struck Japan, triggering a large tsunami that devastated the Tōkai region. This seismic event is also notably linked to the subsequent eruption of Mount Fuji in December 1707.",
        intensity: "8.6 (Richter)",
        damageReport: "Historical records indicate widespread destruction across the Tōkai region with an estimated 5,000 fatalities. Coastal communities were severely affected by the tsunami, and many structures were completely demolished.",
        evacuationInstructions: "Historical record: No formal evacuation procedures were documented for this event.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "1755 Lisbon Earthquake",
        type: .earthquakeAndTsunami,
        latitude: 38.7,
        longitude: -9.0,
        year: 1755,
        description: "One of Europe's most devastating earthquakes, causing massive destruction and a huge tsunami.",
        intensity: "8.5",
        damageReport: "Contemporary accounts detail nearly 80,000 fatalities, complete collapse of buildings, and a tsunami that swept through coastal areas.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "1755 Meknes Earthquake",
        type: .earthquake,
        latitude: 34.0,
        longitude: -5.0,
        year: 1755,
        description: "An earthquake in Meknes, Morocco that resulted in extensive destruction.",
        intensity: "6.5–7.0",
        damageReport: "Historical documents report large sections of the city destroyed with thousands of casualties.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "1759 Near East Earthquake",
        type: .earthquake,
        latitude: 33.7,
        longitude: 35.9,
        year: 1759,
        description: "A series of earthquakes in the Near East that resulted in widespread damage and thousands of fatalities.",
        intensity: "7.4",
        damageReport: "Ancient sources indicate severe destruction across multiple cities.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "1762 Arakan Earthquake",
        type: .earthquakeAndTsunami,
        latitude: 21.0,  // Approximate
        longitude: 92.0, // Approximate
        year: 1762,
        description: "A massive earthquake in the Bay of Bengal region that triggered a devastating tsunami.",
        intensity: "Up to 8.8",
        damageReport: "Reports suggest widespread collapse of structures and a tsunami that caused extensive loss of life along the coast.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "1763 Komárom Earthquake",
        type: .earthquake,
        latitude: 47.73,
        longitude: 18.15,
        year: 1763,
        description: "A moderate earthquake in the Kingdom of Hungary with localized damage.",
        intensity: "6.2–6.5",
        damageReport: "Localized damage was reported with limited fatalities.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "1766 Istanbul Earthquake",
        type: .earthquake,
        latitude: 40.8,
        longitude: 29.0,
        year: 1766,
        description: "A destructive earthquake in Istanbul that severely damaged historic structures.",
        intensity: "7.1",
        damageReport: "Historical records describe widespread collapse of buildings and significant urban damage.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "1770 Port-au-Prince Earthquake",
        type: .earthquake,
        latitude: 18.7,
        longitude: -72.63,
        year: 1770,
        description: "A severe earthquake in Port-au-Prince, Haiti, causing significant casualties and destruction.",
        intensity: "7.5",
        damageReport: "Historical accounts detail extensive structural collapse and major disruption in urban areas.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "1773 Guatemala Earthquake",
        type: .earthquake,
        latitude: 14.6,
        longitude: -90.7,
        year: 1773,
        description: "A significant earthquake in Guatemala with variable reported fatalities.",
        intensity: "7.5",
        damageReport: "Records indicate widespread damage with casualty figures ranging widely.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "1780 Tabriz Earthquake",
        type: .earthquake,
        latitude: 38.0,
        longitude: 46.2,
        year: 1780,
        description: "A devastating earthquake in Tabriz, Iran with a catastrophic death toll.",
        intensity: "7.4",
        damageReport: "Historical documentation cites between 40,000 and 200,000 fatalities with entire districts reduced to rubble.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "1783 Calabrian Earthquakes",
        type: .earthquake,
        latitude: 38.15,
        longitude: 15.70,
        year: 1783,
        description: "A series of powerful earthquakes in Calabria, Italy, that devastated several cities.",
        intensity: "6.9",
        damageReport: "Widespread destruction with entire urban areas demolished and tens of thousands dead.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "1786 Kangding-Luding Earthquake",
        type: .earthquake,
        latitude: 29.9,
        longitude: 102.0,
        year: 1786,
        description: "A catastrophic earthquake in Sichuan, China, triggering landslides that dammed rivers and caused a massive flood.",
        intensity: "7.75",
        damageReport: "Ancient records report nearly 100,000 casualties with landslides and dam failures compounding the destruction.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "1787 New Spain Earthquake",
        type: .earthquake,
        latitude: 16.5,
        longitude: -98.5,
        year: 1787,
        description: "An intense earthquake in New Spain (Mexico) that caused significant structural damage.",
        intensity: "8.6",
        damageReport: "Historical accounts describe widespread ruin with entire communities suffering severe destruction.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "1797 Riobamba Earthquake",
        type: .earthquake,
        latitude: -1.6,         // 1.6°S
        longitude: -78.6,       // 78.6°W
        year: 1797,
        description: "Local date: 4 February 1797, local time: 07:30. A significant earthquake struck Riobamba, Ecuador, with a magnitude of 7.6 Mw (8.3 ML) and a maximum intensity of MMI XI (Extreme). The event caused widespread destruction across the region.",
        intensity: "MMI XI (Extreme)",
        damageReport: "Widespread destruction in Riobamba and surrounding areas with estimated casualties between 6,000 and 40,000.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    DisasterEvent(
        title: "1797 Sumatra Earthquake",
        type: .earthquakeAndTsunami,
        latitude: -1.0,
        longitude: 99.0,
        year: 1797,
        description: "A powerful earthquake in Sumatra that triggered a tsunami with major coastal damage.",
        intensity: "8.4",
        damageReport: "Ancient records note severe destruction of coastal settlements and heavy loss of life.",
        evacuationInstructions: "Historical record: No evacuation instructions available.",
        evacuationSteps: []
    ),
    // 3. Medieval to Renaissance events are above; now modern events (from 19th century onward)
    // 19th century (4 items)
    DisasterEvent(
        title: "17th Century Dutch Earthquake",
        type: .earthquake,
        latitude: 52.4,
        longitude: 4.9,
        year: 1650,
        description: "A minor earthquake near Amsterdam in the 17th century.",
        intensity: "5.5",
        damageReport: "Minor damage to buildings and windows. " + CommonDetails.moderateDamage,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "Evacuate immediately.",
            "Move to an open square.",
            "Follow local guidance."
        ]
    ),
    DisasterEvent(
        title: "18th Century British Earthquake",
        type: .earthquake,
        latitude: 51.5,
        longitude: -0.1,
        year: 1750,
        description: "A significant earthquake in London during the 18th century.",
        intensity: "6.0",
        damageReport: "Damage to major buildings and broken windows. " + CommonDetails.moderateDamage,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "Evacuate the building.",
            "Move to a safe area.",
            "Call emergency services."
        ]
    ),
    DisasterEvent(
        title: "19th Century Russian Earthquake",
        type: .earthquake,
        latitude: 55.7,
        longitude: 37.6,
        year: 1880,
        description: "An earthquake near Moscow in the 19th century.",
        intensity: "6.5",
        damageReport: "Damage to traditional buildings reported. " + CommonDetails.moderateDamage,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "Evacuate immediately.",
            "Move to a safe area.",
            "Contact emergency services."
        ]
    ),
    // Early 20th century (4 items)
    DisasterEvent(
        title: "1900 Philippine Earthquake",
        type: .earthquake,
        latitude: 14.6,
        longitude: 121.0,
        year: 1900,
        description: "A major earthquake in the Philippines in 1900.",
        intensity: "7.0",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "Evacuate immediately.",
            "Move to higher ground.",
            "Follow local instructions."
        ]
    ),
    DisasterEvent(
        title: "1912 Balkan Earthquake",
        type: .earthquake,
        latitude: 42.7,
        longitude: 21.1,
        year: 1912,
        description: "A major earthquake in the Balkans in 1912.",
        intensity: "7.2",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "Evacuate immediately.",
            "Move to open space.",
            "Contact emergency services."
        ]
    ),
    DisasterEvent(
        title: "1923 Great Kanto Earthquake",
        type: .earthquake,
        latitude: 35.7,
        longitude: 139.7,
        year: 1923,
        description: "The devastating Great Kanto Earthquake in Japan.",
        intensity: "7.9 (Richter)",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "Evacuate immediately.",
            "Move to a safe area.",
            "Follow emergency instructions."
        ]
    ),
    DisasterEvent(
        title: "1933 Long Beach Earthquake",
        type: .earthquake,
        latitude: 33.8,
        longitude: -118.2,
        year: 1933,
        description: "An earthquake in Long Beach, California in 1933.",
        intensity: "6.4",
        damageReport: CommonDetails.moderateDamage,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "Evacuate the building.",
            "Move to a safe location.",
            "Follow local guidance."
        ]
    ),
    // Late 1940s–1950 events (2 items)
    DisasterEvent(
        title: "1948 Ashgabat Earthquake",
        type: .earthquake,
        latitude: 37.9,
        longitude: 58.4,
        year: 1948,
        description: "A devastating earthquake in Ashgabat in 1948.",
        intensity: "8.1",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "Evacuate immediately.",
            "Move to temporary shelters.",
            "Contact international rescue teams."
        ]
    ),
    DisasterEvent(
        title: "1950 Indian Earthquake",
        type: .earthquake,
        latitude: 20.0,
        longitude: 77.0,
        year: 1950,
        description: "A major earthquake in central India in 1950.",
        intensity: "7.0",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "Evacuate immediately.",
            "Leave rural areas.",
            "Contact local authorities."
        ]
    ),
    // 1960s–1980s events (4 items)
    DisasterEvent(
        title: "1964 Alaska Earthquake",
        type: .earthquake,
        latitude: 61.0,
        longitude: -147.7,
        year: 1964,
        description: "A massive earthquake in Alaska in 1964.",
        intensity: "9.2 (Richter)",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "Evacuate immediately.",
            "Move to higher ground.",
            "Follow emergency instructions."
        ]
    ),
    DisasterEvent(
        title: "1976 Tangshan Earthquake",
        type: .earthquake,
        latitude: 39.6,
        longitude: 118.2,
        year: 1976,
        description: "A catastrophic earthquake in Tangshan, China in 1976.",
        intensity: "7.5 (Richter)",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "Evacuate immediately.",
            "Move to a safe area.",
            "Call for emergency assistance."
        ]
    ),
    DisasterEvent(
        title: "1980 El Asnam Earthquake",
        type: .earthquake,
        latitude: 35.4,
        longitude: 1.5,
        year: 1980,
        description: "A destructive earthquake in El Asnam, Algeria in 1980.",
        intensity: "7.3",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "Evacuate immediately.",
            "Move to a safe area.",
            "Contact emergency services."
        ]
    ),
    DisasterEvent(
        title: "1989 Loma Prieta Earthquake",
        type: .earthquake,
        latitude: 37.0,
        longitude: -122.0,
        year: 1989,
        description: "The Loma Prieta Earthquake in California in 1989.",
        intensity: "6.9 (Richter)",
        damageReport: CommonDetails.moderateDamage,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "Evacuate immediately.",
            "Move to a safe area.",
            "Contact emergency services."
        ]
    ),
    // 1990s events (4 items)
    DisasterEvent(
        title: "1994 Northridge Earthquake",
        type: .earthquake,
        latitude: 34.2,
        longitude: -118.5,
        year: 1994,
        description: "The Northridge Earthquake in California in 1994.",
        intensity: "6.7 (Richter)",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: CommonDetails.basicSteps
    ),
    DisasterEvent(
        title: "1995 Kobe Earthquake",
        type: .earthquake,
        latitude: 34.7,
        longitude: 135.2,
        year: 1995,
        description: "The Kobe Earthquake in Japan in 1995.",
        intensity: "6.9 (Richter)",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.followLocalAuthorities,
        evacuationSteps: [
            "Evacuate quickly from the building.",
            "Move to a temporary shelter or public assembly area.",
            "Maintain communication with emergency services."
        ]
    ),
    DisasterEvent(
        title: "1999 İzmit Earthquake",
        type: .earthquake,
        latitude: 40.8,
        longitude: 29.7,
        year: 1999,
        description: "The İzmit Earthquake in Turkey in 1999.",
        intensity: "7.6 (Richter)",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "Evacuate immediately to a safe area.",
            "Assemble at a designated shelter.",
            "Maintain contact with local rescue teams."
        ]
    ),
    // 8. Early 2000s events (5 items)
    DisasterEvent(
        title: "2002 Iran Earthquake",
        type: .earthquake,
        latitude: 35.7,
        longitude: 51.4,
        year: 2002,
        description: "An earthquake in Iran in 2002.",
        intensity: "6.5",
        damageReport: CommonDetails.moderateDamage,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: CommonDetails.basicSteps
    ),
    DisasterEvent(
        title: "2003 Bam Earthquake",
        type: .earthquake,
        latitude: 29.1,
        longitude: 58.3,
        year: 2003,
        description: "The Bam Earthquake in Iran in 2003.",
        intensity: "6.6",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "Evacuate immediately from the building.",
            "Move to a temporary shelter.",
            "Follow local authority instructions."
        ]
    ),
    DisasterEvent(
        title: "2005 Pakistan Earthquake",
        type: .earthquake,
        latitude: 34.0,
        longitude: 73.0,
        year: 2005,
        description: "The Pakistan Earthquake in 2005.",
        intensity: "7.6",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: CommonDetails.basicSteps
    ),
    DisasterEvent(
        title: "2007 Peru Earthquake",
        type: .earthquake,
        latitude: -12.0,
        longitude: -77.0,
        year: 2007,
        description: "The Peru Earthquake in 2007.",
        intensity: "7.1",
        damageReport: CommonDetails.moderateDamage,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: CommonDetails.basicSteps
    ),
    DisasterEvent(
        title: "2009 Sumatra Earthquake",
        type: .earthquake,
        latitude: 3.3,
        longitude: 98.5,
        year: 2009,
        description: "The Sumatra Earthquake in 2009.",
        intensity: "7.2",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: CommonDetails.basicSteps
    ),
    // 9. Post-2010 events (11 items)
    DisasterEvent(
        title: "2010 Haiti Earthquake",
        type: .earthquake,
        latitude: 18.5,
        longitude: -72.3,
        year: 2010,
        description: "The Haiti Earthquake in 2010.",
        intensity: "7.0 (Richter)",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: CommonDetails.basicSteps
    ),
    DisasterEvent(
        title: "1990 Manjil–Rudbar Earthquake",
        type: .earthquake,
        latitude: 36.9,
        longitude: 49.8,
        year: 1990,
        description: "The Manjil–Rudbar Earthquake in Iran in 1990.",
        intensity: "7.4 (Richter)",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: CommonDetails.basicSteps
    ),
    DisasterEvent(
        title: "2001 Gujarat Earthquake",
        type: .earthquake,
        latitude: 23.0,
        longitude: 70.0,
        year: 2001,
        description: "The Gujarat Earthquake in India in 2001.",
        intensity: "7.7",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: CommonDetails.basicSteps
    ),
    DisasterEvent(
        title: "2004 Indian Ocean Earthquake",
        type: .earthquakeAndTsunami,
        latitude: 3.3,
        longitude: 95.8,
        year: 2004,
        description: "The Indian Ocean Earthquake and Tsunami in 2004.",
        intensity: "9.1 (Richter)",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.followLocalAuthorities,
        evacuationSteps: CommonDetails.advancedSteps
    ),
    DisasterEvent(
        title: "2015 Nepal Earthquake",
        type: .earthquake,
        latitude: 28.2,
        longitude: 84.7,
        year: 2015,
        description: "The Nepal Earthquake in 2015.",
        intensity: "7.8",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: CommonDetails.basicSteps
    ),
    DisasterEvent(
        title: "1988 Spitak Earthquake",
        type: .earthquake,
        latitude: 40.5,
        longitude: 44.6,
        year: 1988,
        description: "The Spitak Earthquake in Armenia in 1988.",
        intensity: "6.8 (Richter)",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: CommonDetails.basicSteps
    ),
    DisasterEvent(
        title: "1993 Okhotsk Sea Earthquake",
        type: .earthquake,
        latitude: 53.0,
        longitude: 142.0,
        year: 1993,
        description: "The Okhotsk Sea Earthquake in 1993.",
        intensity: "7.8 (Richter)",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: CommonDetails.basicSteps
    ),
    DisasterEvent(
        title: "2020 Aegean Sea Earthquake",
        type: .earthquake,
        latitude: 38.0,
        longitude: 26.0,
        year: 2020,
        description: "The Aegean Sea Earthquake in 2020.",
        intensity: "6.4",
        damageReport: CommonDetails.moderateDamage,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: CommonDetails.basicSteps
    ),
    DisasterEvent(
        title: "2012 West Sumatra Earthquake",
        type: .earthquake,
        latitude: -0.5,
        longitude: 100.0,
        year: 2012,
        description: "The West Sumatra Earthquake in 2012.",
        intensity: "7.0",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: CommonDetails.basicSteps
    ),
    DisasterEvent(
        title: "2007 Solomon Islands Earthquake",
        type: .earthquake,
        latitude: -9.5,
        longitude: 160.0,
        year: 2007,
        description: "The Solomon Islands Earthquake in 2007.",
        intensity: "7.1",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: CommonDetails.basicSteps
    ),
    DisasterEvent(
        title: "2011 Tohoku Tsunami",
        type: .earthquakeAndTsunami,
        latitude: 38.0,    // Approximate coastal coordinate
        longitude: 142.0,
        year: 2011,
        description: "Following the massive Tohoku earthquake, a devastating tsunami struck the coast of Japan in 2011.",
        intensity: "Wave heights up to 40 m, 9.0 (Richter)",
        damageReport: "The tsunami inundated coastal communities, causing thousands of fatalities and widespread destruction of infrastructure.",
        evacuationInstructions: "Immediately evacuate to higher ground and follow all local tsunami warnings.",
        evacuationSteps: [
            "Evacuate immediately to high ground.",
            "Listen to local emergency broadcasts.",
            "Do not return until authorities declare the area safe."
        ]
    ),
    DisasterEvent(
        title: "1883 Krakatoa Tsunami",
        type: .earthquakeAndTsunami,
        latitude: -6.1,
        longitude: 105.42,
        year: 1883,
        description: "The violent eruption of Krakatoa in 1883 triggered a massive tsunami that devastated surrounding Indonesian islands.",
        intensity: "Wave heights up to 30 m",
        damageReport: "Tsunami waves reportedly reached heights of up to 40 m in some areas, causing catastrophic coastal destruction and heavy loss of life.",
        evacuationInstructions: "If a tsunami warning is issued, immediately evacuate to higher ground and avoid coastal areas.",
        evacuationSteps: [
            "Immediately evacuate to higher ground.",
            "Follow local tsunami warnings and instructions.",
            "Stay away from the coast until the danger subsides."
        ]
    ),
    // Volcano events
    DisasterEvent(
        title: "1991 Mount Pinatubo Eruption",
        type: .volcano,
        latitude: 15.13,
        longitude: 120.35,
        year: 1991,
        description: "The eruption of Mount Pinatubo in the Philippines in 1991 was one of the largest volcanic events of the 20th century.",
        intensity: "VEI 6",
        damageReport: "The eruption produced a massive ash cloud that disrupted air travel worldwide, caused widespread agricultural damage, and triggered deadly floods and landslides.",
        evacuationInstructions: "Follow local volcanic warnings and evacuate immediately if you are within the hazard zone.",
        evacuationSteps: [
            "Monitor volcanic activity updates.",
            "Evacuate immediately if advised by local authorities.",
            "Use protective gear (e.g. N95 masks, goggles) to guard against ash."
        ]
    ),
    DisasterEvent(
        title: "2010 Eyjafjallajökull Eruption",
        type: .volcano,
        latitude: 63.63,
        longitude: -19.62,
        year: 2010,
        description: "The eruption of Eyjafjallajökull in Iceland in 2010 caused widespread disruption to air travel across Europe.",
        intensity: "VEI 4",
        damageReport: "Localized ashfall resulted in minor structural damage, while airspace closures affected millions of travelers.",
        evacuationInstructions: "Follow local authorities' instructions if you are near the eruption zone; avoid areas with heavy ashfall.",
        evacuationSteps: [
            "Monitor updates on volcanic activity.",
            "Evacuate if instructed by local officials.",
            "Stay indoors and use air filtration if ash levels are high."
        ]
    ),
    DisasterEvent(
        title: "1985 Nevado del Ruiz Eruption",
        type: .volcano,
        latitude: 4.90,
        longitude: -75.32,
        year: 1985,
        description: "The eruption of Nevado del Ruiz in Colombia in 1985 triggered a deadly lahar that buried nearby towns.",
        intensity: "VEI 3–4",
        damageReport: "The resulting lahar caused over 23,000 fatalities and widespread destruction of infrastructure in the affected region.",
        evacuationInstructions: "Immediately evacuate if a lahar warning is issued and follow local emergency procedures.",
        evacuationSteps: [
            "Evacuate immediately to higher ground.",
            "Follow local lahar warnings and instructions.",
            "Seek shelter in designated safe zones."
        ]
    ),
    // Tornado events
    DisasterEvent(
        title: "2011 Joplin Tornado",
        type: .tornado,
        latitude: 37.1,
        longitude: -94.5,
        year: 2011,
        description: "A devastating tornado struck Joplin, Missouri in 2011, causing widespread destruction and significant fatalities.",
        intensity: "EF5",
        damageReport: "The tornado caused catastrophic damage, with over 150 fatalities, thousands injured, and numerous buildings completely destroyed.",
        evacuationInstructions: "When a tornado warning is issued, seek shelter immediately in a basement or an interior room on the lowest floor away from windows.",
        evacuationSteps: [
            "Immediately take cover in a sturdy shelter.",
            "If outdoors, lie flat in a low-lying area and cover your head.",
            "Follow local emergency alerts and instructions."
        ]
    ),
    DisasterEvent(
        title: "2013 Moore Tornado",
        type: .tornado,
        latitude: 35.33,
        longitude: -97.5,
        year: 2013,
        description: "A violent tornado struck Moore, Oklahoma in 2013, causing severe damage and significant fatalities.",
        intensity: "EF5",
        damageReport: "The tornado resulted in catastrophic damage, with hundreds of fatalities and extensive destruction of homes, businesses, and infrastructure.",
        evacuationInstructions: "Immediately seek shelter in a basement or a designated storm shelter when a tornado warning is issued.",
        evacuationSteps: [
            "Take cover in a secure, windowless area.",
            "If outside, lie flat and protect your head.",
            "Follow instructions from local emergency services."
        ]
    ),
    DisasterEvent(
        title: "2019 Nashville Tornado",
        type: .tornado,
        latitude: 36.15,
        longitude: -86.78,
        year: 2019,
        description: "A powerful tornado struck the Nashville area in 2019, causing extensive damage to residential and commercial areas.",
        intensity: "EF4",
        damageReport: "The tornado caused significant structural damage, with numerous buildings destroyed and several fatalities reported.",
        evacuationInstructions: "Immediately seek shelter in a designated storm shelter or a secure building interior when a tornado warning is issued.",
        evacuationSteps: [
            "Seek shelter in a basement or interior room away from windows.",
            "Cover your head and neck with protective gear.",
            "Stay indoors until the warning is lifted."
        ]
    ),
    DisasterEvent(
        title: "2020 Easter Tornado Outbreak",
        type: .tornado,
        latitude: 33.5,
        longitude: -86.8,
        year: 2020,
        description: "A series of violent tornadoes during the 2020 Easter outbreak in the Southeastern United States caused widespread damage.",
        intensity: "EF4",
        damageReport: "Multiple tornadoes resulted in extensive damage to buildings and infrastructure, causing several fatalities and numerous injuries.",
        evacuationInstructions: "When tornado warnings are issued, immediately take shelter in a secure building or storm shelter.",
        evacuationSteps: [
            "Immediately move to a safe interior location away from windows.",
            "If outdoors, lie in a low-lying area and protect your head.",
            "Follow local emergency warnings and instructions."
        ]
    )
]
