package com.zedapps.todoboot.service;

import com.zedapps.todoboot.entity.Task;
import com.zedapps.todoboot.entity.User;
import com.zedapps.todoboot.repository.TaskRepository;
import com.zedapps.todoboot.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.util.Date;

import static com.zedapps.todoboot.entity.enums.Status.*;

/**
 * @author Shamah M Zoha
 * @since 6/6/2021
 **/
@Service
public class TaskService {

    @Autowired
    private TaskRepository taskRepository;

    @Autowired
    private UserRepository userRepository;

    @Transactional
    public Task save(Task task, long userId, HttpServletRequest request) {
        boolean isSaveAction = request.getParameterMap().containsKey("save");
        boolean isToggleCompletionAction = request.getParameterMap().containsKey("toggleCompletion");
        boolean isDeleteAction = request.getParameterMap().containsKey("delete");

        User user = userRepository.findById(userId).orElse(null);
        boolean isActive = ACTIVE.equals(task.getStatus());

        if (isToggleCompletionAction) {
            task.setStatus(isActive ? COMPLETED : ACTIVE);
            task.setCompletedBy(isActive ? user : null);
            task.setCompletedDate(isActive ? new Date() : null);

        } else if (isDeleteAction) {
            task.setStatus(isActive ? DELETED : ARCHIVED);

        } else if (!isSaveAction) {
            throw new IllegalArgumentException("Not a valid action for task!");
        }

        task = taskRepository.save(task);

        return task;
    }

    @Transactional
    public Task updateFromList(Task task, long userId, HttpServletRequest request) {
        boolean isToggleCompletionAction = request.getParameterMap().containsKey("toggleCompletion");
        boolean isDeleteAction = request.getParameterMap().containsKey("delete");

        User user = userRepository.findById(userId).orElse(null);
        boolean isActive = ACTIVE.equals(task.getStatus());

        if (isToggleCompletionAction) {
            task.setStatus(isActive ? COMPLETED : ACTIVE);
            task.setCompletedBy(isActive ? user : null);
            task.setCompletedDate(isActive ? new Date() : null);

        } else if (isDeleteAction) {
            task.setStatus(isActive ? DELETED : ARCHIVED);

        } else {
            throw new IllegalArgumentException("Not a valid action from list page!");
        }

        task = taskRepository.save(task);

        return task;
    }
}
