 
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})(); 

$("#mynature").hide(); 
$("#myannuler").hide();  
$("#longuDes").hide();  
$("#loc").hide();  


function myFunction() {
  var x = document.getElementById("mySelect").value; 
  if(x==="addNature"){

$("#mynature").show();  
$("#myannuler").show();  
document.getElementById("mySelect").disabled = true;
  } 
}  

function myFunctionHideinput(){

                  $("#mynature").hide(); 

document.getElementById("mySelect").disabled = false;
}

            
 $(function () {

        $('#datetimepicker7').datetimepicker({
          minDate: new Date(),
          format: 'L'
        });
        $('#dateNaissanceInscri').datetimepicker({
          maxDate: new Date(),
          format: 'L'
        });
        $('#datetimepicker8').datetimepicker({
            useCurrent: true,
            format: 'L'
        }); 
        $("#datetimepicker7").on("change.datetimepicker", function (e) {
            $('#datetimepicker8').datetimepicker('minDate', e.date);
        });  
        
    });
 

 