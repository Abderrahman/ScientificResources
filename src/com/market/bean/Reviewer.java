package com.market.bean;

/***********************************************************************
 * Module:  Entreprise.java
 * Author:  Administrateur
 * Purpose: Defines the Class Entreprise
 ***********************************************************************/


public class Reviewer  {

   private int idNational;
   private String raisonSociale;
   private String adresse;
   private String pays;
   private String nomEtPrenom;
   private String email;
   private String tel;
   
   public Reviewer(int idNational, String raisonSociale, String adresse,
			String pays, String nomEtPrenom, String email, String tel) {
		
		this.idNational = idNational;
		this.raisonSociale = raisonSociale;
		this.adresse = adresse;
		this.pays = pays;
		this.nomEtPrenom = nomEtPrenom;
		this.email = email;
		this.tel = tel;
	}

	public int getIdNational() {
		return idNational;
	}

	public void setIdNational(int idNational) {
		this.idNational = idNational;
	}

	public String getRaisonSociale() {
		return raisonSociale;
	}

	public void setRaisonSociale(String raisonSociale) {
		this.raisonSociale = raisonSociale;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getPays() {
		return pays;
	}

	public void setPays(String pays) {
		this.pays = pays;
	}

	public String getNomEtPrenom() {
		return nomEtPrenom;
	}

	public void setNomEtPrenom(String nomEtPrenom) {
		this.nomEtPrenom = nomEtPrenom;
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

   
}