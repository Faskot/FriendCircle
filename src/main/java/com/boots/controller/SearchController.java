package com.boots.controller;

import com.boots.entity.Cars;
import com.boots.service.CarsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class SearchController {

    @Autowired
    private CarsService carsService;

    @RequestMapping("/")
        public String carsList(Model model, @Param("keyword") String keyword) {
            model.addAttribute("allCars", carsService.allCars());
            model.addAttribute("keyword", keyword);

        return "index";
    }
}
