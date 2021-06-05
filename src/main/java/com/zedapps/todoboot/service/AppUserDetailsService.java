package com.zedapps.todoboot.service;

import com.zedapps.todoboot.config.AppUserDetails;
import com.zedapps.todoboot.entity.User;
import com.zedapps.todoboot.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/**
 * @author Shamah M Zoha
 * @since 6/5/2021
 **/
@Service
public class AppUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User dbUser = userRepository.getUserByUsername(username);

        AppUserDetails userDetails = new AppUserDetails(dbUser.getUsername(), dbUser.getPassword(), getAuthorities(dbUser.getPrivileges()));
        userDetails.setUserId(dbUser.getId());
        userDetails.setFirstName(dbUser.getFirstName());
        userDetails.setLastName(dbUser.getLastName());

        return userDetails;
    }

    private List<? extends GrantedAuthority> getAuthorities(List<String> privileges) {
        Set<GrantedAuthority> authoritySet = new LinkedHashSet<>();

        for (String privilege : privileges) {
            authoritySet.add(new SimpleGrantedAuthority(privilege));
        }

        return new ArrayList<>(authoritySet);
    }
}
