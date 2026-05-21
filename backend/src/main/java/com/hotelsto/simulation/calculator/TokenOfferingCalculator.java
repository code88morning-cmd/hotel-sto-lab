package com.hotelsto.simulation.calculator;

import com.hotelsto.simulation.dto.TokenOfferingInput;
import com.hotelsto.simulation.dto.TokenOfferingResult;
import com.hotelsto.simulation.exception.InvalidSimulationInputException;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.math.RoundingMode;

@Component
public class TokenOfferingCalculator {
    public TokenOfferingResult calculate(TokenOfferingInput input) {
        if (input.totalOfferingAmount().compareTo(BigDecimal.ZERO) <= 0) throw new InvalidSimulationInputException("totalOfferingAmount must be greater than 0");
        if (input.tokenPrice().compareTo(BigDecimal.ZERO) <= 0) throw new InvalidSimulationInputException("tokenPrice must be greater than 0");
        if (input.investmentAmount().compareTo(BigDecimal.ZERO) <= 0) throw new InvalidSimulationInputException("investmentAmount must be greater than 0");
        BigDecimal totalTokenSupply = input.totalOfferingAmount().divide(input.tokenPrice(), 0, RoundingMode.DOWN);
        BigDecimal userTokenQuantity = input.investmentAmount().divide(input.tokenPrice(), 0, RoundingMode.DOWN);
        BigDecimal ownershipRatio = userTokenQuantity.divide(totalTokenSupply, 10, RoundingMode.HALF_UP);
        BigDecimal ownershipRatioPercent = ownershipRatio.multiply(BigDecimal.valueOf(100)).setScale(3, RoundingMode.HALF_UP);
        return new TokenOfferingResult(totalTokenSupply, userTokenQuantity, ownershipRatio, ownershipRatioPercent, ownershipRatio);
    }
}
