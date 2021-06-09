package com.zedapps.todoboot.repository;

import com.zedapps.todoboot.entity.Task;
import com.zedapps.todoboot.entity.enums.Status;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Shamah M Zoha
 * @since 5/1/2021
 **/
@Repository
public interface TaskRepository extends CrudRepository<Task, Long> {

    @Query("FROM Task WHERE createdBy.id = :userId AND status IN :status")
    public List<Task> getTaskByUserAndStatus(@Param("userId") long userId, @Param("status") List<Status> status);

}
