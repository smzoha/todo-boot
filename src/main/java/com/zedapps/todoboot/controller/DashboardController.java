package com.zedapps.todoboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Shamah M Zoha
 * @since 5/3/2021
 **/
@Controller
@RequestMapping("/")
public class DashboardController {

    private static final String DASHBOARD_VIEW = "dashboard";

    @GetMapping
    public String showDashboard() {
        return DASHBOARD_VIEW;
    }
}
