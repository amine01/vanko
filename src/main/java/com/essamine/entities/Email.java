package com.essamine.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

import org.hibernate.validator.constraints.NotBlank;

@Entity
public class Email extends UrlEntity {
	@Column
	@NotBlank
	private String email;
	
	@Column
	private Boolean pola;
	
	@ManyToOne(optional=false)
	private Personne personne;

	// Getters & Setters

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Boolean getPola() {
		return pola;
	}

	public void setPola(Boolean pola) {
		this.pola = pola;
	}

	public Personne getPersonne() {
		return personne;
	}

	public void setPersonne(Personne personne) {
		this.personne = personne;
	}
	
	

}
