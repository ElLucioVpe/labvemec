function eliminarSeccion(id) {
    $.ajax({
        type: "POST",
        contentType: "application/json",
        dataType: "json",
        url: "seccionVacia?id="+id,
        success: function(data) {
            if(data) {
                $('#dataConfirmOK').attr('href', "bajaSeccion?id="+id);
                $('#dataConfirmOK').attr('onclick', 'alert("La seccion fue eliminada con exito")');
            } else  $('#dataConfirmOK').attr('onclick', 'alert("La seccion no puede ser eliminada, remueva los vemecs primero")');
        },
        error: function(error) {
            console.log("Sucedio un error inesperado al eliminar la seccion");
        }
    });
}

