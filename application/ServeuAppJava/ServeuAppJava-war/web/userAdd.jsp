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
                    Inscription
                </div>
                <div class="card-body"> 

                    <div class="row">
                        <div class="col-md-6 col-md-offset-3" style="z-index: 1; right: 0; top:-20; position: fixed">
                            <div class="alert " style="background-color: white;" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <strong> <img src="img/ajouter.png " height="48" width="37"/>Votre inscription est bien enregistrée !</strong>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3" style="z-index: 1; right: 0; top:-20; position: fixed">
                            <div class="testlogin " style="background-color: white;" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <strong> <img src="img/error.png " height="48" width="37"/>Adresse e-mail correspond à un compte existant !</strong>
                            </div>
                        </div>
                    </div>
                    <form action="UserAddAction" method="POST" class="needs-validation" novalidate>
                        <div class="form-row">
                            <div class="col-md-4 mb-3">
                                <label for="validationCustom01">Prénom</label>
                                <input type="text" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || event.charCode ==32 || event.charCode==45"class="form-control" id="validationCustom01"   placeholder="Prénom" name="prenom" value="" required>
                                <div class="invalid-feedback">
                                    Veuillez remplir le champs Prénom 
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="validationCustom02">Nom</label>
                                <input type="text" class="form-control" id="validationCustom02"onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || event.charCode ==32 || event.charCode==45" placeholder="Nom" name="nom" value="" required>
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
                                    <input type="text" class="form-control" id="validationCustomUsername" placeholder="Pseudonyme" name="pseudonyme" aria-describedby="inputGroupPrepend" required>
                                    <div class="invalid-feedback">
                                        Merci de choisir un Pseudonyme
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            
                           <div class="col-md-4 mb-3">
                                <div class="form-group">
                                    <label for="dateNaissanceInscri">Date de naissance</label>
                                    <div class="input-group date" id="dateNaissanceInscri" data-target-input="nearest">
                                        <input type="text" class="form-control datetimepicker-input" name="dn" data-target="#dateNaissanceInscri" required>
                                        <div class="input-group-append" data-target="#dateNaissanceInscri" data-toggle="datetimepicker">
                                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                        </div>

                                        <div class="invalid-feedback">Merci de choisir date de naissance valide</div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label>Sexe</label>
                                <div class="input-group">
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="customControlValidation2" name="sexe" value="Feminin" required>
                                        <label class="custom-control-label" for="customControlValidation2"  >Feminin</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input type="radio" class="custom-control-input" id="customControlValidation3" name="sexe"value="Masculin" required>
                                        <label class="custom-control-label" for="customControlValidation3" >Masculin</label>
                                        <div class="invalid-feedback">Veuillez choisir une des deux valeurs</div>
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="validationCustomUsername">Téléphone</label>

                                <input type="tel"  pattern="[0]{1}[1-9]{1}[0-9]{2}[0-9]{2}[0-9]{2}[0-9]{2}"  class="form-control" id="validationCustomUsername" placeholder="Téléphone" name="tel" aria-describedby="inputGroupPrepend" required>
                                <div class="invalid-feedback">
                                    Merci de saisir votre numéro de téléphone
                                </div>

                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6 mb-3">
                                <label for="validationCustom03">Pays</label>
                                <input type="text" class="form-control" id="validationCustom03" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || event.charCode ==32 || event.charCode==45" placeholder="Pays" name="pays" required>
                                <div class="invalid-feedback">
                                    Merci de donner un nom de pays valide
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="validationCustom04">Ville</label>
                                <input type="text" class="form-control" id="validationCustom04" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123) || event.charCode ==32 || event.charCode==45" placeholder="Ville" name="ville" required>
                                <div class="invalid-feedback">
                                    Merci de donner un nom de ville valide
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="validationCustom05">Code Postale</label>
                                <input type="text" class="form-control" id="validationCustom05"  pattern="[0-9]{5}" placeholder="Code Postale" name="cp" required>
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
                                    <input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" class="form-control" id="validationCustom06" placeholder="E-mail" name="email" aria-describedby="inputGroupPrepend" required>
                                    <div class="invalid-feedback">
                                        Merci de donner une adresse e-mail valide.
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-6 mb-4">
                                <label for="validationPassword">Mot de passe</label>

                                <input type="password" class="form-control" id="validationPassword" placeholder="Mot de passe" name="password" aria-describedby="inputGroupPrepend" required>
                                <div class="invalid-feedback">
                                    Merci de choisir un mot de passe
                                </div>

                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-12 mb-6">
                                <label for="validationDescripton">Description personelle</label>

                                <textarea class="form-control" id="validationDescripton" placeholder="Description personelle" name="description" aria-describedby="inputGroupPrepend" required rows="5" ></textarea>

                                <div class="invalid-feedback">
                                    Merci de saisir une description personelle.
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                                <label class="form-check-label" for="invalidCheck">
                                    Accepter les termes et conditions
                                </label>
                                <div class="invalid-feedback">
                                    Vous devez accepter avant de soumettre.
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-primary" type="submit">S'inscrire</button>
                    </form>


                </div>
            </div>
        </div>

        <% if (u != null) {%>
        <%@include file="footer.jsp" %>
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



        <% boolean testlogin = (Boolean) request.getAttribute("loginvalidation");
            boolean test = (Boolean) request.getAttribute("rep");
            if (test == true) {
        %>
        <script type="text/javascript">
                                    $(".testlogin").hide();
                                    window.setTimeout(function () {
                                        $(".alert").fadeTo(500, 0).slideUp(500, function () {
                                            $(this).remove();
                                        });
                                    }, 1000);
        </script>

        <% } else {

        %>
        <script type="text/javascript">

            $(".alert").hide();
        </script>
        <% }

        %>
        <%    if (testlogin == true) {
                System.out.println(test);


        %>
        <script type="text/javascript">

            window.setTimeout(function () {
                $(".alert").hide();
                $(".testlogin").fadeTo(500, 0).slideUp(500, function () {
                    $(this).remove();
                });
            }, 1000);
        </script>

        <% } else {

        %>
        <script type="text/javascript">

            $(".testlogin").hide();
        </script>
        <% }

        %>

    </body>


</html>