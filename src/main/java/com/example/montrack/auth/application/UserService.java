package com.example.montrack.auth.application;

import com.example.montrack.auth.domain.entities.User;
import com.example.montrack.auth.infrastructure.repository.UserRepository;

import java.util.List;
import java.util.Set;

public interface UserService {
  User registerUser(User user);
  List<User> getAllUser();
}
