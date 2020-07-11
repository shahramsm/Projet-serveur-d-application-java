<%@page import="entity.Service"%>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<html>
    <head>
        <title></title>

    </head>

    <body>  
        <div class="container">
            <div class="card" style="margin-top: 80px; margin-bottom: 20px;">
                <div class="card-header">

                    <c:set value="${service}" var="s" />

                    Information sur le service - Rèf <c:out value ="${s.id}"/>
                </div>
                <div class="card-body"> 

                    <form action="ServiceEdit" method="POST" name="test"class="needs-validation" novalidate>
                         <input type="hidden" name="user_id" value="<%=u.getCodeUtilisateur()%>" />

                        <div class="form-row">
                            <div class="col-md-4 mb-3">
                                <label >Type de service</label>
                                <div class="form-group">
                                    <c:choose >
                                        <c:when test="${s.typeService == 'Service à offrir'}">
                                            <select class="custom-select" name="typeService" required> 
                                                <option value="Service à offrir" selected>Service à offrir</option>
                                                <option value="Objet à prêter">Objet à prêter</option>
                                                <option value="Objet à donner">Objet à donner</option>
                                            </select>
                                        </c:when>
                                        <c:when test="${s.typeService == 'Objet à prêter'}">
                                            <select class="custom-select" name="typeService" required> 
                                                <option value="Service à offrir" >Service à offrir</option>
                                                <option value="Objet à prêter" selected>Objet à prêter</option>
                                                <option value="Objet à donner">Objet à donner</option>
                                            </select>
                                        </c:when>
                                        <c:when test="${s.typeService == 'Objet à donner'}">
                                            <select class="custom-select" name="typeService" required> 
                                                <option value="Service à offrir" >Service à offrir</option>
                                                <option value="Objet à prêter"  >Objet à prêter</option>
                                                <option value="Objet à donner" selected>Objet à donner</option>
                                            </select>
                                        </c:when>
                                    </c:choose>
                                    <div class="invalid-feedback">Merci de choisir de type de service</div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="validationTypeService">Nature de service</label>
                                <div class="form-group" >
                                    <select class="custom-select" name="natureService"  id="mySelect" onchange="myFunction()" required>
                                        <option value="addNature" class="text-danger">Ajouter une nouvelle nature de service</option>
                                        <c:forEach var="c" items="${naturesServices}">
                                            <option value="${c.id}" >${c.description}</option> 

                                            <c:choose >
                                                <c:when test="${s.natureService.id == c.id}">
                                                    <option value="${c.id}" selected>${c.description}</option> 
                                                </c:when>
                                            </c:choose>    
                                        </c:forEach>
                                    </select>
                                    <div class="invalid-feedback">Merci de choisir la nature de service</div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3" id="mynature">
                                <label for="validationCustom01">Nature de service</label>
                                <input type="text" class="form-control" id="validationCustom01"  pattern="[A-Za-z]{1,}" placeholder="Ajouter une nouvelle nature de service" name="nature" value="" >
                                <a id="myannuler" href="#" onclick="myFunctionHideinput()"> Annuler </a>
                                <div class="invalid-feedback">
                                    Veuillez remplir le champs Nature de service
                                </div>
                            </div>

                        </div>
                        <div class="form-row">
                            <div class="col-md-4 mb-3">
                                <div class="form-group">
                                    <label for="datetimepicker7">Date de début</label>
                                    <div class="input-group date" id="datetimepicker7" data-target-input="nearest">
                                        <input type="text" class="form-control datetimepicker-input" name="dateDebut" data-target="#datetimepicker7" value="<c:out value ="${s.dateDebut}"/>"    required>
                                        <div class="input-group-append" data-target="#datetimepicker7" data-toggle="datetimepicker">
                                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                        </div>

                                        <div class="invalid-feedback">Merci de choisir date de début valide</div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="form-group">
                                    <label for="validationDate">Date de fin</label>
                                   
                                    <div class="input-group date" id="datetimepicker8" data-target-input="nearest">
                                        <input type="text"   value="<c:out value ="${s.dateFin}"/>" class="form-control datetimepicker-input" name="dateFin" data-target="#datetimepicker8" required/>
                                        <div class="input-group-append" data-target="#datetimepicker8" data-toggle="datetimepicker">
                                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                        </div>
                                        <div class="invalid-feedback">Merci de choisir une date de fin valide</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="validationCus">Description courte du service</label>
                                <input type="text" class="form-control" id="validationCus"   placeholder="Description courte du service" value="<c:out value ="  ${s.courteDescription}"/>"name="courteDescription"  required />
                                <div class="invalid-feedback">
                                    Veuillez remplir le champs Description courte du service
                                </div>
                            </div>

                        </div>
                        <div class="form-row">
                            <div class="col-md-12 mb-6">
                                <label for="validationDescripton">Description Détaillée</label>

                                <textarea class="form-control" id="validationDescripton" placeholder="Description Détaillée" name="longueDescription" aria-describedby="inputGroupPrepend" required rows="5" ><c:out value ="  ${s.longueDescription}"/></textarea>

                                <div class="invalid-feedback">
                                    Merci remplir le champs "description détaillée"
                                </div>
                            </div>
                        </div><br>
                        <%
                            Service service = (Service) request.getAttribute("service");
                            String adresseComplete = service.getLocalisation();
                            String[] arrays = adresseComplete.split(",");
                        %>
                        <div class="form-row">
                            <div class="col-md-6 mb-3">
                                <label for="validationCustom03">Pays</label>
                                <input type="text" class="form-control" id="validationCustom03" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || event.charCode ==32 || event.charCode==45" value="<%=arrays[0]%>" placeholder="Pays" name="pays" required>
                                <div class="invalid-feedback">
                                    Merci de donner un nom de pays valide
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="validationCustom04">Ville</label>
                                <input type="text" class="form-control" id="validationCustom04" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || event.charCode ==32 || event.charCode==45" value="<%=arrays[1]%>" placeholder="Ville" name="ville" required>
                                <div class="invalid-feedback">
                                    Merci de donner un nom de ville valide
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="validationCustom05">Code Postale</label>
                                <input type="text" class="form-control" id="validationCustom05" placeholder="Code Postale" pattern="[0-9]{5}" value="<%=arrays[2]%>"  name="cp" required>
                                <div class="invalid-feedback">
                                    Merci de donner code Postale valide
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-primary" onclick="return confirm('Voulez vous vraiment modifier ce service ?')" type="submit">Submit form</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Footer -->


        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>


        <%@include file="footer.jsp" %>



    </body>
</html>