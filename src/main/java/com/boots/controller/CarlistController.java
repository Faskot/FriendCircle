package com.boots.controller;

import com.boots.service.CarsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;




@Controller
public class CarlistController {
    @Autowired
    private CarsService carsService;


    @GetMapping("/carlist")
    public String carsList(Model model) {
        model.addAttribute("allCars", carsService.allCars());
        return "carlist";
    }

    @PostMapping("/carlist")
    public String  deleteCars(@RequestParam(required = true, defaultValue = "" ) Long carsId,
                              @RequestParam(required = true, defaultValue = "" ) String action,
                              Model model) {
        if (action.equals("delete")){
            carsService.deleteCars(carsId);
        }
        return "redirect:/carlist";
    }


    @GetMapping("/carlist/gt/{carsId}")
    public String  gtCars(@PathVariable("carsId") Long carsId, Model model) {
        model.addAttribute("allCars", carsService.carsgtList(carsId));
        return "carlist";
    }

}
