package com.hotelsto.simulation.dto;

import java.math.BigDecimal;

public record DividendInput(BigDecimal distributableProfit, BigDecimal ownershipRatio, BigDecimal investmentAmount) {}
