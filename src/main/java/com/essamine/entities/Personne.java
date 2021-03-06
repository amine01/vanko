package com.essamine.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;
import javax.validation.Valid;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public class Personne extends UrlEntity {

	@Column
	@NotBlank
	private String nom;
	@Column
	private String prenom;
	@Column
	private Date dateNaissance;

	@OneToMany(mappedBy="personne")
	@Valid
	private List<Surnom> surnoms;
	
	@OneToMany(mappedBy="personne")
	@Valid
	private List<Email> emails;
	
	@OneToMany(mappedBy="personne")
	@Valid
	private List<Photo> photos;
	
	@OneToMany(mappedBy="personne")
	@Valid
	private List<PersonneFonction> personneFonctions;

	// Getters & Setters

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public Date getDateNaissance() {
		return dateNaissance;
	}

	public void setDateNaissance(Date dateNaissance) {
		this.dateNaissance = dateNaissance;
	}

	public List<Surnom> getSurnoms() {
		return surnoms;
	}

	public void setSurnoms(List<Surnom> surnoms) {
		this.surnoms = surnoms;
	}

	public List<Email> getEmails() {
		return emails;
	}

	public void setEmails(List<Email> emails) {
		this.emails = emails;
	}

	public List<Photo> getPhotos() {
		return photos;
	}

	public void setPhotos(List<Photo> photos) {
		this.photos = photos;
	}

	public List<PersonneFonction> getPersonneFonctions() {
		return personneFonctions;
	}

	public void setPersonneFonctions(List<PersonneFonction> personneFonctions) {
		this.personneFonctions = personneFonctions;
	}

}
