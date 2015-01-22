package com.market;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.RechercheurDao;

/**
 * Servlet implementation class LoginAcheteur
 */
@WebServlet("/LoginRechercheur")
public class LoginRechercheur extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		RechercheurDao a = new RechercheurDao();
		try {
			
			Integer id = a.authenticate(username, password);
			if(id != -1){
				
				System.out.println("success");
			    HttpSession session=request.getSession();
			    session.setAttribute("RechercheurSession",username);
			    //setting session to expiry in 60 mins
	            session.setMaxInactiveInterval(60*60);
	           
	            Cookie loginCookie = new Cookie("Rechercheur",username );
	            Cookie idcookie = new Cookie("ID_Rechercheur",id.toString());
	            
	            //setting cookie to expiry in 1 day
	            loginCookie.setMaxAge(3600*24);
	            idcookie.setMaxAge(3600*24);

	            response.addCookie(loginCookie);
	            response.addCookie(idcookie);
	            
	            response.sendRedirect("Rechercheur.jsp");
			
			}
			else {
	            RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.html");
	            request.setAttribute("message", "<font color=red>Either user name or password is wrong.</font>");
	            rd.include(request, response);
		}
				
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		

	}

}
