package com.hotelsto.simulation.calculator;

import com.hotelsto.simulation.dto.DividendInput;
import com.hotelsto.simulation.dto.DividendResult;
import com.hotelsto.simulation.exception.InvalidSimulationInputException;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.math.RoundingMode;

@Component
public class DividendCalculator {
    public DividendResult calculate(DividendInput input) {
        if (input.ownershipRatio().compareTo(BigDecimal.ZERO) < 0 || input.ownershipRatio().compareTo(BigDecimal.ONE) > 0) throw new InvalidSimulationInputException("ownershipRatio must be between 0 and 1");
        if (input.investmentAmount().compareTo(BigDecimal.ZERO) <= 0) throw new InvalidSimulationInputException("investmentAmount must be greater than 0");
        BigDecimal safeProfit = input.distributableProfit().max(BigDecimal.ZERO);
        BigDecimal investorDividend = safeProfit.multiply(input.ownershipRatio()).setScale(0, RoundingMode.HALF_UP);
        BigDecimal monthlyRoi = investorDividend.divide(input.investmentAmount(), 10, RoundingMode.HALF_UP).multiply(BigDecimal.valueOf(100)).setScale(2, RoundingMode.HALF_UP);
        BigDecimal annualizedRoi = monthlyRoi.multiply(BigDecimal.valueOf(12)).setScale(2, RoundingMode.HALF_UP);
        return new DividendResult(investorDividend, monthlyRoi, annualizedRoi);
    }
}
