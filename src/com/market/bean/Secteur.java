package com.market.bean;

/***********************************************************************
 * Module:  Secteur.java
 * Author:  Administrateur
 * Purpose: Defines the Class Secteur
 ***********************************************************************/


public class Secteur {
	
	private int idsecteur;
	private String nomsecteur;
	private String specification;
	
	public Secteur(int idsecteur, String nomsecteur, String specification) {
		this.idsecteur = idsecteur;
		this.nomsecteur = nomsecteur;
		this.specification = specification;
	}

	public String getNomsecteur() {
		return nomsecteur;
	}
	public void setNomsecteur(String nomsecteur) {
		this.nomsecteur = nomsecteur;
	}
	public String getSpecification() {
		return specification;
	}
	public void setSpecification(String specification) {
		this.specification = specification;
	}

	public int getIdsecteur() {
		return idsecteur;
	}

	public void setIdsecteur(int idsecteur) {
		this.idsecteur = idsecteur;
	}



}