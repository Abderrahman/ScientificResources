package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.market.bean.Publication;
import com.market.dbconnection.ConnectionUtil;

public class PublicationDao {

    private Connection conn;
    
    public PublicationDao() {
        conn = ConnectionUtil.getConnection();
        if(conn == null)
        	System.out.println("error");
    }
    
    public ArrayList<Publication> getAllPublications() {
    	
    	ArrayList<Publication> listepublication = new ArrayList<>();
 		
    	try {
    		
    		Statement stm = conn.createStatement();
    		ResultSet rs = stm.executeQuery("SELECT `titre`, `description`, `datePublication`, `fichier`, `estValider`, r.Avis "
    				+ "FROM `publication` p inner join reponse r on p.reference = r.idPublication "
    				+ "WHERE estValider=true LIMIT 10");

     		while (rs.next()) {
     			
     			Publication p = new Publication(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
     					rs.getBoolean(5));
     			p.setAvis(rs.getInt(6));
     			listepublication.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listepublication;
    }

	public ArrayList<Publication> getAllPublicationsNonValidee() {
    	
    	ArrayList<Publication> listepublication = new ArrayList<>();
 		
    	try {
    		
    		Statement stm = conn.createStatement();
    		ResultSet rs = stm.executeQuery("SELECT `titre`, `description`, `datePublication`, `fichier`, `estValider`, "
    				+ "`reference`, id_user FROM `publication`"
    				+ "WHERE estValider=false LIMIT 10");

     		while (rs.next()) {
     			Publication p = new Publication(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
     					rs.getBoolean(5));
     			p.setReference(rs.getInt(6));
     			p.setId_user(rs.getInt(7));
     			listepublication.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listepublication;
    }

    
	public void addPublication(Publication publication) {
		
		
		
		String sql = "INSERT INTO `publication`( `titre`, `description`, `datePublication`, `fichier`, `estValider`, `id_user`) "
				+ "VALUES (?, ?, ?, ?, ?, ?)";
        
		PreparedStatement ps ;
		try {
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, publication.getTitre());
			ps.setString(2, publication.getDescription());
			ps.setString(3, publication.getDateDePublication());
			ps.setString(4, publication.getFichier());
			ps.setBoolean(5, publication.isEstValider());
			ps.setInt(6, publication.getId_user());
			
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Publication> getPublicationsByID(int ID_user) {
	    	
			ArrayList<Publication> listePublications = new ArrayList<>();
	 		
	    	try {
	    		
	    		Statement stm = conn.createStatement();
	    		ResultSet rs = stm.executeQuery("SELECT `titre`, `description`, `datePublication`, `fichier`, `estValider`"
	    				+ "FROM publication p inner join rechercheur r on p.id_user =  r.id where p.id_user = " + ID_user);

	     		while (rs.next()) {
	     			listePublications.add(new Publication(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5)));
	     		}
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return listePublications;
	    }

}
