package com.zedapps.todoboot.service;

import com.zedapps.todoboot.entity.User;
import com.zedapps.todoboot.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * @author Shamah M Zoha
 * @since 5/24/2021
 **/
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public List<User> getUserList() {
        List<User> userList = new ArrayList<>();

        userRepository.findAll().forEach(userList::add);

        userList.sort(Comparator.comparing(User::getUsername));

        return userList;
    }

    @Transactional
    public User save(User user, boolean toggleStatus) {
        if (user.isNew()) {
            user.setPrivileges(Collections.singletonList("USER"));
        }

        if (StringUtils.hasText(user.getInputPassword1()) && !passwordEncoder.matches(user.getInputPassword1(), user.getPassword())) {
            user.setPassword(passwordEncoder.encode(user.getInputPassword1()));
        }

        if (toggleStatus) {
            user.setActive(!user.isActive());
        }

        user = userRepository.save(user);

        return user;
    }
}
