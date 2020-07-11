<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="entity.Notification"%>
<%@page import="java.util.Iterator"%>
<%@page import="entity.Utilisateur"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="bootstrap-4.0.0/dist/css/bootstrap.min.css"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <title></title>
    </head>
    <body>
        <style>/* CSS used here will be applied after bootstrap.css */

 


 
.notifications {
   min-width:420px;
   height: 300px;
  }
  
 
    
 .menu-title {
     color:#000; 
      display:inline-block;
      }
 
.glyphicon-circle-arrow-right {
      margin-left:10px;     
   }
  
   
 .notification-heading, .notification-footer  {
 	padding:2px 10px;
       }
      
        
.dropdown-menu.divider {
  margin:5px 0;          
  }

.item-title {
  
 font-size:1.0rem;
 color:#000;
    
}

.notifications a.content {
 text-decoration:none;
 background:#ccc;

 }
    
.notification-item {
 padding:10px;
 margin:5px;
 border-radius:4px;
 }

.scrollbar
{
	margin-left: 30px;
	float: left;
	height: 300px;
	width: 65px;
	background: #F5F5F5;
	overflow-y: scroll;
	margin-bottom: 25px;
}
 
#dLabel::-webkit-scrollbar-track
{
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	border-radius: 10px;
	background-color: #F5F5F5;
}

#dLabel::-webkit-scrollbar
{
	width: 12px;
	background-color: #F5F5F5;
}

#dLabel::-webkit-scrollbar-thumb
{
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
	background-color: #555;
}

</style>
       

       <nav class="navbar navbar-expand-sm bg-light navbar-light">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="index.html">WHEO</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Se connecter</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="UserAddAction">S'inscrire</a>
                </li> 
            </ul>
        </nav>

    </body>

    <% }%>

</html>