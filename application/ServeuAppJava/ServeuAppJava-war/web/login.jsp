<%-- 
    Document   : login
    Created on : 2 févr. 2020, 15:37:42
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" href="bootstrap-4.0.0/dist/css/bootstrap.min.css"> 
        <link rel="stylesheet" href="css/all.css">   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page de connexion</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card card-signin my-5">
                        <div class="card-body">
                            <h5 class="card-title text-center">Connexion</h5>
                            <form action="ConnexionAction" method="POST" class="form-signin needs-validation" novalidate>
                                <div class="form-label-group">
                                    <input type="email" id="inputEmail" class="form-control" placeholder="Adresse e-mail" name="mail" required autofocus>
                                    <label for="inputEmail">Adresse e-mail</label>

                                    <div class="invalid-feedback">Merci de saisir une adresse e-mail valide.</div>
                                </div>

                                <div class="form-label-group">
                                    <input type="password" id="inputPassword" class="form-control" name="password" placeholder="Mode de passe" required>
                                    <label for="inputPassword">Mot de passe</label>
                                    
                                    <div class="invalid-feedback">Merci de saisir un mot de passe.</div>
                                </div>
                                <div class="alert-danger divlog" style="border-radius: 30px; padding-left:  30px;">
                                    <%
                                        ArrayList erreurs = (ArrayList) request.getAttribute("erreurs");
                                        if (erreurs != null) {

                                            for (int i = 0; i < erreurs.size(); i++) {
                                                out.println((String) erreurs.get(i) + "<br/>");
                                            }

                                        }
                                    %>


                                </div><br> 

                                
                                <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Se connecter</button>
                                <hr class="my-4">
                                <center><label > Je n'ai pas un compte ?</label></center>
                              
                                <a href="UserAddAction" class="btn btn-lg btn-google btn-block text-uppercase"  ><i class="fa fa-address-card"></i> S'inscrire</a>
                                <a href="index.html"class="btn btn-lg btn-facebook btn-block text-uppercase" ><i class="fa fa-home"></i> Page d'accueil</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script src="bootstrap-4.0.0/assets/js/vendor/jquery-slim.min.js"></script>
         
        <script src="bootstrap-4.0.0/dist/js/bootstrap.bundle.min.js"></script>
        
  <script src="js/script.js"></script>  
    </body>
</html>
