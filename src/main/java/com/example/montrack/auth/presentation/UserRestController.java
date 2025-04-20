package com.example.montrack.auth.presentation;

import com.example.montrack.auth.application.UserService;
import com.example.montrack.auth.domain.entities.User;
import com.example.montrack.auth.infrastructure.repository.UserRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/user")
public class UserRestController {
  private final UserService userService;

  public UserRestController(UserService userService) {
    this.userService = userService;
  }

  @PostMapping("/register")
  public ResponseEntity<?> register(@RequestBody User user) {
    User addedUser = userService.registerUser(user);
    return ResponseEntity.ok(addedUser);
  }

  @GetMapping
  public List<User> getAllUser() {
    return userService.getAllUser();
  }
}
