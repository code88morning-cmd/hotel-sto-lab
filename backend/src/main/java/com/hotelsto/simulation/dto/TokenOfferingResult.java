package com.hotelsto.simulation.dto;

import java.math.BigDecimal;

public record TokenOfferingResult(BigDecimal totalTokenSupply, BigDecimal userTokenQuantity, BigDecimal ownershipRatio, BigDecimal ownershipRatioPercent, BigDecimal dividendRightRatio) {}
