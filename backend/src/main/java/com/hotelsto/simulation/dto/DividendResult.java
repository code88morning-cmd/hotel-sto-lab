package com.hotelsto.simulation.dto;

import java.math.BigDecimal;

public record DividendResult(BigDecimal investorDividend, BigDecimal monthlyRoi, BigDecimal annualizedRoi) {}
