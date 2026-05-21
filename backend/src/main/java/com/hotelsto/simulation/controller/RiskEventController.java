package com.hotelsto.simulation.controller;

import com.hotelsto.simulation.data.RiskEventSampleData;
import com.hotelsto.simulation.dto.RiskEvent;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class RiskEventController {
    @GetMapping("/api/risk-events")
    public List<RiskEvent> getRiskEvents() {
        return RiskEventSampleData.getRiskEvents();
    }
}
