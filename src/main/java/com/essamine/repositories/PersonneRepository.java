package com.essamine.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.essamine.entities.Personne;

public interface PersonneRepository extends JpaRepository<Personne, Long>{

}
