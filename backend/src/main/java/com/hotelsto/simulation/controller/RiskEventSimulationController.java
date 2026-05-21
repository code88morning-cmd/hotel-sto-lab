package com.hotelsto.simulation.controller;

import com.hotelsto.simulation.calculator.RiskEventSimulationCalculator;
import com.hotelsto.simulation.data.RiskEventSampleData;
import com.hotelsto.simulation.dto.*;
import com.hotelsto.simulation.exception.InvalidSimulationInputException;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/simulations")
public class RiskEventSimulationController {
    private final RiskEventSimulationCalculator calculator;
    public RiskEventSimulationController(RiskEventSimulationCalculator calculator) {
        this.calculator = calculator;
    }
    @PostMapping("/risk-event")
    public RiskEventSimulationResult simulateRiskEvent(@RequestBody RiskEventSimulationInput request) {
        RiskEvent event = RiskEventSampleData.getRiskEvents().stream()
                .filter(e -> e.eventId().equals(request.riskEventId()))
                .findFirst()
                .orElseThrow(() -> new InvalidSimulationInputException("Risk event not found"));
        FullSimulationInput input = new FullSimulationInput(request.roomCount(), request.operatingDays(), request.occupancyRate(), request.adr(), request.additionalRevenueRate(), request.operatingCostRate(), request.reserveRate(), request.totalOfferingAmount(), request.tokenPrice(), request.investmentAmount());
        return calculator.calculate(input, event);
    }
}
