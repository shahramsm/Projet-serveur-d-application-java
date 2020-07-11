<%@page import="entity.Utilisateur"%>
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
                    Profile de  <%=u.getPrenom()%> <%=u.getNom()%>
                </div>
                <div class="card-body"> 
                    <form  action="UserEditAction" method="POST" class="needs-validation" novalidate>
                        <div class="form-row">

                            <input class="form-control" name="user_id" type="hidden" value="<%=u.getCodeUtilisateur()%>">
                            <div class="col-md-4 mb-3">
                                <label for="validationCustom01">Prénom</label>
                                <input type="text" class="form-control" id="validationCustom01" readonly="true" pattern="[A-Za-z]{1,}" placeholder="Prénom" name="prenom" value="<%=u.getPrenom()%>" required>
                                <div class="invalid-feedback">
                                    Veuillez remplir le champs Prénom 
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="validationCustom02">Nom</label>
                                <input type="text" class="form-control" id="validationCustom02" readonly="true" pattern="[A-Za-z]{1,}" placeholder="Nom" name="nom" value="<%=u.getNom()%>" required>
                                <div class="invalid-feedback">
                                    Veuillez remplir le champs nom
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="validationCustomUsername">Pseudonyme</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroupPrepend"><i class="fas fa-user"></i></span>
                                    </div>
                                    <input type="text" readonly="true"class="form-control" id="validationCustomUsername" value="<%=u.getLogin()%>"placeholder="Pseudonyme" name="pseudonyme" aria-describedby="inputGroupPrepend" required>
                                    <div class="invalid-feedback">
                                        Merci de choisir un Pseudonyme
                                    </div>
                                </div>
                            </div>
                        </div><div class="form-row">
                            <div class="col-md-4 mb-3">
                                <label for="validationCustom04">Date de naissance</label>
                                <input type="text" class="form-control" id="validationCustom04" readonly="true"  placeholder="Date de naissance" name="dn" value=" <fmt:formatDate type="date" value="<%=u.getDateNaissance()%>"  />" required>
                                <div class="invalid-feedback">
                                    Merci de donner une date de naissance valide
                                </div>
                            </div>

                            <div class="col-md-4 mb-3">
                                <label for="validationCustomUsername">Téléphone</label>

                                <input type="tel"  pattern="[0]{1}[1-9]{1}[0-9]{2}[0-9]{2}[0-9]{2}[0-9]{2}"  class="form-control" id="validationCustomUsername" placeholder="Téléphone" name="tel" value="<%=u.getTel()%>"aria-describedby="inputGroupPrepend" required>
                                <div class="invalid-feedback">
                                    Merci de saisir votre numéro de téléphone
                                </div>

                            </div>
                        </div>
                        <%
                            String adresseComplete = u.getAdresse();
                            String[] arrays = adresseComplete.split(",");
                        %>
                        <div class="form-row">
                            <div class="col-md-6 mb-3">
                                <label for="validationCustom03">Pays</label>
                                <input type="text" class="form-control" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || event.charCode ==32 || event.charCode==45" id="validationCustom03" pattern="[A-Za-z]{1,}" placeholder="Pays" name="pays" value="<%=arrays[0]%>" required >
                                <div class="invalid-feedback">
                                    Merci de donner un nom de pays valide
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="validationCustom011">Ville</label>
                                <input type="text" class="form-control"  onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || event.charCode ==32 || event.charCode==45"placeholder="Ville" name="ville" value="<%=arrays[1]%>" >
                                <div class="invalid-feedback">
                                    Merci de donner un nom de ville valide
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="validationCustom05">Code Postale</label>
                                <input type="text" class="form-control" pattern="[0-9]{5}"id="validationCustom05" placeholder="Code Postale" name="cp" value="<%=arrays[2]%>"required>
                                <div class="invalid-feedback">
                                    Merci de donner code Postale valide
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6 mb-4">
                                <label for="validationCustom06">E-mail</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroupPrepend">@</span>
                                    </div>
                                    <input type="email" class="form-control" value="<%=u.getEmail()%>"readonly="true" id="validationCustom06" placeholder="E-mail" name="email" aria-describedby="inputGroupPrepend" required>
                                    <div class="invalid-feedback">
                                        Merci de donner une adresse e-mail valide.
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-6 mb-4">
                                <label for="validationPassword">Mot de passe</label>

                                <input type="password" class="form-control" id="validationPassword" placeholder="Mot de passe" name="password" aria-describedby="inputGroupPrepend" >
                                <div class="invalid-feedback">
                                    Merci de choisir un mot de passe
                                </div>

                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-12 mb-6">
                                <label for="validationDescripton">Description personelle</label>

                                <textarea class="form-control" id="validationDescripton" placeholder="Description personelle" name="description" aria-describedby="inputGroupPrepend" required rows="5" ><%=u.getDescription()%></textarea>

                                <div class="invalid-feedback">
                                    Merci de choisir un mot de passe
                                </div>
                            </div>
                        </div><br>
                        <div class="form-group">
                                <button class="btn btn-primary" type="submit">Enregistrer</button>
                            <% if (!u.isEstAdmin()) {%>
                        <a class="btn btn-danger" href="UserDeleteAction?id=<%=u.getCodeUtilisateur()%>">Supprimer votre compte</a>
                     <% }%>
                        </div>
                    </form>


                </div>
            </div>
        </div>



        <%@include file="footer.jsp" %>

    </body>
</html>