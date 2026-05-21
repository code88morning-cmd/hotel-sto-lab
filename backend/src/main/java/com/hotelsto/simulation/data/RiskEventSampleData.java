package com.hotelsto.simulation.data;

import com.hotelsto.simulation.dto.RiskEvent;

import java.math.BigDecimal;
import java.util.List;

public class RiskEventSampleData {
    public static List<RiskEvent> getRiskEvents() {
        return List.of(
            new RiskEvent("RISK-001", "성수기 관광객 증가", "POSITIVE", "occupancyRate", "ADD_RATE", new BigDecimal("0.15"), "성수기 수요 증가로 객실 점유율이 상승합니다.", "점유율 상승은 객실매출 증가로 이어질 수 있습니다."),
            new RiskEvent("RISK-002", "지역 축제 개최", "POSITIVE", "adr", "MULTIPLY_AMOUNT", new BigDecimal("0.10"), "지역 이벤트로 평균 객실단가가 상승합니다.", "ADR 상승은 객실매출과 배당가능이익 증가로 이어질 수 있습니다."),
            new RiskEvent("RISK-004", "기상 악화", "NEGATIVE", "occupancyRate", "ADD_RATE", new BigDecimal("-0.25"), "기상 악화로 관광 수요가 감소하고 객실 점유율이 하락합니다.", "점유율 하락은 객실매출 감소로 이어지고 배당가능이익과 예상 배당금도 줄어들 수 있습니다."),
            new RiskEvent("RISK-005", "OTA 수수료 인상", "NEGATIVE", "operatingCostRate", "ADD_RATE", new BigDecimal("0.05"), "판매 채널 수수료 증가로 운영비율이 상승합니다.", "운영비율 상승은 영업이익과 배당가능이익 감소로 이어질 수 있습니다.")
        );
    }
}
