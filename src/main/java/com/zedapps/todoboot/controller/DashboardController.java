package com.zedapps.todoboot.controller;

import com.zedapps.todoboot.config.AppUserDetails;
import com.zedapps.todoboot.repository.TaskRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Collections;
import java.util.Objects;

import static com.zedapps.todoboot.entity.enums.Status.ACTIVE;

/**
 * @author Shamah M Zoha
 * @since 5/3/2021
 **/
@Controller
@RequestMapping("/")
public class DashboardController {

    private static final String DASHBOARD_VIEW = "dashboard";

    @Autowired
    private TaskRepository taskRepository;

    @GetMapping
    public String showDashboard(ModelMap model, Authentication auth) {
        if (Objects.nonNull(auth) && auth.isAuthenticated()) {
            long userId = ((AppUserDetails) auth.getPrincipal()).getUserId();
            model.put("pendingTasks", taskRepository.getTaskByUserAndStatus(userId, Collections.singletonList(ACTIVE)));
        }

        return DASHBOARD_VIEW;
    }
}
