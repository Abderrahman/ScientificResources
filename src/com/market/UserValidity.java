package com.market;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dbconnection.ConnectionUtil;

@WebServlet("/UserValidity")
public class UserValidity extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	Connection conn;

	public UserValidity() {
	
			conn = ConnectionUtil.getConnection();
	        if(conn == null)
	        	System.out.println("error");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String username = request.getParameter("username");
		boolean b = false;
		
		try {
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery("select username from users where username = '"+ username+"'");
			b = rs.next();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(String.valueOf(b));
		
	}

}
