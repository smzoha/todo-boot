package com.zedapps.todoboot.controller;

import com.zedapps.todoboot.config.AppUserDetails;
import com.zedapps.todoboot.entity.Task;
import com.zedapps.todoboot.entity.enums.Priority;
import com.zedapps.todoboot.repository.TaskRepository;
import com.zedapps.todoboot.repository.UserRepository;
import com.zedapps.todoboot.service.TaskService;
import com.zedapps.todoboot.validator.TaskValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.Objects;

import static com.zedapps.todoboot.entity.enums.Status.*;

/**
 * @author Shamah M Zoha
 * @since 5/1/2021
 **/
@Controller
@RequestMapping("/task")
@SessionAttributes("task")
public class TaskController {

    private static final Logger logger = LoggerFactory.getLogger(TaskController.class);

    @Autowired
    private TaskService taskService;

    @Autowired
    private TaskRepository taskRepository;

    @Autowired
    private TaskValidator taskValidator;

    @Autowired
    private UserRepository userRepository;

    @InitBinder("task")
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));

        binder.addValidators(taskValidator);
    }

    @GetMapping
    public String getTask(@RequestParam(required = false) Long taskId, Authentication auth, ModelMap model) {
        logger.debug("[GET] path='/task': navigating to task");

        Task task = getTask(taskId, ((AppUserDetails) auth.getPrincipal()).getUserId());

        model.put("task", task);
        model.put("priorityList", Arrays.asList(Priority.values()));

        logger.debug("[GET] path='/task': loading task with id=" + task.getId() + " for user=" + ((AppUserDetails) auth.getPrincipal()).getUsername());

        return "task";
    }

    @GetMapping("/list")
    public String getTaskList(Authentication auth, ModelMap model) {
        logger.debug("[GET] path='/task/list': navigating to task list");

        long userId = getUserId(auth);

        model.put("pendingTasks", taskRepository.getTaskByUserAndStatus(userId, Collections.singletonList(ACTIVE)));
        model.put("completedTasks", taskRepository.getTaskByUserAndStatus(userId, Collections.singletonList(COMPLETED)));
        model.put("archivedTasks", taskRepository.getTaskByUserAndStatus(userId, Arrays.asList(DELETED, ARCHIVED)));

        logger.debug("[GET] path='/task/list': loading task list for userId=" + userId);

        return "taskList";
    }

    @PostMapping(value = "/list")
    public String updateFromList(@RequestParam long taskId, Authentication auth, HttpServletRequest request) {
        Task task = getTask(taskId, getUserId(auth));

        task = taskService.updateFromList(task, getUserId(auth), request);

        boolean dashboardAction = request.getParameterMap().containsKey("dashboardAction")
                && Boolean.parseBoolean(request.getParameter("dashboardAction"));

        logger.debug("[POST] path='/task/list': updating task from list. taskId=" + task.getId());

        return dashboardAction ? "redirect:/" : "redirect:list";
    }

    @PostMapping
    public String saveTask(@Valid @ModelAttribute Task task, Errors errors, Authentication auth, HttpServletRequest request) {
        if (errors.hasErrors()) {
            return "task";
        }

        boolean isNew = task.isNew();
        long userId = getUserId(auth);

        task = taskService.save(task, userId, request);

        logger.debug("[POST] path='/task': saving task. taskId=" + task.getId());

        return isNew ? "redirect:/" : "redirect:/task/list";
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

    private long getUserId(Authentication auth) {
        return ((AppUserDetails) auth.getPrincipal()).getUserId();
    }
}
