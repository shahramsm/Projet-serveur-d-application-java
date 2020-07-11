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
.container  {
  flex: 1;
}

</style>
        <%
            Utilisateur u = (Utilisateur) session.getAttribute("user");
            if (u == null) {
                 String url = request.getAttribute("javax.servlet.forward.request_uri").toString();
    String chaine = url.substring(19, url.length());
                                   
    if(chaine.equals("AllServicesShow") ||chaine.equals("UserAddAction") || chaine.equals("ServiceShowDetails") ){ %>
           
              <nav class="navbar navbar-expand-sm bg-light navbar-light fixed-top">
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
           <% }else{
                
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } }else {
                System.out.println("non null");


        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
            <a class="navbar-brand" href="accueil.jsp">WHEO</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">

                    <li class="nav-item dropdown active">
                        <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Offres de services
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item"  href="OffreServiceAddAction?id=<%=u.getCodeUtilisateur()%>" >Offrir un service</a>
                            <a class="dropdown-item" href="ServiceShowByUser?id=<%=u.getCodeUtilisateur()%>">Mes offres de services</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="ServicesShow">Toutes les offres de services</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown active">
                        <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Demandes de services 
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item"   id="demanderUnService" href="OffreServiceAddAction">Demander un service</a> 
                            <a class="dropdown-item" href="ServiceShowByUser?id=<%=u.getCodeUtilisateur()%>&&id2=2">Mes demandes de services</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="ServicesShow?id2=2">Toutes les demandes de services</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown active">
                        <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Services 
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="ServiceShowByUser?id=<%=u.getCodeUtilisateur()%>&&id2=3">Mes services</a> 
                            <div class="dropdown-divider"></div> 
                            <a class="dropdown-item" href="AllServicesShow">Tous les services </a>
                        </div>
                    </li>
                   

                </ul>

                <ul class="navbar-nav  navbar-right" >
                    <li class="nav-item active">
                        <a class="nav-link" href="ActualiserAction?id=<%=u.getCodeUtilisateur()%>"><i class="fas fa-sync-alt"></i></a>
                    </li> 
                    <li class="nav-item active">
                        <a class="nav-link" href="UserEditAction?id=<%=u.getCodeUtilisateur()%>"><%=u.getPrenom()%> <%=u.getNom()%> </a>
                    </li> 
                    <li class=" dropdown-menu-right  "  >
                        <a class="nav-link" href="#" id="dLabel" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                            <i class="far fa-bell">
                                <% int counter = 0;
                                    for (Iterator it = u.getNotifcationRecep().iterator(); it.hasNext();) {
                                        Notification notification = (Notification) it.next();
                                        if (!notification.isEstLu()) {
                                            counter++;
                                        }
                                    }
                                    if (counter != 0) {
                                %>

                                <span class="badge badge-danger" style="position: relative; top: -10px;">

                                    <%=counter%>
                                </span>
                                <% }%>
                            </i>
                        </a>
                            <ul class="dropdown-menu dropdown-menu-right notifications scrollbar"  role="menu" aria-labelledby="dLabel">
                             
                                <div class="notification-heading"><a class="menu-title">
                                    <%     if (counter != 0) {
                                %>
                                Nottifications(<%=counter%>)
                                <% }else{ %>
                                Notifications
                                <% }%>
                                    </a>
                                    <a href="NotificationsShowAll?id=<%=u.getCodeUtilisateur()%>" class="menu-title" style="position: absolute; right:5px;">Afficher tout   <i class="fa fa-eye"></i></a>
                            </div>
                             
                            
                            
                                      
                           <li class="divider"></li>
                          <% ListIterator listIterator =  u.getNotifcationRecep().listIterator( u.getNotifcationRecep().size());
                                while (listIterator.hasPrevious()) {
                                    Notification notification = (Notification) listIterator.previous();
                                    if (notification.isEstLu()) {
                            %>
                           <li class="notifications-wrapper">


                               <div class="notification-item" style="background:#fff;" >
                                    <a href="NotificationShow?id=<%=notification.getId()%>&&id2=<%=u.getCodeUtilisateur()%>" class="item-title">
                                        <fmt:formatDate type = "date"  value="<%=notification.getDateNotif()%>"  />
                                    </a>
                                    <p  class="item-info"><%=notification.getMessage()%></p>
                                </div>



                            </li>
                           <%  } else {%>
                           <li class="notifications-wrapper">


                               <div class="notification-item" style="background:#ccc;" >
                                    <a  href="NotificationShow?id=<%=notification.getId()%>&&id2=<%=u.getCodeUtilisateur()%>"class="item-title">
                                        <fmt:formatDate type = "date" value="<%=notification.getDateNotif()%>"  />
                                    </a>
                                    <p  class="item-info"><%=notification.getMessage()%></p>
                                </div>



                            </li>
                             <%       }

                                }
                            %>
                            <li class="divider"></li>
                            
                            <div class="notification-footer"><center><a href="NotificationsShowAll?id=<%=u.getCodeUtilisateur()%>"class="menu-title">Afficher tout    <i class="fa fa-eye"></i></a></center></div>
                        </ul>
                    </li>
                    <li class="nav-item active">
                        <a href="Deconnexion"class="nav-link" onclick="return confirm('Voulez vous vraiment quitter ?')">
                            <span class="glyphicon glyphicon-log-out"></span> Déconnexion</a>
                    </li>
                </ul>
            </div>
        </nav>

    </body>

    <% }%>

</html>