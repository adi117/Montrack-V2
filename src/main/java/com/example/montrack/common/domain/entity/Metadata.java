package com.example.montrack.common.domain.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import org.hibernate.annotations.Filter;

import java.time.Instant;

@Getter
@Setter
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "metadata")
public class Metadata {
  @Id
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "metadata_id_gen")
  @SequenceGenerator(name = "metadata_id_gen", sequenceName = "metadata_id_seq", allocationSize = 1)
  @Column(name = "id", nullable = false)
  private Integer id;

  @NotNull
  @Column(name = "date_created")
  private Instant dateCreated;

  @NotNull
  @Column(name = "date_updated")
  private Instant dateUpdated;

  @PrePersist
  public void prePersist() {
    dateCreated = Instant.now();
    dateUpdated = Instant.now();
  }
}
