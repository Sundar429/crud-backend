package com.sundar_java.crud_backend.repository;

import com.sundar_java.crud_backend.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User,Long> {
}
