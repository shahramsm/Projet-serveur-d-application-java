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
        <title>Nos services </title>
    </head>

    <body> 
        <div class="container"> 
            <div class="card" style=" margin-bottom: 20px;">
                <div class="card-header">
                    <c:set value="${id2}" var="s" />
                    <c:choose>

                        <c:when test = "${s == null}"> 
                            Mes offres de services

                        </c:when>
                        <c:when test = "${s == 2}"> 
                            Mes demandes de services
                        </c:when>
                        <c:when test = "${s == 3}"> 
                            Mes demandes et offres de services
                        </c:when>

                    </c:choose>
                </div>

                <div class="card-body"> 

                    <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
                        <thead>
                            <tr> 
                                <th>ID</th> 
                                <th>Description du service</th> 
                                <th data-visible="true">Etat</th> 
                                    <c:choose>
                                        <c:when test = "${s == 3}"> 

                                        <th data-visible="true">Offre / demande</th> 
                                        </c:when>
                                    </c:choose>
                                <th data-visible="true">Action</th>
                            </tr>
                        </thead>
                        <tbody> 
                            <c:choose>

                                <c:when test = "${s == null}"> 
                                    <c:forEach var="c" items="${services}"> 
                                        <tr> 
                                            <td>${c.id}</td>
                                            <td>${c.courteDescription}</td>
                                            <td>${c.etat}</td>
                                            <td> <center><a href="ServiceShowDetails?id=${c.id}" class="btn btn-primary"> <i class="fa fa-eye" aria-hidden="true"></i> </a></center></td>
                                    </tr> 
                                </c:forEach>
                            </c:when>
                            <c:when test = "${s == 2}"> 
                                <c:forEach var="c" items="${demandes}"> 
                                    <tr> 
                                        <td>${c.id}</td>
                                        <td>${c.courteDescription}</td>
                                        <td>${c.etat}</td>
                                        <td><center><a href="ServiceShowDetails?id=${c.id}" class="btn btn-primary"> <i class="	fa fa-eye" aria-hidden="true"></i> </a></center></td>
                                    </tr> 
                                </c:forEach>
                            </c:when>
                            <c:when test = "${s == 3}">  
                                <c:forEach var="c" items="${all}"> 
                                    <tr> 
                                        <td>${c.id}</td>
                                        <td>${c.courteDescription}</td>
                                        <td>${c.etat}</td>
                                        <td>${c.offreService}</td>
                                        <td> <center><a href="ServiceShowDetails?id=${c.id}" class="btn btn-primary"> <i class="fa fa-eye" aria-hidden="true"></i> </a></center></td>
                                    </tr> 
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