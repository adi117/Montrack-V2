package com.example.montrack.auth.application.impl;

import com.example.montrack.auth.application.UserService;
import com.example.montrack.auth.domain.entities.User;
import com.example.montrack.auth.infrastructure.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {
  private final UserRepository userRepository;

  public UserServiceImpl(UserRepository userRepository) {
    this.userRepository = userRepository;
  }

  @Override
  public User registerUser(User user) {
    userRepository.save(user);
    return user;
  }

  @Override
  public List<User> getAllUser() {
    return userRepository.findAll();
  }
}
