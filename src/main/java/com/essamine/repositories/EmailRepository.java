package com.essamine.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.essamine.entities.Email;

public interface EmailRepository extends JpaRepository<Email, Long> {

}
