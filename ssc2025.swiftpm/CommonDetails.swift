//
//  CommonDetails.swift
//  ssc2025
//
//  Created by 조성화 on 2025/02/21.
//

import Foundation

struct CommonDetails {
    // Damage Report (피해 기록)
    static let severeCollapse = "건물이 대규모로 붕괴되었으며, 인프라에 심각한 손상이 발생했습니다."
    static let widespreadFire = "광범위한 화재와 함께 도시 전역에 피해가 발생했습니다."
    static let moderateDamage = "일부 건물과 인프라에 경미한 손상이 발생했습니다."
    
    // Evacuation Instructions (대피 지침)
    static let immediateEvacuation = "즉시 안전한 지역으로 대피하세요."
    static let followLocalAuthorities = "지역 당국의 지시에 따라 신속하게 대피하세요."
    
    // Evacuation Steps (대피 단계 및 주의사항)
    static let basicSteps = [
        "즉시 건물 밖으로 대피",
        "안전 지역으로 이동",
        "지역 응급 서비스에 연락"
    ]
    
    static let advancedSteps = [
        "즉시 건물 밖으로 대피",
        "안전한 고지대로 이동",
        "지역 당국의 지시를 철저히 준수"
    ]
}
