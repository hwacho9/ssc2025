//
//  Models.swift
//  ssc2025
//
//  Created by 조성화 on 2025/02/19.
//

// Models.swift

import SwiftUI

enum EventType {
    case earthquake, volcano
}

struct DisasterEvent: Identifiable {
    let id = UUID()
    let title: String
    let type: EventType
    let latitude: Double
    let longitude: Double
    let year: Int   // 음수: 기원전, 양수: 기원후
    let description: String
    let evacuationInstructions: String
}

let sampleEvents: [DisasterEvent] = [
    DisasterEvent(
        title: "Ancient Anatolian Earthquake",
        type: .earthquake,
        latitude: 39.0,
        longitude: 35.0,
        year: -100,
        description: "기원전 100년, Anatolia 지역에서 발생한 강진.",
        evacuationInstructions: "전통적인 대피소로 대피하세요."
    ),
    DisasterEvent(
        title: "Mount Vesuvius Eruption",
        type: .volcano,
        latitude: 40.821,
        longitude: 14.426,
        year: 79,
        description: "AD 79년, 베수비오 화산 폭발로 폼페이 파괴.",
        evacuationInstructions: "화산 폭발 경보 시 즉시 대피하세요."
    ),
    DisasterEvent(
        title: "1755 Lisbon Earthquake",
        type: .earthquake,
        latitude: 38.7,
        longitude: -9.1,
        year: 1755,
        description: "1755년 리스본 대지진.",
        evacuationInstructions: "건물 밖으로 빠르게 대피하세요."
    ),
    DisasterEvent(
        title: "1906 San Francisco Earthquake",
        type: .earthquake,
        latitude: 37.8,
        longitude: -122.4,
        year: 1906,
        description: "1906년 샌프란시스코 대지진.",
        evacuationInstructions: "안전한 지역으로 대피하고, 긴급 구조를 요청하세요."
    ),
    DisasterEvent(
        title: "1960 Valdivia Earthquake",
        type: .earthquake,
        latitude: -38.3,
        longitude: -73.0,
        year: 1960,
        description: "역사상 가장 강력한 지진, 칠레 발디비아 지진.",
        evacuationInstructions: "즉각적인 대피 및 구조 요청 필요."
    ),
    DisasterEvent(
        title: "Modern Volcano Eruption",
        type: .volcano,
        latitude: 19.5,
        longitude: -155.6,
        year: 2000,
        description: "2000년대 현대 화산 폭발 사건.",
        evacuationInstructions: "화산 활동 지역에서 멀리 떨어진 안전 지역으로 대피하세요."
    )
]
