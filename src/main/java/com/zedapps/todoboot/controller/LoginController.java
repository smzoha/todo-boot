package com.zedapps.todoboot.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @GetMapping
    public String showLogin() {
        logger.debug("[GET] path='/login': navigating to login");

        return "login";
    }
}
