/* 
 * Javascript
 * de Modals
 */
$(document).ready(function(){
    $('a[data-confirm]').click(function(ev) {
        var href = $(this).attr('href');
        $('#dataConfirmModal').find('.modal-body').text($(this).attr('data-confirm'));
        $('#dataConfirmOK').attr('href', href);
        $('#dataConfirmModal').modal({show:true});
        return false;
    });

    $('#pacienteModal').on('click', '.btn', function(ev) {
        var newmodal = $(this).data('target');
        $('#pacienteModal').on('hidden.bs.modal', function(event) {
            $(newmodal).modal('show');
            $('#pacienteModal').off('hidden.bs.modal');
        }).modal('hide');
    });

    $('#historialMedicoModal').on('shown.bs.modal', function(ev) {
        var id = document.getElementById('form_idPaciente').value;
        $.ajax({
            type: "POST",
            contentType: "application/json",
            dataType: "json",
            url: "getHistorialMedico?id="+id,
            success: function(data) {
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    dataType: "json",
                    url: "getRegistrosGrafica?id="+id,
                    success: function(data) {
                        var datos1 = [];
                        var datos2 = [];

                        data.forEach(dato => {
                            datos1.push({x: new Date(dato.timestampData), y: parseFloat(dato.presionSalida)});
                            datos2.push({x: new Date(dato.timestampData), y: parseFloat(dato.pulsaciones)});
                        });

                        var chart1 = new CanvasJS.Chart("historial-RespiracionChart", {
                            title :{text: "Respiracion"},
                            axisY: {includeZero: false},      
                            data: [{ type: "line", dataPoints: datos1}]
                        });
                        var chart2 = new CanvasJS.Chart("historial-PulsacionesChart", {
                            title :{text: "Pulsaciones"},
                            axisY: {includeZero: false},      
                            data: [{ type: "line", dataPoints: datos2, color: "green"}]
                        });
                        chart1.render();
                        chart2.render();
                    }
                });
                console.log("Accion realizada con exito");
                var html = "";
                data.forEach(item => {
                    html += "<h6><strong>"+new Date(item.fechaHora).toLocaleString()+":</strong>&nbsp;"+item.descripcion+"<br/>";
                    if(item.medicacion !== "" && item.medicacion !== null) 
                        html+= "<strong>Medicación:</strong>&nbsp;"+item.medicacion+"<br/>";
                    html+= "<strong>Nivel de riesgo:</strong>&nbsp;"+item.nivelRiesgo+"<br/>";
                    if(item.idVemec !== "" && item.idVemec !== null) {
                        html+= "<strong>Conectado a Unidad:</strong>&nbsp; VeMec"+item.idVemec.id+"<br/>";
                        html+= "<strong>Localizada en:</strong>&nbsp;"+item.idVemec.ubicacion+"<br/>";
                    }
                    html+= "<strong>Médico tratante:</strong>&nbsp;"+item.medicoTratante+"<br/><hr/>";
                });
                document.getElementById("historialMedicoModalDatos").innerHTML = html;
            },
            error: function(data) {console.log(data);}
        });
    });
});

function altaAccionMedica() {
    var json = {};
    json["idPaciente"] = document.getElementById("form_idPaciente").value;
    json["nivelRiesgo"] = document.getElementById("form_nivel_riesgo").value;
    json["medicacion"] = document.getElementById("form_medicacion").value;
    json["descripcion"] = document.getElementById("form_descripcion").value;
    //json["id_slave"] = document.getElementById("select_slave").value;
    json["idVemec"] = document.getElementById("id_vemec").value;
    json["medicoTratante"] = document.getElementById("form_medico_tratante").value;
    json["alta"] = document.getElementById("form_alta").value === "true";
    json["defuncion"] = document.getElementById("form_defuncion").value  === "true";

    console.log(json);
    $.ajax({
        type: "POST",
        contentType: "application/json",
        dataType: "json",
        data: JSON.stringify(json),
        url: "altaAccionMedica",
        success: function(data) {console.log("Accion realizada con exito");},
        error: function(data) {console.log(data);}
    });
}

