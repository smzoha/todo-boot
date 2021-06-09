package com.zedapps.todoboot.controller;

import com.zedapps.todoboot.entity.User;
import com.zedapps.todoboot.repository.UserRepository;
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

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Objects;

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
    private UserRepository userRepository;

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

    @GetMapping("/user/list")
    public String showUserList(ModelMap model) {
        model.put("userList", userService.getUserList());

        return "userList";
    }

    @GetMapping(value = "/user")
    public String editUser(@RequestParam long userId, ModelMap model) {
        User user = userRepository.findById(userId).orElse(null);

        if (Objects.isNull(user)) {
            throw new NoResultException("Couldn't find user with provided id!");
        }

        model.put("user", user);

        return "user";
    }

    @PostMapping(value = "/user", params = "toggleStatusById")
    public String toggleStatusWithId(@RequestParam long userId, RedirectAttributes redirectAttributes) {
        User user = userRepository.findById(userId).orElse(null);

        if (Objects.isNull(user)) {
            throw new NoResultException("Couldn't find user with provided id!");
        }

        userRepository.updateUserStatus(userId, !user.isActive());

        redirectAttributes.addAttribute("toggleStatusSuccess", user.isActive());

        return "redirect:/user/list";
    }

    @PostMapping(value = {"/user", "/register"})
    public String saveUser(@Valid @ModelAttribute User user, Errors errors,
                           HttpServletRequest request, RedirectAttributes redirectAttributes) {

        if (errors.hasErrors()) {
            return "user";
        }

        boolean isNew = user.isNew();
        boolean isToggleStatusAction = request.getParameterMap().containsKey("toggleStatus");
        user = userService.save(user, isToggleStatusAction);

        if (isNew) {
            redirectAttributes.addAttribute("registerSuccess", true);
        } else {
            if (isToggleStatusAction) {
                redirectAttributes.addAttribute("toggleStatusSuccess", !user.isActive());
            } else {
                redirectAttributes.addAttribute("updateSuccess", true);
            }
        }

        return isNew ? "redirect:/" : "redirect:/user/list";
    }
}
