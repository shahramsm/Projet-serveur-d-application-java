<%-- 
    Document   : accueil
    Created on : 29 févr. 2020, 16:06:46
    Author     : user
--%>

<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accueil</title>
    </head>
    <body>
        <div class="container">
            <div class="row" style="margin-top: 80px;">
            <div class="col-md-4 mb-3">
           
      
        <div class="card" style="width:400px">
            <img class="card-img-top" src="img/demServic.jpg" alt="Card image" style="width:100%; height: 200px;">
            <div class="card-body">

                <p class="card-text">Vous etes en galère ? Demandez de l'aide...</p>
                <a href="OffreServiceAddAction" class="btn btn-primary">Demander un service</a>
            </div>
        </div>
        </div>
            <div class="col-md-4 mb-3"></div>
    <div class="col-md-4 mb-3">
           
      
        <div class="card" style="width:400px">
            <img class="card-img-top" src="img/offrirS.jpg" alt="Card image" style="width:100%; height: 200px;">
            <div class="card-body"> 
                <p class="card-text">Vous avez du temps libre ? Proposez de l'aide...</p>
                <a href="OffreServiceAddAction?id=<%=u.getCodeUtilisateur()%>" class="btn btn-primary">Proposer un service</a>
            </div>
        </div>
        </div>
    </div>
            <div class="row" style="margin-bottom:50px; ">
            <div class="col-md-4 mb-3">
           
      
        <div class="card" style="width:400px">
            <img class="card-img-top" src="img/mesServices.jpg" alt="Card image" style="width:100%; height: 200px;">
            <div class="card-body"> 
                <p class="card-text">Consultez vos services sur notre site...</p>
                <a href="ServiceShowByUser?id=<%=u.getCodeUtilisateur()%>&&id2=3" class="btn btn-primary">Mes services</a>
            </div>
        </div>
        </div>
            <div class="col-md-4 mb-3"></div>
    <div class="col-md-4 mb-3">
           
      
        <div class="card" style="width:400px">
            <img class="card-img-top" src="img/profile.jpg" alt="Card image" style="width:100%; height: 200px;">
            <div class="card-body"> 
                <p class="card-text">Consultez votre profile...</p>
                <a href="UserEditAction?id=<%=u.getCodeUtilisateur()%>" class="btn btn-primary">Mon profile</a>
            </div>
        </div>
        </div>
    </div>
    </div>


</body>
        <%@include file="footer.jsp" %>
</html>

