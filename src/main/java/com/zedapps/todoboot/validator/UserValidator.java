package com.zedapps.todoboot.validator;

import com.zedapps.todoboot.entity.User;
import com.zedapps.todoboot.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.Objects;

/**
 * @author Shamah M Zoha
 * @since 5/22/2021
 **/
@Component
public class UserValidator implements Validator {

    @Autowired
    private UserRepository userRepository;

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "inputPassword1", "error.required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "inputPassword2", "error.required");

        if (StringUtils.hasText(user.getInputPassword1())
                && (user.getInputPassword1().length() < 8 || user.getInputPassword1().length() > 32)) {
            errors.rejectValue("inputPassword1", "error.size.range.exceeded.strict.params",
                    new Integer[]{8, 32}, "Password must be between 8-32 characters");
        }

        if (StringUtils.hasText(user.getInputPassword2())
                && (user.getInputPassword2().length() < 8 || user.getInputPassword2().length() > 32)) {
            errors.rejectValue("inputPassword2", "error.size.range.exceeded.strict.params",
                    new Integer[]{8, 32}, "Password must be between 8-32 characters");
        }

        if (StringUtils.hasText(user.getInputPassword1()) && StringUtils.hasText(user.getInputPassword2())
                && !user.getInputPassword1().equals(user.getInputPassword2())) {
            errors.rejectValue("inputPassword2", "error.registration.password.mismatch");
        }

        if (Objects.nonNull(userRepository.getUserByUsername(user.getUsername()))) {
            errors.rejectValue("username", "error.registration.duplicate.username");
        }
    }
}
