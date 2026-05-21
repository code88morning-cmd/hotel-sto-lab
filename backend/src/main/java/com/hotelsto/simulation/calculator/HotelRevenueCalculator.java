package com.hotelsto.simulation.calculator;

import com.hotelsto.simulation.dto.HotelRevenueInput;
import com.hotelsto.simulation.dto.HotelRevenueResult;
import com.hotelsto.simulation.exception.InvalidSimulationInputException;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.math.RoundingMode;

@Component
public class HotelRevenueCalculator {
    public HotelRevenueResult calculate(HotelRevenueInput input) {
        validate(input);
        BigDecimal roomRevenue = BigDecimal.valueOf(input.roomCount())
                .multiply(BigDecimal.valueOf(input.operatingDays()))
                .multiply(input.occupancyRate())
                .multiply(input.adr());
        BigDecimal additionalRevenue = roomRevenue.multiply(input.additionalRevenueRate());
        BigDecimal totalRevenue = roomRevenue.add(additionalRevenue);
        BigDecimal operatingCost = totalRevenue.multiply(input.operatingCostRate());
        BigDecimal operatingProfit = totalRevenue.subtract(operatingCost);
        BigDecimal reserveAmount = operatingProfit.multiply(input.reserveRate());
        BigDecimal distributableProfit = operatingProfit.subtract(reserveAmount);
        if (distributableProfit.compareTo(BigDecimal.ZERO) < 0) distributableProfit = BigDecimal.ZERO;
        return new HotelRevenueResult(
                roomRevenue.setScale(0, RoundingMode.HALF_UP),
                additionalRevenue.setScale(0, RoundingMode.HALF_UP),
                totalRevenue.setScale(0, RoundingMode.HALF_UP),
                operatingCost.setScale(0, RoundingMode.HALF_UP),
                operatingProfit.setScale(0, RoundingMode.HALF_UP),
                reserveAmount.setScale(0, RoundingMode.HALF_UP),
                distributableProfit.setScale(0, RoundingMode.HALF_UP)
        );
    }
    private void validate(HotelRevenueInput input) {
        if (input.roomCount() <= 0) throw new InvalidSimulationInputException("roomCount must be greater than 0");
        if (input.operatingDays() <= 0 || input.operatingDays() > 31) throw new InvalidSimulationInputException("operatingDays must be between 1 and 31");
        if (input.occupancyRate().compareTo(BigDecimal.ZERO) < 0 || input.occupancyRate().compareTo(BigDecimal.ONE) > 0) throw new InvalidSimulationInputException("occupancyRate must be between 0 and 1");
        if (input.adr().compareTo(BigDecimal.ZERO) <= 0) throw new InvalidSimulationInputException("adr must be greater than 0");
    }
}