function datosPaciente(id) {
    console.log("recibiendo datos de paciente...");
    $.ajax({
        type : "POST",
        contentType : "application/json",
        dataType: "json",
        url : "getPaciente?id="+id,
        success  : function(data) {
            var json = data;
            console.log("cargando datos de paciente...");
            document.getElementById('modal_ci').innerHTML = json.ci;
            document.getElementById('modal_nombre').innerHTML = json.nombre;
            document.getElementById('modal_sexo').innerHTML = json.sexo;
            document.getElementById('modal_edad').innerHTML = json.edad;
            document.getElementById('modal_nacionalidad').innerHTML = json.nacionalidad;
            document.getElementById('modal_residencia').innerHTML = json.lugarResidencia;
            document.getElementById('modal_direccion').innerHTML = json.direccion;
            document.getElementById('modal_xyz').innerHTML = json.coordenadas;
            document.getElementById('modal_antecedentes').innerHTML = json.antecedentesClinicos;
            document.getElementById('modal_riesgo').innerHTML = json.nivelRiesgo;
            document.getElementById('modal_modificarPac').href = "modificarPaciente?id="+id;

            //Contenido pdf
            document.getElementById('pdf_ci').innerHTML = json.ci;
            document.getElementById('pdf_nombre').innerHTML = json.nombre;
            document.getElementById('pdf_sexo').innerHTML = json.sexo;
            document.getElementById('pdf_edad').innerHTML = json.edad;
            document.getElementById('pdf_nacionalidad').innerHTML = json.nacionalidad;
            document.getElementById('pdf_residencia').innerHTML = json.lugarResidencia;
            document.getElementById('pdf_direccion').innerHTML = json.direccion;
            document.getElementById('pdf_coordenadas').innerHTML = json.coordenadas;
            document.getElementById('pdf_antecedentes').innerHTML = json.antecedentesClinicos;
            document.getElementById('pdf_riesgo').innerHTML = json.nivelRiesgo;

            //Asigno para form de accion medica
            document.getElementById('form_idPaciente').value = id;
            document.getElementById('form_nivel_riesgo').value = json.nivelRiesgo;
            //
            if(json.contactoCollection !== null) {
                var html = "";
                json.contactoCollection.forEach(item => {
                    html += item.Nombre+" - "+item.Info_contacto;
                    if(item.esPaciente) html += " (Paciente)";
                    html+="\n";
                });
                document.getElementById('modal_contactos').innerHTML = html;
            }
        }, error: function(err){console.log(err);}
    });
}

function historialMedicoPDF() {
    const historial = document.getElementById("historialMedicoModalBody");
    var clonHistorial = historial.cloneNode(true);
    var nombrePaciente = document.getElementById("pdf_nombre").innerHTML;
    
    //Muestro datos ocultos
    //Copio canvas, sino no se muestran
    clonHistorial.getElementsByTagName('div')[0].style.display = "block";
    clonHistorial.getElementsByClassName('canvasjs-chart-container')[0]
            .getElementsByTagName('canvas')[0].getContext('2d')
            .drawImage(historial.getElementsByClassName('canvasjs-chart-container')[0].getElementsByTagName('canvas')[0],0,0);
    clonHistorial.getElementsByClassName('canvasjs-chart-container')[1]
            .getElementsByTagName('canvas')[0].getContext('2d')
            .drawImage(historial.getElementsByClassName('canvasjs-chart-container')[1].getElementsByTagName('canvas')[0],0,0);
    //
    
    html2pdf()
    .set({ html2canvas: { scale: 6 } })
    .from(clonHistorial)
    .save("historial-medico-"+nombrePaciente+".pdf");

    clonHistorial.remove();
}