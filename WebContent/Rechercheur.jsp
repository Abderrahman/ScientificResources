<%@page import="com.market.bean.Reviewer"%>
<%@page import="com.market.bean.Region"%>
<%@page import="com.market.bean.Publication"%>
<%@page import="com.market.dao.PublicationDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Marché public</title>
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="bootstrap/dist/css/bootstrapValidator.min.css"/>
		<link href="bootstrap/bootstrap-glyphicons.css" rel="stylesheet" type="text/css"/>
		<!--<link href="bootstrap/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css"/>-->
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
    	if(session.getAttribute("RechercheurSession") == null){
                response.sendRedirect("login.html");
                return;
            }
            
            String userName = null;
            int ID = 1;
            String ID2 = null;
            
        	Cookie[] cookies = request.getCookies();
        	if(cookies !=null){
        		for(Cookie cookie : cookies){
        	if(cookie.getName().equals("Rechercheur")) userName = cookie.getValue();
            		if(cookie.getName().equals("ID_Rechercheur")) ID2 = cookie.getValue();
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
        </ul>
        

        <ul class="nav navbar-nav navbar-right ">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><strong><%= "userName" %> (Rechercheur)</strong>  <i class="glyphicon glyphicon-user"></i> <i class="glyphicon glyphicon-chevron-down"></i></a>
            <ul class="dropdown-menu">
              <li><a href="#">Login</a></li>
              <li><a href="profile.jsp">Profile</a></li>
              <li class="divider"></li>
              <li><a href="LogoutAcheteur">Logout</a></li>
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
                  	<li><a href="#p">Publier un article</a></li>
          			<li><a href="#a">Articles publiés</a></li>
				</ul>
              </div>
      		</div>  
      		<div class="col col-sm-9">
              <div class="panel">
             
             
				
				 <a id="p"></a> 
              <h2>Publier un article</h2>
		
              <form method="post" action="Publication" enctype="multipart/form-data" id="form" onsubmit="return(validate());">
			  <div class="form-group">
			    <label for="titre">Titre</label>
			    <input type="text" class="form-control" name="titre" >
			    <label id="label1" style="color:red;"></label>
			  </div>
			  <div class="form-group">
			    <label for="description">Description</label>
			    <textarea class="form-control" rows="3" name="description" maxlength="300" ></textarea>
			    <label id="label2" style="color:red;"></label>
			  </div>
			<div class="form-group">
			    <label for="InputFile">Fichier</label>
			    <input type="file" name="InputFile">
			    <p class="help-block">Veuillez attacher ici le fichier pdf.</p>
			  </div>
  			  <button type="submit" class="btn btn-primary">Submit</button>
  			  
 			  <input type="hidden" name="ID" value="<%=ID%>"/>

			</form>
	    	<hr>
                         
             <a id="a"></a> 
             <h3>Articles publiés</h3>
	
				<table id="dt" class="table table-hover">
			  		<thead>
			  			<tr>
			  				<td>Titre</td>
		  					<td>Description</td>
			  				<td>Date de publication</td>
			  				<td>Fichier</td>
			  				<td>Validée</td>
			  			</tr>
			  		</thead>
			  		<tbody>
			  		
			  		<%
	  			PublicationDao od = new PublicationDao();
	    		ArrayList<Publication> publications = od.getPublicationsByID(ID);
	    		
	    		for(int i = 0; i < publications.size(); i++){
	    		
				
				%>

			  			<tr>
			  				<td><%= publications.get(i).getTitre() %></td>
		  					<td><%= publications.get(i).getDescription() %></td>
		  					<td><%= publications.get(i).getDateDePublication() %></td>
		  					<td><a class="btn btn-primary" href="Download?fileName=<%=publications.get(i).getFichier() %>" >Afficher</a></td>
				  			<td>
				  				<% if(publications.get(i).isEstValider()){ %>
				  					<span class="label label-success" >Validé</span>
				  				<% }else{ %>
				  					<span class="label label-danger" >Non Validé</span>
				  				<% } %>
				  			</td>
				  			
				  		</tr>	
				  <% } %>
				  		</tbody>
			  		
				</table>
			  	</div>
      	</div> 
  	</div>
</div>



		<script type="text/javascript" src="bootstrap/jquery.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/dataTables.bootstrap.js"></script>
		
        <!-- JavaScript jQuery code from Bootply.com editor -->
        
        <script type='text/javascript'>
        
        $(document).ready(function(e) {
        
            $('#sidebar').affix({
		      offset: {
		        top: 240
		      }
			});

			$('#dt').dataTable();
            
        });
		

		var Form = document.getElementById('form');
		function validate(){	 
			 
			var label;
			for(i=1; i<=4;i++){
				label = "label" + i;
				document.getElementById(label).innerHTML="";
			}
			
			  if(Form.titre.value  === '' || !IsAlphaNumeric(Form.titre.value)){
				Form.intitule.focus();
			    document.getElementById("label1").innerHTML="Le champ titre doit être remplie";
				return false;
			}
			  if(Form.description.value  === '' || !IsAlphaNumeric(Form.description.value)){
				Form.description.focus();
			    document.getElementById("label2").innerHTML="Le champ description doit être remplie";
				return false;
			}	 
		}
		
		function IsAlphaNumeric(Val){
			
			var regId = new RegExp('^[^<>]+$','i');
			

			return regId.test(Val);
		}

		
			  
        
        </script>
    </body>
</html>