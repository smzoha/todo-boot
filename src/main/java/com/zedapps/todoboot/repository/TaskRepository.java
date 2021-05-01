package com.zedapps.todoboot.repository;

import com.zedapps.todoboot.entity.Task;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * @author Shamah M Zoha
 * @since 5/1/2021
 **/
@Repository
public interface TaskRepository extends CrudRepository<Task, Long> {
}
