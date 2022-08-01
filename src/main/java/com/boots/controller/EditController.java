package com.boots.controller;


import com.boots.entity.Cars;
import com.boots.service.CarsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
public class EditController {

    @Autowired
    private CarsService carsService;

    @GetMapping("/edit")
    public String edit(Model model){
        model.addAttribute("carsForm", new Cars());
        return "edit";
    }

    @PostMapping("/edit")
    public String addCars(@ModelAttribute("carsForm") @Valid Cars carsForm, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "edit";
        }
        carsService.saveCars(carsForm);
        return "redirect:/edit";
    }



}



