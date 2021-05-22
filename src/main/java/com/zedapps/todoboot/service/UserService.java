package com.zedapps.todoboot.service;

import com.zedapps.todoboot.entity.User;
import com.zedapps.todoboot.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Collections;

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

    @Transactional
    public User saveUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getInputPassword1()));
        user.setPrivileges(Collections.singletonList("USER"));

        user = userRepository.save(user);

        return user;
    }
}
