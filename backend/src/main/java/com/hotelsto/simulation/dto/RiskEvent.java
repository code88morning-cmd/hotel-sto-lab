package com.hotelsto.simulation.dto;

import java.math.BigDecimal;

public record RiskEvent(String eventId, String eventName, String eventType, String targetVariable, String impactType, BigDecimal impactValue, String description, String educationComment) {}
