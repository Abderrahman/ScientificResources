package com.market;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dbconnection.ConnectionUtil;

/**
 * Servlet implementation class Attribuer
 */
@WebServlet("/Attribuer2")
public class Attribuer2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id"); // id Reviewer
		String ref = request.getParameter("ref");
		String avis = request.getParameter("avis");

 	    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		try {
		
			Connection con = ConnectionUtil.getConnection();
			
			String sql = "update publication set estValider = true where reference = ? ";
			PreparedStatement ps =  con.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(ref));
			ps.executeUpdate();
			
			sql = "insert into reponse(dateReponse, Avis, idPublication, idEditeur) values (?, ?, ?, ?)";
			ps =  con.prepareStatement(sql);
			ps.setString(1, dateFormat.format(new Date()));
			ps.setInt(2, Integer.parseInt(avis));
			ps.setInt(3, Integer.parseInt(ref));
			ps.setInt(4, Integer.parseInt(id));
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		response.sendRedirect("Reviewer.jsp");
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
