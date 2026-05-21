package com.hotelsto.simulation.calculator;

import com.hotelsto.simulation.dto.*;
import org.springframework.stereotype.Component;

@Component
public class FullSimulationCalculator {
    private final HotelRevenueCalculator hotelRevenueCalculator;
    private final TokenOfferingCalculator tokenOfferingCalculator;
    private final DividendCalculator dividendCalculator;

    public FullSimulationCalculator(HotelRevenueCalculator hotelRevenueCalculator, TokenOfferingCalculator tokenOfferingCalculator, DividendCalculator dividendCalculator) {
        this.hotelRevenueCalculator = hotelRevenueCalculator;
        this.tokenOfferingCalculator = tokenOfferingCalculator;
        this.dividendCalculator = dividendCalculator;
    }

    public FullSimulationResult calculate(FullSimulationInput input) {
        HotelRevenueResult revenue = hotelRevenueCalculator.calculate(new HotelRevenueInput(input.roomCount(), input.operatingDays(), input.occupancyRate(), input.adr(), input.additionalRevenueRate(), input.operatingCostRate(), input.reserveRate()));
        TokenOfferingResult token = tokenOfferingCalculator.calculate(new TokenOfferingInput(input.totalOfferingAmount(), input.tokenPrice(), input.investmentAmount()));
        DividendResult dividend = dividendCalculator.calculate(new DividendInput(revenue.distributableProfit(), token.ownershipRatio(), input.investmentAmount()));
        return new FullSimulationResult(revenue, token, dividend, "객실 운영성과로 계산된 배당가능이익이 사용자의 보유비율에 따라 배당금으로 환산되었습니다.", "본 결과는 교육용 시뮬레이션이며 실제 투자 수익 또는 배당 지급을 의미하지 않습니다.");
    }
}
