<%@page import="java.util.Iterator"%>
<%@page import="entity.Service"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>

<%@include file="header.jsp" %>

<html>
    <head>   
        <link rel="stylesheet" href="css/bootstrap.min.css"> 
        <link rel="stylesheet" href="css/font-awesome.min.css">   
        <link rel="stylesheet" href="css/editor/bootstrap-editable.css">   
        <link rel="stylesheet" href="css/data-table/bootstrap-table.css">
        <link rel="stylesheet" href="css/data-table/bootstrap-editable.css"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <title>Nos services </title>
    </head>
    <body> 
        <div class="container">
            <div class="card" style=" margin-bottom: 20px;">
                <div class="card-header">

                    <c:set value="${id2}" var="s" />
                    <c:choose>

                        <c:when test = "${s == null}"> 
                            Toutes les offres de services

                        </c:when>
                        <c:when test = "${s != null}"> 
                            Toutes les demandes de services
                        </c:when>

                    </c:choose>
                </div>

                <div class="card-body"> 
                    <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
                        <thead>
                            <tr> 
                                <th>ID</th>
                                <th data-visible="false">Proposé par</th>
                                <th>Type de service</th>
                                <th>Nature de service</th>
                                <th data-visible="false">Période</th>
                                <th>Description du service</th>
                                <th data-visible="false">Description détaillée du service</th>
                                <th data-visible="false">Localication</th> 
                                <th data-visible="true">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                    <c:set value="<%=u.isEstAdmin()%>" var="ad" />
                            <c:choose>

                                <c:when test = "${s == null}"> 
                                    <c:forEach var="c" items="${offres}">
                                        <c:choose>

                                            <c:when test = "${c.etat == 'VALIDE' || (ad == true  && c.etat == 'A_VALIDER' )}"> 

                                                <tr> 
                                                    <td>${c.id}</td>
                                                    <td>${c.offreUser.login} ${c.demandeUser.login}</td>
                                                    <td>${c.typeService}</td>
                                                    <td>${c.natureService.description}</td> 
                                                    <td>
                                                        <strong>Du</strong>  
                                                        <fmt:formatDate pattern="dd-MM-yyyy" value="${c.dateDebut}"  /> 
                                                        <strong>Au</strong> 
                                                        <fmt:formatDate pattern="dd-MM-yyyy" value="${c.dateFin}"  /> 
                                                    </td>
                                                    <td>${c.courteDescription}</td>
                                                    <td>${c.longueDescription}</td>
                                                    <td>${c.localisation}</td> 
                                                    <td>
                                             <center>
                                                <% if (u.isEstAdmin()) {%> 
                                                <c:if  test = "${c.etat == 'A_VALIDER'}"> 
                                                <a href="ServiceAccept?id=${c.id}" class="btn btn-success"> <i class="fa fa-check" aria-hidden="true"></i> </a>
                                                <a href="ServiceDeletebyAdmin?id=${c.id}" class="btn btn-danger"> <i class="fa fa-trash" aria-hidden="true"></i> </a>
                                                </c:if>
                                                
                                                <a href="ServiceShowDetails?id=${c.id}" class="btn btn-primary"> <i class="	fa fa-search" aria-hidden="true"></i> </a>

                                                 <% } else { %>
                                                <a href="ServiceShowDetails?id=${c.id}" class="btn btn-primary"> <i class="	fa fa-search" aria-hidden="true"></i> </a>

                                                <% }%>
                                            </center>
                                            </td>
                                            </tr>
                                        </c:when>

                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:when test = "${s != null}"> 
                                <c:forEach var="c" items="${demandes}">
                                    <c:choose>

                                        <c:when test = "${c.etat == 'VALIDE' || (ad == true && c.etat == 'A_VALIDER' )}"> 

                                            <tr> 
                                                <td>${c.id}</td>
                                                <td>${c.offreUser.login} ${c.demandeUser.login}</td>
                                                <td>${c.typeService}</td>
                                                <td>${c.natureService.description}</td> 
                                                <td>
                                                    <strong>Du</strong>  
                                                    <fmt:formatDate pattern="dd-MM-yyyy" value="${c.dateDebut}"  /> 
                                                    <strong>Au</strong> 
                                                    <fmt:formatDate pattern="dd-MM-yyyy" value="${c.dateFin}"  /> 
                                                </td>
                                                <td>${c.courteDescription}</td>
                                                <td>${c.longueDescription}</td>
                                                <td>${c.localisation}</td> 
                                                <td>
                                            <center>
                                                <% if (u.isEstAdmin()) {%> 
                                                <c:if  test = "${c.etat == 'A_VALIDER'}"> 
                                                <a href="ServiceAccept?id=${c.id}" class="btn btn-success"> <i class="fa fa-check" aria-hidden="true"></i> </a>
                                                <a href="ServiceDeletebyAdmin?id=${c.id}" class="btn btn-danger"> <i class="fa fa-trash" aria-hidden="true"></i> </a>
                                                </c:if>
                                                
                                                <a href="ServiceShowDetails?id=${c.id}" class="btn btn-primary"> <i class="	fa fa-search" aria-hidden="true"></i> </a>

                                                 <% } else { %>
                                                <a href="ServiceShowDetails?id=${c.id}" class="btn btn-primary"> <i class="	fa fa-search" aria-hidden="true"></i> </a>

                                                <% }%>
                                            </center>
                                            </td>
                                            </tr>
                                        </c:when>

                                    </c:choose>
                                </c:forEach>
                            </c:when>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
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