package com.essamine.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class Email extends UrlEntity {
	@Column
	private String email;
	@Column
	private Boolean pola;
	
	@ManyToOne
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
