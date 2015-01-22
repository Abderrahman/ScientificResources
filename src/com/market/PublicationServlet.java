package com.market;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringEscapeUtils;

import com.market.bean.Publication;
import com.market.dao.PublicationDao;
import com.market.dbconnection.ConnectionUtil;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class PublicationServlet
 */
@WebServlet("/Publication")
public class PublicationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection conn;

	public PublicationServlet() {
	
			conn = ConnectionUtil.getConnection();
	        if(conn == null)
	        	System.out.println("error");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String strDirectory = "uploads";
		// gets absolute path of the web application
        String applicationPath = request.getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded file
        String uploadFilePath = applicationPath + File.separator + strDirectory;
        
        // creates the save directory if it does not exists
        File fileSaveDir = new File(uploadFilePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }
        
        MultipartRequest m = new MultipartRequest(request, uploadFilePath, 1024*1024*10);
		
        System.out.println("Upload File Directory="+fileSaveDir.getAbsolutePath());
        
        
        String InputFile = m.getFilesystemName("InputFile");
        String titre = StringEscapeUtils.escapeHtml4(m.getParameter("titre")); 
        String description = StringEscapeUtils.escapeHtml4(m.getParameter("description"));
        String ID = m.getParameter("ID");
    
        String unique = null;
        
        if(InputFile != null){
        	String ext = InputFile.substring(InputFile.lastIndexOf("."));
        	File uniqueName = new File(fileSaveDir.getAbsolutePath()+File.separator + generateUniqueFileName() + ext);
	        File f = new File(fileSaveDir.getAbsolutePath()+File.separator + InputFile);
	        f.renameTo(uniqueName);
	        unique = uniqueName.getName();
        }
        
		
 	    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Publication a = new Publication(titre, description, dateFormat.format(new Date()), unique, false);
		a.setId_user(Integer.parseInt(ID));
		
		PublicationDao od = new PublicationDao();
		od.addPublication(a);
		
		// name of the file e.g. "test.pdf"
 	    System.out.println(InputFile);
 	    response.sendRedirect("Rechercheur.jsp");
	
	}

	String generateUniqueFileName(){
	
		String filename="";
	    long millis = System.currentTimeMillis();
	    String datetime = new Date().toString();
	    datetime = datetime.replace(" ", "");
	    datetime = datetime.replace(":", "");
	    filename = datetime+"_"+millis;
	    
	    return filename;

	}
}
