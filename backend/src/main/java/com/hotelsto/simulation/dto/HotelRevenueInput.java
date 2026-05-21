package com.hotelsto.simulation.dto;

import java.math.BigDecimal;

public record HotelRevenueInput(int roomCount, int operatingDays, BigDecimal occupancyRate, BigDecimal adr, BigDecimal additionalRevenueRate, BigDecimal operatingCostRate, BigDecimal reserveRate) {}
