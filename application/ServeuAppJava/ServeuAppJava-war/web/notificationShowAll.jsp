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

                    Toutes les demandes de services

                </div>

                <div class="card-body"> 
                    <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true" data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
                        <thead>
                            <tr> 
                                <th>Date de la notification</th>
                                <th data-visible="false">Pseudonyme de l'emetteur</th>
                                <th>Message</th>
                                <th>Référence du service</th>
                                
                                <th data-visible="true">Action</th>
                            </tr>
                        </thead>
                        <tbody>

                            <c:forEach var="c" items="${notifications}">
                                  <tr> 
                                            <td>
                                                <fmt:formatDate pattern="dd-MM-yyyy" value="${c.dateNotif}"  /> 
                                            </td>
                                            <td>
                                                <c:choose>

                                                <c:when test = "${c.emetteur.estAdmin == true}"> 
                                                    Administrateur du site

                                                </c:when>
                                                <c:otherwise>
                                                    ${c.emetteur.login}
                                                </c:otherwise>
                                                </c:choose>
                                                    </td>
                                            <td>${c.message}</td>
                                            <td>${c.service.id}</td> 

                                            <td>
                                    <center>
                                        <a href="NotificationShow?id=${c.id}&&id2=<%=u.getCodeUtilisateur()%>" class="btn btn-primary"> <i class="	fa fa-search" aria-hidden="true"></i> </a>


                                    </center>
                                    </td>
                                    </tr>
                                 
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>