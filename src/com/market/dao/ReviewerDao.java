package com.market.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.market.dbconnection.ConnectionUtil;

public class ReviewerDao {

	private Connection conn;

    public ReviewerDao() {
        conn = ConnectionUtil.getConnection();
        if(conn == null)
        	System.out.println("error");
    }

    
    public Integer authenticate(String username, String password) throws SQLException{

    	Statement stm = conn.createStatement();
    	String sql = "SELECT id FROM reviewer where login = '"+
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
