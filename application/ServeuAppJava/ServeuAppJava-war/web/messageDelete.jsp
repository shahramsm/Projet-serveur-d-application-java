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
                      
                    <form action="ServiceDeletebyAdmin" method="POST" class="needs-validation" novalidate>
                        <input type="hidden" name="user_id" value="<%=u.getCodeUtilisateur()%>" />
                     
                        <div class="form-row">
                            <div class="col-md-12 mb-6">
                                <label for="validationDescripton">Message personnel</label>

                                <textarea class="form-control" id="validationDescripton" placeholder="Justification de la supppression " name="message" aria-describedby="inputGroupPrepend" required rows="5" ></textarea>

                                <div class="invalid-feedback">
                                    Merci remplir le champs "Justification de la supppression l"
                                </div>
                            </div>
                        </div><br>
                        
                        <button class="btn btn-primary" type="submit">Submit form</button>
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