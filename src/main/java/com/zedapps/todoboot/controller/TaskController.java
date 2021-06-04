package com.zedapps.todoboot.controller;

import com.zedapps.todoboot.config.AppUserDetails;
import com.zedapps.todoboot.entity.Task;
import com.zedapps.todoboot.entity.enums.Priority;
import com.zedapps.todoboot.entity.enums.Status;
import com.zedapps.todoboot.repository.TaskRepository;
import com.zedapps.todoboot.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Objects;

/**
 * @author Shamah M Zoha
 * @since 5/1/2021
 **/
@Controller
@RequestMapping("/task")
@SessionAttributes("task")
public class TaskController {

    @Autowired
    private TaskRepository taskRepository;

    @Autowired
    private UserRepository userRepository;

    @InitBinder("task")
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @GetMapping
    public String getTask(@RequestParam(required = false) Long taskId, Authentication auth, ModelMap model) {
        Task task = getTask(taskId, ((AppUserDetails) auth.getPrincipal()).getUserId());

        model.put("task", task);
        model.put("priorityList", Arrays.asList(Priority.values()));

        return "task";
    }

    @PostMapping(params = "saveTask")
    public String saveTask(@Valid @ModelAttribute Task task, Errors errors) {
        if (errors.hasErrors()) {
            return "task";
        }

        task = taskRepository.save(task);

        return "redirect:task";
    }

    @PostMapping(params = "markAsComplete")
    public String markTaskAsComplete(@Valid @ModelAttribute Task task, Errors errors) {
        if (errors.hasErrors()) {
            return "task";
        }

        task.setStatus(Status.COMPLETED);
        taskRepository.save(task);

        return "redirect:task";
    }

    private Task getTask(Long taskId, long userId) {
        if (Objects.isNull(taskId)) {
            return new Task(userRepository.findById(userId).orElse(null));
        }

        Task task = taskRepository.findById(taskId).orElse(null);

        if (Objects.isNull(task)) {
            throw new IllegalArgumentException("Not a valid task id provided!");
        }

        return task;
    }
}
