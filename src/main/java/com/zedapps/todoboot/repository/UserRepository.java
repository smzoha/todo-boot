package com.zedapps.todoboot.repository;

import com.zedapps.todoboot.entity.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * @author Shamah M Zoha
 * @since 5/1/2021
 **/
@Repository
public interface UserRepository extends CrudRepository<User, Long> {
}
