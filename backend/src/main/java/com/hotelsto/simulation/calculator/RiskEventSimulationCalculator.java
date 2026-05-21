package com.hotelsto.simulation.calculator;

import com.hotelsto.simulation.dto.*;
import org.springframework.stereotype.Component;

@Component
public class RiskEventSimulationCalculator {
    private final FullSimulationCalculator fullSimulationCalculator;
    private final RiskEventApplier riskEventApplier;

    public RiskEventSimulationCalculator(FullSimulationCalculator fullSimulationCalculator, RiskEventApplier riskEventApplier) {
        this.fullSimulationCalculator = fullSimulationCalculator;
        this.riskEventApplier = riskEventApplier;
    }

    public RiskEventSimulationResult calculate(FullSimulationInput input, RiskEvent riskEvent) {
        FullSimulationResult beforeResult = fullSimulationCalculator.calculate(input);
        FullSimulationInput adjustedInput = riskEventApplier.apply(input, riskEvent);
        FullSimulationResult afterResult = fullSimulationCalculator.calculate(adjustedInput);
        RiskEventSimulationSnapshot before = toSnapshot(input, beforeResult);
        RiskEventSimulationSnapshot after = toSnapshot(adjustedInput, afterResult);
        RiskEventSimulationDifference diff = new RiskEventSimulationDifference(after.distributableProfit().subtract(before.distributableProfit()), after.investorDividend().subtract(before.investorDividend()), after.monthlyRoi().subtract(before.monthlyRoi()));
        return new RiskEventSimulationResult(riskEvent, before, after, diff, riskEvent.educationComment(), "본 결과는 교육용 시뮬레이션이며 실제 투자 수익 또는 배당 지급을 의미하지 않습니다.");
    }
    private RiskEventSimulationSnapshot toSnapshot(FullSimulationInput input, FullSimulationResult result) {
        return new RiskEventSimulationSnapshot(input.occupancyRate(), input.adr(), input.operatingCostRate(), result.revenue().distributableProfit(), result.dividend().investorDividend(), result.dividend().monthlyRoi());
    }
}
