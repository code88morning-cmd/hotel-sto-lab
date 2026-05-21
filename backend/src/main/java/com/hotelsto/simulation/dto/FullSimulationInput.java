package com.hotelsto.simulation.dto;

import java.math.BigDecimal;

public record FullSimulationInput(int roomCount, int operatingDays, BigDecimal occupancyRate, BigDecimal adr, BigDecimal additionalRevenueRate, BigDecimal operatingCostRate, BigDecimal reserveRate, BigDecimal totalOfferingAmount, BigDecimal tokenPrice, BigDecimal investmentAmount) {}
