package com.hotelsto.simulation.dto;

import java.math.BigDecimal;

public record HotelRevenueResult(BigDecimal roomRevenue, BigDecimal additionalRevenue, BigDecimal totalRevenue, BigDecimal operatingCost, BigDecimal operatingProfit, BigDecimal reserveAmount, BigDecimal distributableProfit) {}
