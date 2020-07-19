(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        var ciInput = document.getElementById("ci");
        var existeInvalid = document.getElementById("ci-invalid-existe");

        if (form.checkValidity() === false || !ciInput.classList.contains("valid") || existeInvalid.classList.contains("d-block")) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();

$(function(){
    $('#ci').keyup(function() {
        $("#ci").validate_ci();
        //Reviso si esta en alta o modificar
        if($("#ci_original") !== undefined) {
            if($("#ci_original").val() !== $("#ci").val()) existeCI($("#ci").val());
        } else existeCI($("#ci").val());
    });
});

function existeCI(ci) {
    var invalidExiste = document.getElementById("ci-invalid-existe");
    $.ajax({
        type: "POST",
        contentType: "application/json",
        dataType: "json",
        url: "existeCI?ci="+ci,
        success: function(data) {
            //console.log("existe:"+data);
            if(data) {
                invalidExiste.classList.remove("d-none");
                invalidExiste.classList.add("d-block");
            } else {
                invalidExiste.classList.add("d-none");
                invalidExiste.classList.remove("d-block");
            }
            return data;
        },
        error: function(error) {
            console.log("Sucedio un error inesperado al validar la cedula");
            invalidExiste.classList.remove("d-none");
            invalidExiste.classList.add("d-block");
        }
    });
}

var cantContactos = 0;

function addContacto() {
    var li = document.createElement("LI");
    li.setAttribute("id", "contacto"+cantContactos);
    var liHTML =
      '<div class="input-group">' +
      '<input type="text" name="contactos['+cantContactos+'].nombre" class="form-control" placeholder="Nombre" required>'+
      '<input type="text" name="contactos['+cantContactos+'].infocontacto" class="form-control" placeholder="Numero o mail" required>'+
      '<label class="form-control">'+
      '<input type="checkbox" name="contactos['+cantContactos+'].esPaciente" class="mx-1">Personal</label>'+
      '<div class="input-group-btn">'+
      '<button type="button" onclick="removeContacto('+cantContactos+')" class="btn btn-danger">X</button></div></div>';
    li.innerHTML = liHTML;
    document.getElementById("listaContactos").appendChild(li);
    cantContactos++;
}

function removeContacto(id) {
    var element = document.getElementById("contacto"+id);
    element.parentNode.removeChild(element);
}

function loadContactos(id) {
    $.ajax({
        type: "POST",
        contentType: "application/json",
        dataType: "json",
        url: "getContactosPaciente?id="+id,
        success: function(data) {
            //console.log(data);
            data.forEach((contacto) => {
                addContacto();
                document.getElementsByName("contactos["+(cantContactos-1)+"].nombre")[0].value = contacto.Nombre;
                document.getElementsByName("contactos["+(cantContactos-1)+"].infocontacto")[0].value = contacto.Info_contacto;
                document.getElementsByName("contactos["+(cantContactos-1)+"].esPaciente")[0].checked = contacto.esPaciente;
            });
        },
        error: function(error) {
            console.log("Sucedio un error inesperado al cargar los contactos");
        }
    });
}