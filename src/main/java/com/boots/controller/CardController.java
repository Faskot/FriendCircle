package com.boots.controller;


import com.boots.entity.User;
import com.boots.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.*;
import java.util.stream.Collectors;

@Controller
public class CardController {

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String usersList(Model model, @ModelAttribute("filterForm") User filterForm ) {
        List<User> users;
        if (filterForm.getAge() != null || filterForm.getCity() != null || filterForm.getWant() != null) {
            users = userService.filterUsers(filterForm.getAge(), filterForm.getCity(), filterForm.getRegion(), filterForm.getWant());

        } else {
            users = userService.allUsers().stream()
                    .filter(u -> u.getRoles().stream()
                            .noneMatch(role -> role.getName().equals("ROLE_ADMIN")))
                    .collect(Collectors.toList());
        }
        // console check
        System.out.println("Age: " + filterForm.getAge());
        System.out.println("City: " + filterForm.getCity());
        System.out.println("Region" + filterForm.getRegion());
        System.out.println("Want: " + filterForm.getWant());


        Map<Long, String> avatars = new HashMap<>();
        for (User user : users) {
            if (user.getAvatar() != null) {
                String base64Avatar = Base64.getEncoder().encodeToString(user.getAvatar());
                avatars.put(user.getId(), base64Avatar);
            }
        }

        model.addAttribute("avatars", avatars);
        model.addAttribute("allUsers", users);

        return "index";
    }
    @GetMapping("/about/{id}")
    public String showUserDetails(@PathVariable("id") Long userId, Model model) {
        User userAbout = userService.findUserById(userId);
        if (userAbout == null) {
            return "error";
        }
        String base64Avatar = Base64.getEncoder().encodeToString(userAbout.getAvatar());

        model.addAttribute("avatarshow", base64Avatar);
        model.addAttribute("userAbout", userAbout);
        return "about";
    }
}
