<!DOCTYPE html>
<%@include file="header.jsp" %>
<html>
    <head>
        <title>Votre message</title>

    </head>
    <body>  
        <div class="container">
            <div class="card" style="margin-top: 80px; margin-bottom: 20px;">
                <div class="card-header">
                    Ajouter une offre de service
                </div>
                <div class="card-body"> 
                     <div class="row">
                        <div class="col-md-6 col-md-offset-3" style="z-index: 1; right: 0; top:-20; position: fixed">
                            <div class="alert " style="background-color: white;" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <strong> <img src="img/ajouter.png " height="48" width="37"/>Votre message est bien enregistrée !</strong>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3" style="z-index: 1; right: 0; top:-20; position: fixed">
                            <div class="testlogin " style="background-color: white;" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <strong> <img src="img/error.png " height="48" width="37"/>Un autre utilisateur avait déja proposer ce service   !</strong>
                            </div>
                        </div>
                    </div>
                    <form action="ServicePropositionAction" method="POST" class="needs-validation" novalidate>
                        <input type="hidden" name="user_id" value="<%=u.getCodeUtilisateur()%>" />
                     
                        <div class="form-row">
                            <div class="col-md-12 mb-6">
                                <label for="validationDescripton">Message personnel</label>

                                <textarea class="form-control" id="validationDescripton" placeholder="Message personnel" name="message" aria-describedby="inputGroupPrepend" required rows="5" ></textarea>

                                <div class="invalid-feedback">
                                    Merci remplir le champs "Message personnel"
                                </div>
                            </div>
                        </div><br>
                        
                        <button class="btn btn-primary" type="submit">Envoyer</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <script type="text/javascript">
            var text = document.getElementById('offrirUnService').textContent;
            document.getElementById('offrirUnServiceHidden').value = text;
            </script>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>


        <%@include file="footer.jsp" %>

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