package com.zedapps.todoboot.validator;

import com.zedapps.todoboot.entity.Task;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.util.Date;

/**
 * @author Shamah M Zoha
 * @since 6/7/2021
 **/
@Component
public class TaskValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return Task.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Task task = (Task) target;

        if (task.isNew() && !task.getDueDate().after(new Date())) {
            errors.rejectValue("dueDate", "error.later.than.today");
        }
    }
}
