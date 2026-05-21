package com.hotelsto.simulation.dto;

import java.math.BigDecimal;

public record RiskEventSimulationDifference(BigDecimal distributableProfitChange, BigDecimal investorDividendChange, BigDecimal monthlyRoiChange) {}
