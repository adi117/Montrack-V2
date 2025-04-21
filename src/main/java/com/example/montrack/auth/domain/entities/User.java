package com.example.montrack.auth.domain.entities;

import com.example.montrack.common.domain.entity.Metadata;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import org.hibernate.annotations.Filter;

@Getter
@Setter
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "users")
public class User {

  @Id
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "users_id_gen")
  @SequenceGenerator(name = "users_id_gen", sequenceName = "users_id_seq", allocationSize = 1)
  @Column(name = "id", nullable = false)
  private Integer id;

  @NotNull
  @Column(name = "email", nullable = false)
  private String email;

  @NotNull
  @Column(name = "password", nullable = false)
  private String password;

  @NotNull
  @Column(name = "is_new", nullable = false)
  private boolean is_new;

  @NotNull
  @Column(name = "pin", nullable = false)
  private String pin;

  @NotNull
  @Column(name = "quotes", nullable = false)
  private String quotes;

  @NotNull
  @Column(name = "email_validation", nullable = false)
  private boolean is_email_verified;

  @NotNull
  @Column(name = "language", nullable = false)
  private String language;

  @NotNull
  @Column(name = "profile_photo", nullable = false)
  private String profile_photo;

  @OneToOne(cascade = CascadeType.ALL)
  @JoinColumn(name = "metadata_id", referencedColumnName = "id")
  private Metadata metadata;
}
