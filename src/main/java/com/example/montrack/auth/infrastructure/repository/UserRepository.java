package com.example.montrack.auth.infrastructure.repository;

import com.example.montrack.auth.domain.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {
}
