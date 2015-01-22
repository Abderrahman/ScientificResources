<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.market.dbconnection.ConnectionUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.market.bean.Publication"%>
<%@page import="com.market.dao.PublicationDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>ScienceSpace</title>
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="//bootstrap/3.0.0/css/bootstrap-glyphicons.css" type="text/css" rel="stylesheet">
        <!--[if lt IE 9]>
          <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <!-- CSS code from Bootply.com editor -->
        
        <style type="text/css">
            /* bootstrap 3 helpers */

.navbar-form input, .form-inline input {
	width:auto;
}

/* end */

/* custom theme */

header {
	min-height:230px;
  	margin-bottom:5px;
}

@media (min-width: 979px) {
  #sidebar.affix-top {
      position: static;
  }
  
  #sidebar.affix {
      position: fixed;
      top: 0;
      width:21.2%;
  }
}

.affix,.affix-top {
   position:static;
}

/* theme */

body {
  color:#828282;
  background-color:#eee;
}

a,a:hover {
	color:#ff3333;
  	text-decoration:none;
}

.highlight-bk {
	background-color:#ff3333;
    padding:1px;
    width:100%;
}

.highlight {
	color:#ff3333;
}
  
h3.highlight  {
	padding-top:13px;
    padding-bottom:14px;
  	border-bottom:2px solid #ff3333;
}

.navbar {
	background-color:#ff3333;
  	color:#ffffff;
    border:0;
  	border-radius:0;
}
.navbar-nav > li > a {
  	color:#fff;
  	padding-left:20px;
  	padding-right:20px;
  	border-left:1px solid #e8e8e8;
}
.navbar-nav > li:last-child > a {
  	border-right:1px solid #e8e8e8;
}
.navbar-nav > .active > a, .navbar-nav > .active > a:hover, .navbar-nav > .active > a:focus {
    color: #ffffff;
	background-color:transparent;
}
.navbar-nav > .open > a, .navbar-nav > .open > a:hover, .navbar-nav > .open > a:focus {
	color: #555555;
	background-color:transparent;
  	opacity:.9;
}

.nav .open > a {
    border-color:#777777;
    border-width:0;
}

.accordion-group {
	border-width:0;
}

.dropdown-menu {
	min-width: 250px;
}

.accordion-heading .accordion-toggle, .accordion-inner, .nav-stacked li > a {
	padding-left:1px;
}

.caret {
	color:#fff;
}

.navbar-toggle {
	color:#fff;
    border-width:0;
}
  
.navbar-toggle:hover {
	background-color:#fff;
}

.panel {
	padding-left:27px;
    padding-right:27px;
}

/* end theme */
        </style>
    </head>
    <%
    	if(session.getAttribute("ReviewerSession") == null){
                response.sendRedirect("login.html");
                return;
            }
            
            String userName = null;
            String ID2 = null;
            int ID = 1;
            
            
        	Cookie[] cookies = request.getCookies();
        	if(cookies !=null){
        		for(Cookie cookie : cookies){
            		if(cookie.getName().equals("Reviewer")) userName = cookie.getValue();
            		if(cookie.getName().equals("ID_Reviewer")) ID2 = cookie.getValue();
        		}
        	}
        	
        	ID = Integer.parseInt(ID2);
    %>
    <!-- HTML code from Bootply.com editor -->
    
    <body>
            
      <!-- Begin Navbar -->
<div class="navbar navbar-static">
    <div class="container">
      <a class="navbar-toggle" data-toggle="collapse" data-target=".nav-collapse">
        <span class="glyphicon glyphicon-chevron-down"></span>
      </a>
      <div class="nav-collapse collase">
        <ul class="nav navbar-nav">  
          <li><a href="./">Accueil</a></li>
          <li><a href="Reviewer.jsp">Reviewer</a></li>
        </ul>
        

        <ul class="nav navbar-nav navbar-right ">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><strong><%= userName %> (Reviewer)</strong>  <i class="glyphicon glyphicon-user"></i> 
            <i class="glyphicon glyphicon-chevron-down"></i></a>
            <ul class="dropdown-menu">
              <li><a href="profile.jsp">Profile</a></li>
              <li class="divider"></li>
              <li><a href="Logout">Logout</a></li>
             </ul>
          </li>  
        </ul>
      </div>
    </div>
</div><!-- /.navbar -->

<header class="masthead">
  <div class="container">
    <div class="row">
      <div class="col col-sm-6">
        <h1><a href="#" title="scroll down for your viewing pleasure">Portail des recherches scientifiques</a>
          <p class="lead">Bienvenue sur le portail des recherches scientifiques</p></h1>
      </div>
      <div class="col col-sm-6">
        <div class="well pull-right">
          <img src="assets/bandeau_marches_publics.jpg" style="height:120px; width:320px">        
        </div>
      </div>
    </div>
  </div>
</header>

<!-- Begin Body -->
<div class="container">
	<div class="row">
  			<div class="col col-sm-3">
              <div id="sidebar">
      			<ul class="nav nav-stacked">
                    <li><h3 class="highlight">Channels <i class="glyphicon glyphicon-dashboard pull-right"></i></h3></li>
                  	<li><a href="#a">Liste des articles non validées</a></li>
				</ul>
              </div>
      		</div>  
      		<div class="col col-sm-9">
              <div class="panel">
              
			  <a id="a"></a>
              <h1>Liste des articles non validées</h1>
				<%
					PublicationDao dao = new PublicationDao();
																		
				  	ArrayList<Publication> publications = dao.getAllPublicationsNonValidee();
				
					for(int i = 0; i < publications.size(); i++){
				%>	
				<div class="well well-sm">
					<h3><a href="#" ><%= publications.get(i).getTitre() %></a></h3>
					<div class="meta type">Date de publication :  <strong><%= publications.get(i).getDateDePublication() %></strong></div>
					<div class='meta type'>Titre :  <strong><%= publications.get(i).getTitre() %></strong></div>
					<div class='meta type'><h4>Description:</h4><strong><%= publications.get(i).getDescription() %></strong></div><br>
				 	<div class='meta type'>L'identifiant du publiant de l'article: <strong><%= publications.get(i).getId_user()  %></strong></div><br>
				 	<div class="meta type"><strong><a href="Download?fileName=<%= publications.get(i).getFichier() %>">Cliquer ici pour consulter le Document</a></strong></div><br>
					
					<form method="post" action="Attribuer2" id="form<%= i %>" >
				 	 	Avis (n/5): <input min="1" max="5" type="number" name="avis">
					 	<input type="submit" class="btn btn-primary" value="Valider Article">
					 	<input type="hidden" value="<%= publications.get(i).getReference() %>" name="ref">
					 	<input type="hidden" value="<%= ID %>" name="id">
					</form>
				
				</div>
			
			  <%
				} 
			  %>
		   </div>
      	</div> 
  	</div>
</div>



		<script type="text/javascript" src="bootstrap/jquery.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>


        <!-- JavaScript jQuery code from Bootply.com editor -->
        
        <script type='text/javascript'>
        
        $(document).ready(function() {
        
            $('#sidebar').affix({
		      offset: {
		        top: 240
		      }
			});
        
        });
		
		</script>
    </body>
</html>