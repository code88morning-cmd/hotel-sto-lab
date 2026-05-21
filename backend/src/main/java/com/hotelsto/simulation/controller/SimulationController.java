package com.hotelsto.simulation.controller;

import com.hotelsto.simulation.calculator.FullSimulationCalculator;
import com.hotelsto.simulation.dto.FullSimulationInput;
import com.hotelsto.simulation.dto.FullSimulationResult;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/simulations")
public class SimulationController {
    private final FullSimulationCalculator fullSimulationCalculator;
    public SimulationController(FullSimulationCalculator fullSimulationCalculator) {
        this.fullSimulationCalculator = fullSimulationCalculator;
    }
    @PostMapping("/full")
    public FullSimulationResult calculateFullSimulation(@RequestBody FullSimulationInput input) {
        return fullSimulationCalculator.calculate(input);
    }
}
