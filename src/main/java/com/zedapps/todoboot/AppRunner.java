package com.zedapps.todoboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * @author Shamah M Zoha
 * @since 4/30/2021
 */
@SpringBootApplication
public class AppRunner extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(AppRunner.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(AppRunner.class, args);
    }
}
