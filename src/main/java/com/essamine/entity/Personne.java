package com.essamine.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public class Personne extends UrlEntity {

	@Column
	private String nom;
	@Column
	private String prenom;
	@Column
	private Date dateNaissance;

	@OneToMany(mappedBy="personne")
	private List<Surnom> surnoms;
	
	@OneToMany(mappedBy="personne")
	private List<Email> emails;
	
	@OneToMany(mappedBy="personne")
	private List<Photo> photos;
	
	@OneToMany
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
