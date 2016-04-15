package com.essamine.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.essamine.entities.Photo;

public interface PhotoRepository extends JpaRepository<Photo, Long>{

}
