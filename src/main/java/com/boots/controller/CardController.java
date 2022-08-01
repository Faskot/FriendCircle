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
public class CardController {

    @Autowired
    private CarsService carsService;


    @GetMapping("/")
    public String carsList(Model model) {
        model.addAttribute("allCars", carsService.allCars());
        return "index";
    }


    @GetMapping("//gt/{carsId}")
    public String  gtCars(@PathVariable("carsId") Long carsId, Model model) {
        model.addAttribute("allCars", carsService.carsgtList(carsId));
        return "index";
    }
}
