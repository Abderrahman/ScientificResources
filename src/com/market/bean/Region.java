package com.market.bean;

/***********************************************************************
 * Module:  Region.java
 * Author:  Administrateur
 * Purpose: Defines the Class Region
 ***********************************************************************/


public class Region {

	private int idreg;
    private String nom;
   
    public String getNom() {
		return nom;
	}
	
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	public Region(int idreg, String nom) {
			this.idreg = idreg;
			this.nom = nom;
	}

	public int getIdreg() {
		return idreg;
	}
}