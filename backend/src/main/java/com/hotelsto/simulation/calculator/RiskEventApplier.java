package com.hotelsto.simulation.calculator;

import com.hotelsto.simulation.dto.FullSimulationInput;
import com.hotelsto.simulation.dto.RiskEvent;
import com.hotelsto.simulation.exception.InvalidSimulationInputException;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.math.RoundingMode;

@Component
public class RiskEventApplier {
    public FullSimulationInput apply(FullSimulationInput input, RiskEvent event) {
        return switch (event.targetVariable()) {
            case "occupancyRate" -> copy(input, clamp(input.occupancyRate().add(event.impactValue()), BigDecimal.ZERO, BigDecimal.ONE), input.adr(), input.operatingCostRate(), input.additionalRevenueRate(), input.roomCount(), input.reserveRate());
            case "adr" -> copy(input, input.occupancyRate(), input.adr().multiply(BigDecimal.ONE.add(event.impactValue())).setScale(0, RoundingMode.HALF_UP), input.operatingCostRate(), input.additionalRevenueRate(), input.roomCount(), input.reserveRate());
            case "operatingCostRate" -> copy(input, input.occupancyRate(), input.adr(), clamp(input.operatingCostRate().add(event.impactValue()), BigDecimal.ZERO, BigDecimal.ONE), input.additionalRevenueRate(), input.roomCount(), input.reserveRate());
            case "additionalRevenueRate" -> copy(input, input.occupancyRate(), input.adr(), input.operatingCostRate(), input.additionalRevenueRate().add(event.impactValue()).max(BigDecimal.ZERO), input.roomCount(), input.reserveRate());
            case "roomCount" -> copy(input, input.occupancyRate(), input.adr(), input.operatingCostRate(), input.additionalRevenueRate(), Math.max(1, BigDecimal.valueOf(input.roomCount()).multiply(BigDecimal.ONE.add(event.impactValue())).setScale(0, RoundingMode.DOWN).intValue()), input.reserveRate());
            case "reserveRate" -> copy(input, input.occupancyRate(), input.adr(), input.operatingCostRate(), input.additionalRevenueRate(), input.roomCount(), clamp(input.reserveRate().add(event.impactValue()), BigDecimal.ZERO, BigDecimal.ONE));
            default -> throw new InvalidSimulationInputException("Unsupported target variable: " + event.targetVariable());
        };
    }
    private FullSimulationInput copy(FullSimulationInput i, BigDecimal occ, BigDecimal adr, BigDecimal cost, BigDecimal add, int rooms, BigDecimal reserve) {
        return new FullSimulationInput(rooms, i.operatingDays(), occ, adr, add, cost, reserve, i.totalOfferingAmount(), i.tokenPrice(), i.investmentAmount());
    }
    private BigDecimal clamp(BigDecimal value, BigDecimal min, BigDecimal max) {
        if (value.compareTo(min) < 0) return min;
        if (value.compareTo(max) > 0) return max;
        return value;
    }
}
