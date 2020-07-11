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
                    <c:set value="${service}" var="s" />
                    <c:set value="<%=u%>" var="u" />
                    <c:if  test = "${s.offreService == 'Demande de service'}"> 
                        Détails de la demande de service - Réf:  <c:out value ="${s.id}"/>
                    </c:if>
                    <c:if  test = "${s.offreService =='Offre de service'}"> 
                        Détails de l'offre de service - Réf:  <c:out value ="${s.id}"/>
                    </c:if>

                </div>

                <div class="card-body"> 
                    <label>Proposé par: </label> <c:out value ="${s.offreUser.login}"/> <c:out value ="${s.demandeUser.login}"/>  <br>
                    <label>Type de service: </label>  <c:out value ="${s.typeService}"/><br>
                    <label>Nature de service: </label>    <c:out value ="${s.natureService.description} "/><br>

                    <label>Période: </label>      <strong>Du</strong>  
                    <fmt:formatDate pattern="dd-MM-yyyy" value="${s.dateDebut}"  /> 
                    <strong>Au</strong> 
                    <fmt:formatDate pattern="dd-MM-yyyy" value="${s.dateFin}"  /> <br>

                    <label>Description: </label>     <c:out value ="  ${s.courteDescription}"/><br>
                    <label>Description détaillée:  </label>     <c:out value ="  ${s.longueDescription}"/><br>
                    <label>Localisation: </label>   <c:out value ="   ${s.localisation} "/><br>
                    <%if (u != null) {%>

                    <c:choose>
                        <c:when  test = "${(s.offreUser.codeUtilisateur != u.codeUtilisateur && s.demandeUser.codeUtilisateur == null) || (s.demandeUser.codeUtilisateur != u.codeUtilisateur && s.offreUser.codeUtilisateur == null)}"> 
                            <c:if  test = "${s.etat == 'A_VALIDER' && u.estAdmin == true}"> 
                                <a href="ServiceAccept?id=${s.id}" class="btn btn-success"> Accepter </a>
                                <a href="ServiceDeletebyAdmin?id=${s.id}" class="btn btn-danger"> Supprimer </a>
                            </c:if>
                            <c:if  test = "${s.offreService == 'Demande de service' && s.etat == 'VALIDE'}"> 
                                <a href="ServicePropositionAction?id=${s.id}" class="btn btn-success"> Proposer un service </a>
                            </c:if>
                            <c:if  test = "${s.offreService =='Offre de service' && s.etat == 'VALIDE'}"> 
                                <a href="ServicePropositionAction?id=${s.id}" class="btn btn-success"> Accepter un service </a>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <c:if  test = "${s.etat == 'A_VALIDER' || s.etat == 'VALIDE'}"> 
                                <a href="ServiceEdit?id=${s.id}" class="btn btn-success"> Modifier</a>

                                <c:if  test = "${s.offreService == 'Demande de service'}"> 
                                    <a href="ServiceDelete?idD=${s.id}&&id2=<%=u.getCodeUtilisateur()%>" class="btn btn-danger"onclick="return confirm('Voulez vous vraiment supprimer ce service ?')"> Supprimer </a>

                                </c:if>
                                <c:if  test = "${s.offreService =='Offre de service'}"> 
                                    <a href="ServiceDelete?id=${s.id}&&id2=<%=u.getCodeUtilisateur()%>" class="btn btn-danger" onclick="return confirm('Voulez vous vraiment supprimer ce service ?')"> Supprimer </a>

                                </c:if>
                                


                            </c:if>
                        </c:otherwise>
                    </c:choose>

                    <%
                        }%>

                </div>
            </div>
        </div>



        <!-- Footer --> 
        <% if (u != null) {%>
        <footer class="page-footer font-small blue bg-primary mb-md-0 pt-4  fixed-bottom" >

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
        <% } else {%>
        <footer class="page-footer font-small  bg-light   " >


            <!-- Footer Links -->

            <!-- Copyright -->
            <div class="footer-copyright py-3"> 2020 Copyright:
                <a href="/ServeuAppJava-war/"> WHEO</a>
                <a style="position: absolute; right: 20px;"href="/ServeuAppJava-war/"> We Help Each Other</a>
                <a style="position: absolute; right:300px;"href="/"> Contactez nous</a>
            </div>

            <!-- Copyright -->

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
        <% }%>
    </body>
</html>