package com.zedapps.todoboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Shamah M Zoha
 * @since 5/4/2021
 **/
@Controller
@RequestMapping("/login")
public class LoginController {

    @GetMapping
    public String showLogin() {
        return "login";
    }
}
