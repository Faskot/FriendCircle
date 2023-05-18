package com.boots.controller;

import org.springframework.stereotype.Controller;
import com.boots.entity.User;
import com.boots.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class EditController {
    @Autowired
    private UserService userService;

    @GetMapping("/cabinet/{id}")
    public String userProfile(@PathVariable("id") Long id, Model model) {
        User user = userService.findUserById(id);
        model.addAttribute("user", user);
        return "/cabinet";
    }

    @GetMapping("/editProfile")
    public String userProfile(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = (User) authentication.getPrincipal();
        model.addAttribute("user", user);
        return "/editProfile";
    }

    @PostMapping("/editProfile")
    public String updateUser(@ModelAttribute("user") User user, BindingResult result, @RequestParam("file") MultipartFile file, HttpSession session) throws IOException {
        User existingUser = userService.findUserById(user.getId());
        if (result.hasErrors()) {
            return "/editProfile";
        }
        if (!file.isEmpty()) {
            byte[] bytes = file.getBytes();
            user.setAvatar(bytes);
        }
        else {user.setAvatar(existingUser.getAvatar());}

        userService.updateUser(user);
        session.setAttribute("user", user);
        return "redirect:/cabinet/" + user.getId();
    }

}

