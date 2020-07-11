<%@page import="java.util.Iterator"%>
<%@page import="entity.Service"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>

<%@include file="header.jsp" %>

<html>
    <head>   



        <title></title>
    </head>
    <body> 

        <div class="container">
            <div class="card" style="margin-top: 100px; margin-bottom: 20px;">
                <div class="card-header">
                    <c:set value="${notification}" var="s" /> 
                    <c:if  test = "${s.service.offreService == 'Demande de service'}"> 
                        Détails de la demande de service - Réf:  <c:out value ="${s.service.id}"/>
                    </c:if>
                    <c:if  test = "${s.service.offreService =='Offre de service'}"> 
                        Détails de l'offre de service - Réf:  <c:out value ="${s.service.id}"/>
                    </c:if>

                    
                </div>

                <div class="card-body"> 
                    <label><strong>Message: </strong></label>  <c:out value ="${s.message}"/><br>
                   <div class="dropdown-divider"></div> 
                    <label><strong>Envoyé par:</strong> </label>  
                    <c:out value ="${s.emetteur.nom}"/>   <c:out value ="${s.emetteur.prenom}"/> <br>
                    <label>  <strong>Pseudonyme: </strong> </label><c:out value ="${s.emetteur.login}"/> <br>
                    <label> <strong>Description personnelle:  </strong></label> <c:out value ="${s.emetteur.description}"/> <br>
                    <label> <strong>Adresse e-mail   </strong></label> <c:out value ="${s.emetteur.email}"/> <br>
                    <label> <strong>Numéro téléphone:  </strong> </label> <c:out value ="${s.emetteur.tel}"/> <br>
<div class="dropdown-divider"></div> 
                    <label><strong>Description  du service: </strong></label>  <c:out value ="${s.service.courteDescription}"/><br>
                    <label><strong>Période du service: </strong></label>      <strong>Du</strong>  
                    <fmt:formatDate pattern="dd-MM-yyyy" value="${s.service.dateDebut}"  /> 
                    <strong>Au</strong> 
                    <fmt:formatDate pattern="dd-MM-yyyy" value="${s.service.dateFin}"  /> <br>
                


                    <c:if  test = "${s.service.etat == 'A_VALIDER'}"> 
                        <a href="ServiceAccept?id=${s.service.id}" class="btn btn-success"> Accepter </a>
                        <a href="ServiceDeletebyAdmin?id=${s.service.id}" class="btn btn-danger"> Supprimer </a>
                    </c:if>
                </div>
            </div>
        </div>



        <!-- Footer --> 
        <footer class="page-footer font-small blue bg-primary mb-md-0 pt-4 fixed-bottom" >

            <!-- Copyright -->
            <div class="footer-copyright py-3" style="color: white;"> 2020 Copyright:
                <a href="/ServeuAppJava-war/" style="color: white;"> WHEO</a>
                <a style="color: white; position: absolute; right: 20px;"href="/ServeuAppJava-war/"> We Help Each Other</a>
                <a style="color: white; position: absolute; right:300px;"href="/"> Contactez nous</a>
            </div>

        </footer>




        <script src="bootstrap-4.0.0/assets/js/vendor/jquery-slim.min.js"></script>
        <script src="bootstrap-4.0.0/assets/js/vendor/popper.min.js"></script>
        <script src="bootstrap-4.0.0/js/dist/util.js"></script>
        <script src="bootstrap-4.0.0/js/dist/dropdown.js"></script>
        <script src="bootstrap-4.0.0/js/dist/collapse.js"></script>  


        <!-- jquery
     ============================================ -->
        <script src="js/vendor/jquery-1.12.4.min.js"></script>
        <!-- bootstrap JS
          ============================================ -->
        <script src="js/bootstrap.min.js"></script> 
        <!-- data table JS
          ============================================ -->
        <script src="js/data-table/bootstrap-table.js"></script>
        <script src="js/data-table/tableExport.js"></script>
        <script src="js/data-table/data-table-active.js"></script>
        <script src="js/data-table/bootstrap-table-editable.js"></script>
        <script src="js/data-table/bootstrap-editable.js"></script>
        <script src="js/data-table/bootstrap-table-resizable.js"></script>
        <script src="js/data-table/colResizable-1.5.source.js"></script>
        <script src="js/data-table/bootstrap-table-export.js"></script>
        <!--  editabl JS
          ============================================ --> 
        <!-- Chart JS
          ============================================ -->
        <script src="js/chart/jquery.peity.min.js"></script>
        <script src="js/peity/peity-active.js"></script>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>


        <script src="js/script.js"></script>  
    </body>
</html>