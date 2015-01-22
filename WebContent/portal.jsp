<%@page import="com.market.bean.Publication"%>
<%@page import="com.market.dao.PublicationDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- if (session == true) then redirect to profile -->
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
    
    <!-- HTML code from Bootply.com editor -->
    
    <body  >
        
      <!-- Begin Navbar -->
<div class="navbar navbar-static">
    <div class="container">
      <a class="navbar-toggle" data-toggle="collapse" data-target=".nav-collapse">
        <span class="glyphicon glyphicon-chevron-down"></span>
      </a>
      <div class="nav-collapse collase">
        <ul class="nav navbar-nav">  
          <li><a href="./">Accueil</a></li>
          <li><a href="Rechercheur.jsp">Rechercheur</a></li>
          <li><a href="Reviewer.jsp">Reviewer</a></li>
        </ul>
        

        <ul class="nav navbar-nav navbar-right ">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i> <i class="glyphicon glyphicon-chevron-down"></i></a>
            <ul class="dropdown-menu">
              <li><a href="login.html">Login</a></li>
              <li><a href="#">Profile</a></li>
              <li class="divider"></li>
              <li><a href="#">About</a></li>
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
          <p class="lead">Bienvenue sur le portail des recherches scientifiques </p></h1>
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
          			<li><a href="login.html">S'authentifier</a></li>
          			<li><a href="Rechercheur Form.html">Inscription Rechercheur</a></li>
          			<li><a href="Reviewer Form.html">Inscription Reviewer</a></li>
          			<li><a href="#aide">Aide</a></li>
				</ul>
              </div>
      		</div>  
      		<div class="col col-sm-9">
              <div class="panel">
              <h1>A la Une</h1>
			  <%
			  	PublicationDao dao = new PublicationDao();
			  	  		
			  			// valider = true
			  	  	  	ArrayList<Publication> publications = dao.getAllPublications();
			  	  		
			  	  		for(int i = 0; i < publications.size(); i++){
			  	  		
			 %>
			 
			 		<h3><a href="#" ><%= publications.get(i).getTitre() %></a></h3>
					<div class="meta type">Date de publication :  <strong><%= publications.get(i).getDateDePublication() %></strong></div>
					<div class="meta type">Description :  <strong><%= publications.get(i).getDescription() %></strong></div>
					<div class="meta type">Avis :  <%  for(int j = 0; j< publications.get(i).getAvis(); j++) { %><i class="glyphicon glyphicon-star"></i><% } %></div>
					<div class="meta type"><strong><a class="btn btn-default" href="Download?fileName=<%= publications.get(i).getFichier() %>"> <i class="glyphicon glyphicon-file"></i>Consulter le document</a></strong></div><br>
			
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