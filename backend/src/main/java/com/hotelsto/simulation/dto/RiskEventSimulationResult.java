package com.hotelsto.simulation.dto;

import java.math.BigDecimal;

public record RiskEventSimulationResult(RiskEvent riskEvent, RiskEventSimulationSnapshot before, RiskEventSimulationSnapshot after, RiskEventSimulationDifference difference, String educationComment, String complianceNotice) {}
