package com.boots.controller;

import com.boots.entity.User;
import com.boots.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.security.Principal;
import java.util.Base64;

@Controller
public class UserCabinet {

      @Autowired
    private UserRepository userRepository;

    @GetMapping("/cabinet")
    public String userProfile(Model model, Principal principal) {
        String username = principal.getName();
        User user = userRepository.findByUsername(username);
        byte[] avatarBytes = user.getAvatar();
        if (avatarBytes != null) {
            String base64Avatar = Base64.getEncoder().encodeToString(avatarBytes);
            model.addAttribute("avatarshow", base64Avatar);
        }
        model.addAttribute("user", user);
        return "cabinet";
    }
}

