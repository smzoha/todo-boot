package com.zedapps.todoboot.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author Shamah M Zoha
 * @since 6/10/2021
 **/
@Controller
public class AppErrorController implements ErrorController {

    private static final Logger logger = LoggerFactory.getLogger(AppErrorController.class);

    @GetMapping("/error")
    public String getError() {
        logger.debug("[GET] path='/error': application encountered an error");

        return "error";
    }

    @Override
    public String getErrorPath() {
        return null;
    }
}
