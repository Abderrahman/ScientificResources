package com.market.bean;


public class Publication {
	
	private int reference;
	private String titre;
	private String description;
	private String dateDePublication;
	private String fichier;
	private boolean estValider;
	private int id_user;
	
	public Publication(String titre, String description, String dateDePublication, String fichier, boolean estValider) {
		
		this.titre = titre;
		this.description = description;
		this.dateDePublication = dateDePublication;
		this.fichier = fichier;
		this.setEstValider(estValider);
	}
	
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDateDePublication() {
		return dateDePublication;
	}
	public void setDateDePublication(String dateDePublication) {
		this.dateDePublication = dateDePublication;
	}
	public String getFichier() {
		return fichier;
	}
	public void setFichier(String fichier) {
		this.fichier = fichier;
	}

	public boolean isEstValider() {
		return estValider;
	}

	public void setEstValider(boolean estValider) {
		this.estValider = estValider;
	}

	public int getReference() {
		return reference;
	}

	public void setReference(int reference) {
		this.reference = reference;
	}

	public int getId_user() {
		return id_user;
	}

	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	
	public int getAvis() {
		return avis;
	}

	public void setAvis(int avis) {
		this.avis = avis;
	}

	private int avis;
	
	
}