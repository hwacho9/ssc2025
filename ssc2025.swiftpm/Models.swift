//
//  Models.swift
//  ssc2025
//
//  Created by 조성화 on 2025/02/19.
//

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
    let intensity: String         // 예: "진도 7", "VEI 5" 등
    let damageReport: String      // 피해 기록 상세 설명
    let evacuationInstructions: String  // 간단한 대피 지침
    let evacuationSteps: [String] // 순차적인 대피 단계 및 주의사항
}

let sampleEvents: [DisasterEvent] = [
    DisasterEvent(
        title: "Ancient Anatolian Earthquake",
        type: .earthquake,
        latitude: 39.0,
        longitude: 35.0,
        year: -100,
        description: "기원전 100년, Anatolia 지역에서 발생한 강진.",
        intensity: "진도 7 (MMI 기준)",
        damageReport: "전통 건축물 대파괴, 수많은 인명 피해 추정.",
        evacuationInstructions: "전통적인 대피소로 대피하세요.",
        evacuationSteps: [
            "즉시 실내의 튼튼한 구조물 아래로 대피",
            "밖으로 나가기 전 주변 상황을 확인",
            "대피소로 이동하여 안전 여부 확인"
        ]
    ),
    DisasterEvent(
        title: "Mount Vesuvius Eruption",
        type: .volcano,
        latitude: 40.821,
        longitude: 14.426,
        year: 79,
        description: "AD 79년, 베수비오 화산 폭발로 폼페이 파괴.",
        intensity: "VEI 5",
        damageReport: "화산재와 용암으로 인한 대규모 피해, 수천 명의 희생.",
        evacuationInstructions: "화산 폭발 경보 시 즉시 대피하세요.",
        evacuationSteps: [
            "화산 경보 확인 후 즉시 주변에서 벗어나기",
            "안전한 고지대로 대피",
            "대피소에서 추가 지시를 기다리기"
        ]
    ),
    DisasterEvent(
        title: "1755 Lisbon Earthquake",
        type: .earthquake,
        latitude: 38.7,
        longitude: -9.1,
        year: 1755,
        description: "1755년 리스본 대지진.",
        intensity: "추정 진도 8",
        damageReport: "리스본 전역에 광범위한 피해와 대형 화재 발생.",
        evacuationInstructions: "건물 밖으로 빠르게 대피하세요.",
        evacuationSteps: [
            "즉시 야외로 안전하게 이동",
            "인근 대피소 또는 열린 광장으로 집결",
            "응급 구조팀의 안내에 따르기"
        ]
    ),
    DisasterEvent(
        title: "1906 San Francisco Earthquake",
        type: .earthquake,
        latitude: 37.8,
        longitude: -122.4,
        year: 1906,
        description: "1906년 샌프란시스코 대지진.",
        intensity: "규모 7.8 (리히터)",
        damageReport: "대규모 건물 붕괴 및 도심 화재 발생.",
        evacuationInstructions: "안전한 지역으로 대피하고 긴급 구조 요청하세요.",
        evacuationSteps: [
            "신속하게 건물 밖으로 대피",
            "도로와 공원 등 개방된 공간으로 이동",
            "지역 응급 서비스에 연락"
        ]
    ),
    DisasterEvent(
        title: "1960 Valdivia Earthquake",
        type: .earthquake,
        latitude: -38.3,
        longitude: -73.0,
        year: 1960,
        description: "역사상 가장 강력한 지진, 칠레 발디비아 지진.",
        intensity: "규모 9.5 (리히터)",
        damageReport: "전례 없는 피해와 쓰나미 발생, 광범위한 파괴.",
        evacuationInstructions: "즉각적인 대피 및 구조 요청이 필요합니다.",
        evacuationSteps: [
            "즉시 높은 지대로 대피",
            "해안가 및 저지대를 멀리하기",
            "지역 대피소 및 구조대의 지시에 따르기"
        ]
    ),
    DisasterEvent(
        title: "Modern Volcano Eruption",
        type: .volcano,
        latitude: 19.5,
        longitude: -155.6,
        year: 2000,
        description: "2000년대 현대 화산 폭발 사건.",
        intensity: "VEI 4",
        damageReport: "국지적이지만 심각한 피해 발생, 화산재와 용암 흐름 주의.",
        evacuationInstructions: "화산 활동 지역에서 멀리 떨어진 안전 지역으로 대피하세요.",
        evacuationSteps: [
            "화산 활동 경보 확인",
            "즉시 지정된 대피 경로를 따라 이동",
            "지역 당국의 추가 지시를 따르기"
        ]
    )
]
