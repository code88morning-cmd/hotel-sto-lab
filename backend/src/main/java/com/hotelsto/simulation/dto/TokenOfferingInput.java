package com.hotelsto.simulation.dto;

import java.math.BigDecimal;

public record TokenOfferingInput(BigDecimal totalOfferingAmount, BigDecimal tokenPrice, BigDecimal investmentAmount) {}
