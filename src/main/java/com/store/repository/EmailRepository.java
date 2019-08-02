package com.store.repository;

import com.store.model.store.Email;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmailRepository extends JpaRepository<Email, Long> {
    Email findByEmail(String email);
}
