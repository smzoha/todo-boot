package com.zedapps.todoboot.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author Shamah M Zoha
 * @since 6/10/2021
 **/
@Controller
public class AppErrorController implements ErrorController {

    @GetMapping("/error")
    public String getError() {
        return "error";
    }

    @Override
    public String getErrorPath() {
        return null;
    }
}
