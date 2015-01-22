package com.market.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.market.dbconnection.ConnectionUtil;

public class RechercheurDao {

	private Connection conn;

	public int getIdentifiant(int idcompte) throws SQLException{
		
		Statement stm = conn.createStatement();
		ResultSet rs = stm.executeQuery("select identifiant from acheteur where idcompte ="+idcompte);
        rs.next();
        
		return Integer.parseInt(rs.getString(1));
	}
	
    public RechercheurDao() {
        conn = ConnectionUtil.getConnection();
        if(conn == null)
        	System.out.println("error");
    }

    public Integer authenticate(String username, String password) throws SQLException{

    	Statement stm = conn.createStatement();
    	String sql = "SELECT id FROM rechercheur where login = '"+
    					username+"' and password ='"+ password+ "'";
    	ResultSet rs = stm.executeQuery(sql);
    	
    	Integer id;
    	if(rs.next()){
    		 id = rs.getInt(1);
    		 return id;
    	}
    	else
			return -1;
	}
}
