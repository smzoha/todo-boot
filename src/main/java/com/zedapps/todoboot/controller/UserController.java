package com.zedapps.todoboot.controller;

import com.zedapps.todoboot.entity.User;
import com.zedapps.todoboot.service.UserService;
import com.zedapps.todoboot.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

/**
 * @author Shamah M Zoha
 * @since 5/22/2021
 **/
@Controller
@SessionAttributes("user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserValidator userValidator;

    @InitBinder("user")
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
        binder.addValidators(userValidator);
    }

    @GetMapping("/register")
    public String showRegistration(ModelMap model) {
        model.put("user", new User());

        return "user";
    }

    @PostMapping(value = {"/user", "/register"})
    public String saveUser(@Valid @ModelAttribute User user, Errors errors, RedirectAttributes redirectAttributes) {
        if (errors.hasErrors()) {
            return "user";
        }

        user = userService.saveUser(user);

        redirectAttributes.addAttribute("registerSuccess", true);

        return "redirect:/";
    }

}
