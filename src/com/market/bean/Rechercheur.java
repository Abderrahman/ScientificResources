package com.market.bean;


public class Rechercheur {
	
   private int identifiant;
   private String nom;
   private String prenom;
   private String adresse;
   private String ville;
   private String pays;
   private String email;
   private String tel;
   private String fax;
   
   public Rechercheur(int identifiant, String nom, String prenom,
		String adresse, String ville, String pays, String email, String tel,
		String fax) {
	   
	this.setIdentifiant(identifiant);
	this.nom = nom;
	this.prenom = prenom;
	this.adresse = adresse;
	this.ville = ville;
	this.pays = pays;
	this.email = email;
	this.tel = tel;
	this.fax = fax;
   }

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
	
	public String getAdresse() {
		return adresse;
	}
	
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	
	public String getVille() {
		return ville;
	}
	
	public void setVille(String ville) {
		this.ville = ville;
	}
	
	public String getPays() {
		return pays;
	}
	
	public void setPays(String pays) {
		this.pays = pays;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getTel() {
		return tel;
	}
	
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getFax() {
		return fax;
	}
	
	public void setFax(String fax) {
		this.fax = fax;
	}
	
	public int getIdentifiant() {
		return identifiant;
	}

	public void setIdentifiant(int identifiant) {
		this.identifiant = identifiant;
	}
	   
	   
   
   
}