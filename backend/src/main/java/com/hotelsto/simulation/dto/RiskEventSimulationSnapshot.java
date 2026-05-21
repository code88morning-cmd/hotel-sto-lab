package com.hotelsto.simulation.dto;

import java.math.BigDecimal;

public record RiskEventSimulationSnapshot(BigDecimal occupancyRate, BigDecimal adr, BigDecimal operatingCostRate, BigDecimal distributableProfit, BigDecimal investorDividend, BigDecimal monthlyRoi) {}
