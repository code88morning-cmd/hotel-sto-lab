package com.hotelsto.simulation.dto;

import java.math.BigDecimal;

public record FullSimulationResult(HotelRevenueResult revenue, TokenOfferingResult token, DividendResult dividend, String educationComment, String complianceNotice) {}
