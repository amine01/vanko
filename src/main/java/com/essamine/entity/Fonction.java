package com.essamine.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

@Entity
public class Fonction extends UrlEntity {
	@Column
	private String fonction;

	@OneToMany
	private List<PersonneFonction> personneFonctions;

	// Getters & Setters
	public String getFonction() {
		return fonction;
	}

	public void setFonction(String fonction) {
		this.fonction = fonction;
	}

	public List<PersonneFonction> getPersonneFonctions() {
		return personneFonctions;
	}

	public void setPersonneFonctions(List<PersonneFonction> personneFonctions) {
		this.personneFonctions = personneFonctions;
	}

}
