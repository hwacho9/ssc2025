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
    // 1. 고대 사건들 (5개)
    DisasterEvent(
        title: "Ancient Anatolian Earthquake",
        type: .earthquake,
        latitude: 39.0,
        longitude: 35.0,
        year: -100,
        description: "기원전 100년, Anatolia 지역에서 발생한 강진.",
        intensity: "진도 7 (MMI 기준)",
        damageReport: "전통 건축물 대파괴, 수많은 인명 피해 추정. " + CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
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
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: CommonDetails.advancedSteps
    ),
    DisasterEvent(
        title: "Ancient Egyptian Earthquake",
        type: .earthquake,
        latitude: 30.0,
        longitude: 31.2,
        year: -200,
        description: "기원전 200년, 이집트 지역에서 발생한 강진.",
        intensity: "진도 6 (MMI 기준)",
        damageReport: "피라미드 주변 건축물에 일부 손상 발생. " + CommonDetails.moderateDamage,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "즉시 실내에서 대피",
            "강가로 이동",
            "대피소에서 추가 지시 확인"
        ]
    ),
    DisasterEvent(
        title: "Ancient Greek Earthquake",
        type: .earthquake,
        latitude: 37.9,
        longitude: 23.7,
        year: -300,
        description: "기원전 300년, 그리스 지역에서 발생한 지진.",
        intensity: "진도 7 (MMI 기준)",
        damageReport: "고대 건축물 파손, 문화재 손실 우려. " + CommonDetails.moderateDamage,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "실내 대피",
            "열린 광장으로 이동",
            "현지 관리인의 지시 따르기"
        ]
    ),
    DisasterEvent(
        title: "Ancient Roman Earthquake",
        type: .earthquake,
        latitude: 41.9,
        longitude: 12.5,
        year: -50,
        description: "기원전 50년, 로마에서 발생한 대지진.",
        intensity: "진도 7.5 (MMI 기준)",
        damageReport: "도시 전역에 건물 붕괴, 많은 인명 피해. " + CommonDetails.severeCollapse,
        evacuationInstructions: "즉시 로마 외곽으로 대피.",
        evacuationSteps: [
            "건물 대피",
            "로마 외곽으로 이동",
            "안전 지역에서 추가 지시 확인"
        ]
    ),
    // 2. 중세 ~ 르네상스 시대 (2개)
    DisasterEvent(
        title: "Medieval European Earthquake",
        type: .earthquake,
        latitude: 48.8,
        longitude: 2.3,
        year: 1200,
        description: "중세 유럽, 파리 근교에서 발생한 강진.",
        intensity: "진도 6.5",
        damageReport: "교회 및 성벽에 일부 손상 발생. " + CommonDetails.moderateDamage,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "즉시 건물 밖으로 대피",
            "공공 광장으로 이동",
            "지역 경비대의 지시 따르기"
        ]
    ),
    DisasterEvent(
        title: "Medieval Islamic Earthquake",
        type: .earthquake,
        latitude: 35.7,
        longitude: 51.4,
        year: 1300,
        description: "중세 이슬람 지역, 테헤란 근처에서 발생한 지진.",
        intensity: "진도 7 (MMI 기준)",
        damageReport: "전통 건축물 파손 및 시장 붕괴. " + CommonDetails.moderateDamage,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "신속 대피",
            "안전한 곳으로 이동",
            "지역 당국의 지시 따르기"
        ]
    ),
    DisasterEvent(
        title: "Renaissance Italian Earthquake",
        type: .earthquake,
        latitude: 43.8,
        longitude: 11.3,
        year: 1500,
        description: "르네상스 시대, 이탈리아에서 발생한 강진.",
        intensity: "진도 6.8",
        damageReport: "미술관 및 건축물 일부 파손. " + CommonDetails.moderateDamage,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "건물 밖으로 대피",
            "안전 지역으로 이동",
            "응급 구조 요청"
        ]
    ),
    // 3. 17~19세기 사건들 (3개)
    DisasterEvent(
        title: "17th Century Dutch Earthquake",
        type: .earthquake,
        latitude: 52.4,
        longitude: 4.9,
        year: 1650,
        description: "17세기 네덜란드, 암스테르담 인근에서 발생한 소규모 지진.",
        intensity: "진도 5.5",
        damageReport: "경미한 건물 손상 및 창문 파손. " + CommonDetails.moderateDamage,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "즉시 대피",
            "열린 광장으로 이동",
            "지역 당국의 지시 확인"
        ]
    ),
    DisasterEvent(
        title: "18th Century British Earthquake",
        type: .earthquake,
        latitude: 51.5,
        longitude: -0.1,
        year: 1750,
        description: "18세기 영국, 런던에서 발생한 강진.",
        intensity: "진도 6.0",
        damageReport: "주요 건물 일부 파손 및 유리창 파손. " + CommonDetails.moderateDamage,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "건물 대피",
            "안전 지역으로 이동",
            "응급 구조 요청"
        ]
    ),
    DisasterEvent(
        title: "19th Century Russian Earthquake",
        type: .earthquake,
        latitude: 55.7,
        longitude: 37.6,
        year: 1880,
        description: "19세기 러시아, 모스크바 인근에서 발생한 지진.",
        intensity: "진도 6.5",
        damageReport: "전통 건축물에 일부 파손 발생. " + CommonDetails.moderateDamage,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "즉시 건물 밖으로 대피",
            "안전 지역으로 이동",
            "응급 구조대에 연락"
        ]
    ),
    // 4. 20세기 초 사건들 (4개)
    DisasterEvent(
        title: "1900 Philippine Earthquake",
        type: .earthquake,
        latitude: 14.6,
        longitude: 121.0,
        year: 1900,
        description: "1900년 필리핀에서 발생한 대지진.",
        intensity: "진도 7.0",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "즉시 대피",
            "고지대로 이동",
            "지역 당국 지시 따르기"
        ]
    ),
    DisasterEvent(
        title: "1912 Balkan Earthquake",
        type: .earthquake,
        latitude: 42.7,
        longitude: 21.1,
        year: 1912,
        description: "1912년 발칸 반도에서 발생한 대지진.",
        intensity: "진도 7.2",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "즉시 대피",
            "열린 공간으로 이동",
            "지역 응급 서비스 연락"
        ]
    ),
    DisasterEvent(
        title: "1923 Great Kanto Earthquake",
        type: .earthquake,
        latitude: 35.7,
        longitude: 139.7,
        year: 1923,
        description: "1923년 일본 관동 대지진.",
        intensity: "규모 7.9 (리히터)",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "즉시 대피",
            "안전 지역으로 이동",
            "응급 구조대 지시 확인"
        ]
    ),
    DisasterEvent(
        title: "1933 Long Beach Earthquake",
        type: .earthquake,
        latitude: 33.8,
        longitude: -118.2,
        year: 1933,
        description: "1933년 롱비치에서 발생한 지진.",
        intensity: "진도 6.4",
        damageReport: CommonDetails.moderateDamage,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "건물 대피",
            "안전한 곳으로 이동",
            "지역 당국의 지시 따르기"
        ]
    ),
    // 5. 1948년 ~ 1950 사건들 (2개)
    DisasterEvent(
        title: "1948 Ashgabat Earthquake",
        type: .earthquake,
        latitude: 37.9,
        longitude: 58.4,
        year: 1948,
        description: "1948년 아슈하바트에서 발생한 강진.",
        intensity: "진도 8.1",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "즉시 건물 밖으로 대피",
            "임시 대피소로 이동",
            "국제 구조대 연락"
        ]
    ),
    DisasterEvent(
        title: "1950 Indian Earthquake",
        type: .earthquake,
        latitude: 20.0,
        longitude: 77.0,
        year: 1950,
        description: "1950년 인도 중부에서 발생한 강진.",
        intensity: "진도 7.0",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "즉시 대피",
            "농촌 지역을 벗어나기",
            "지역 당국과 연락"
        ]
    ),
    // 6. 1960년대 ~ 1980년대 사건들 (4개)
    DisasterEvent(
        title: "1964 Alaska Earthquake",
        type: .earthquake,
        latitude: 61.0,
        longitude: -147.7,
        year: 1964,
        description: "1964년 알래스카에서 발생한 대지진.",
        intensity: "규모 9.2 (리히터)",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "즉시 건물 밖으로 대피",
            "높은 지대로 이동",
            "지역 당국의 지시 따르기"
        ]
    ),
    DisasterEvent(
        title: "1976 Tangshan Earthquake",
        type: .earthquake,
        latitude: 39.6,
        longitude: 118.2,
        year: 1976,
        description: "1976년 중국 탕산에서 발생한 대지진.",
        intensity: "규모 7.5 (리히터)",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "즉시 대피",
            "안전 지역으로 이동",
            "응급 구조 요청"
        ]
    ),
    DisasterEvent(
        title: "1980 El Asnam Earthquake",
        type: .earthquake,
        latitude: 35.4,
        longitude: 1.5,
        year: 1980,
        description: "1980년 알제리 엘아스남에서 발생한 강진.",
        intensity: "진도 7.3",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "즉시 건물 대피",
            "안전 지역으로 이동",
            "응급 구조대 연락"
        ]
    ),
    DisasterEvent(
        title: "1989 Loma Prieta Earthquake",
        type: .earthquake,
        latitude: 37.0,
        longitude: -122.0,
        year: 1989,
        description: "1989년 로마 프리에타 지진.",
        intensity: "규모 6.9 (리히터)",
        damageReport: CommonDetails.moderateDamage,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "즉시 건물 밖으로 대피",
            "안전한 지역으로 이동",
            "응급 구조대에 연락"
        ]
    ),
    // 7. 1990년대 사건들 (4개)
    DisasterEvent(
        title: "1994 Northridge Earthquake",
        type: .earthquake,
        latitude: 34.2,
        longitude: -118.5,
        year: 1994,
        description: "1994년 노스리지 지진.",
        intensity: "규모 6.7 (리히터)",
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
        description: "1995년 일본 고베에서 발생한 대지진.",
        intensity: "규모 6.9 (리히터)",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.followLocalAuthorities,
        evacuationSteps: [
            "신속하게 건물 밖으로 대피",
            "임시 대피소나 공공 집결지로 이동",
            "응급 구조대와 통신 유지 및 추가 지시 확인"
        ]
    ),
    DisasterEvent(
        title: "1999 İzmit Earthquake",
        type: .earthquake,
        latitude: 40.8,
        longitude: 29.7,
        year: 1999,
        description: "1999년 터키 İzmit 지역에서 발생한 대지진.",
        intensity: "규모 7.6 (리히터)",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "즉시 안전한 지역으로 이동",
            "대피소 집결",
            "지역 구조대와 연락 유지"
        ]
    ),
    DisasterEvent(
        title: "2011 Tohoku Earthquake",
        type: .earthquake,
        latitude: 38.3,
        longitude: 142.4,
        year: 2011,
        description: "2011년 일본 동북부에서 발생한 강진과 쓰나미, 후속 원전 사고 포함.",
        intensity: "규모 9.0 (리히터)",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "즉각적으로 고지대로 대피",
            "쓰나미 경보 후 안전 지역에 집결",
            "지역 당국의 추가 지시를 철저히 준수"
        ]
    ),
    // 8. 2000년대 초기 사건들 (5개)
    DisasterEvent(
        title: "2002 Iran Earthquake",
        type: .earthquake,
        latitude: 35.7,
        longitude: 51.4,
        year: 2002,
        description: "2002년 이란에서 발생한 지진.",
        intensity: "진도 6.5",
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
        description: "2003년 이란 밤에서 발생한 강진.",
        intensity: "진도 6.6",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: [
            "즉시 건물 밖으로 대피",
            "임시 대피소로 이동",
            "지역 당국의 지시 따르기"
        ]
    ),
    DisasterEvent(
        title: "2005 Pakistan Earthquake",
        type: .earthquake,
        latitude: 34.0,
        longitude: 73.0,
        year: 2005,
        description: "2005년 파키스탄에서 발생한 강진.",
        intensity: "진도 7.6",
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
        description: "2007년 페루에서 발생한 강진.",
        intensity: "진도 7.1",
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
        description: "2009년 수마트라에서 발생한 강진.",
        intensity: "진도 7.2",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: CommonDetails.basicSteps
    ),
    // 9. 2010년 이후 사건들 (11개)
    DisasterEvent(
        title: "2010 Haiti Earthquake",
        type: .earthquake,
        latitude: 18.5,
        longitude: -72.3,
        year: 2010,
        description: "2010년 아이티에서 발생한 대지진.",
        intensity: "규모 7.0 (리히터)",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: CommonDetails.basicSteps
    ),
    // 추가 근대 지진 (추가 9개)
    DisasterEvent(
        title: "1990 Manjil–Rudbar Earthquake",
        type: .earthquake,
        latitude: 36.9,
        longitude: 49.8,
        year: 1990,
        description: "1990년 이란 Manjil–Rudbar 지역에서 발생한 강진.",
        intensity: "규모 7.4 (리히터)",
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
        description: "2001년 인도 Gujarat 지역에서 발생한 강진.",
        intensity: "진도 7.7",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: CommonDetails.basicSteps
    ),
    DisasterEvent(
        title: "2004 Indian Ocean Earthquake",
        type: .earthquake,
        latitude: 3.3,
        longitude: 95.8,
        year: 2004,
        description: "2004년 인도양에서 발생한 강진 및 쓰나미.",
        intensity: "규모 9.1 (리히터)",
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
        description: "2015년 네팔에서 발생한 강진.",
        intensity: "진도 7.8",
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
        description: "1988년 아르메니아 Spitak에서 발생한 강진.",
        intensity: "규모 6.8 (리히터)",
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
        description: "1993년 옥호츠크 해에서 발생한 강진.",
        intensity: "규모 7.8 (리히터)",
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
        description: "2020년 에게해에서 발생한 강진.",
        intensity: "진도 6.4",
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
        description: "2012년 서수마트라에서 발생한 강진.",
        intensity: "진도 7.0",
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
        description: "2007년 솔로몬 제도에서 발생한 강진.",
        intensity: "진도 7.1",
        damageReport: CommonDetails.severeCollapse,
        evacuationInstructions: CommonDetails.immediateEvacuation,
        evacuationSteps: CommonDetails.basicSteps
    )
]
