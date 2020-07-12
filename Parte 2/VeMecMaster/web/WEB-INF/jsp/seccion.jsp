<%-- 
    Document   : seccion.jsp
    Created on : 07-jul-2020, 0:04:31
    Author     : Esteban
--%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>VeMecMaster - Seccion</title>

  <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.js"></script>
  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
  
</head>

<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<c:set var="baseUrl" value="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/" />

<script type="text/javascript">
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
        
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
                                datos1.push({x: new Date(dato.timestampData).toLocaleString(), y: dato.presionSalida});
                                datos2.push({x: new Date(dato.timestampData).toLocaleString(), y: dato.pulsaciones});
                            });
                            
                            var chart1 = new CanvasJS.Chart("historial-RespiracionChart", {
                                title :{text: "Respiracion"},
                                axisY: {includeZero: false},      
                                data: [{ type: "line", dataPoints: datos1}]
                            });
                            var chart2 = new CanvasJS.Chart("historial-PulsacionesChart", {
                                title :{text: "Pulsaciones"},
                                axisY: {includeZero: false},      
                                data: [{ type: "line", dataPoints: datos2, lineColor: "green"}]
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
        
        <c:forEach var="dato" items="${datos_vemecs}">
            var array = [];
            <c:forEach var="reg" items="${dato.getRegistros()}">
                array.push({
                    presionEntrada: "${reg.presionEntrada}", 
                    presionSalida: "${reg.presionSalida}", 
                    timestampData: "${reg.timestampData}"
                });
            </c:forEach>
            cargarDatosGraficas(${dato.getVemec().getId()}, array);
        </c:forEach>
    });
    
    //Escucha para actualizar datos y alertas
    const socket = io('http://localhost:4000');
    socket.on('datos_masterSlave'+${slave.id}, (res) => {
        actualizarDatos(res);
    });

    function altaAccionMedica() {
        //var json = JSON.stringify($("accionMedicaForm").serializeArray());
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
                document.getElementById('modal_pac_historial').href = "accionesMedicas?id="+json.id;
                
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

    function actualizarDatos(json) {
        console.log("recibiendo datos de vemec...");

        document.getElementById('Pmax'+json.Id_Vemec).innerHTML = json.Presion_Maxima;
        document.getElementById('Pmin'+json.Id_Vemec).innerHTML = json.Presion_Minima;
        document.getElementById('Gas'+json.Id_Vemec).innerHTML = json.Gas;
        document.getElementById('Fr'+json.Id_Vemec).innerHTML = json.Frecuencia;
        document.getElementById('O2'+json.Id_Vemec).innerHTML = json.Mezcla+"%";
        document.getElementById('Hum'+json.Id_Vemec).innerHTML = json.Humedad+"%";
        document.getElementById('TE'+json.Id_Vemec).innerHTML = json.Temperatura_Entrada;
        document.getElementById('TS'+json.Id_Vemec).innerHTML = json.Temperatura_Salida;
        document.getElementById('PE'+json.Id_Vemec).innerHTML = json.Presion_Entrada;
        document.getElementById('PS'+json.Id_Vemec).innerHTML = json.Presion_Salida;
        document.getElementById('Pulso'+json.Id_Vemec).innerHTML = json.Pulsaciones;
        
        if(json.Conectado_Corriente === "true")
            document.getElementById('p_out').innerHTML = 'Conectado a corriente <i class="fas fa-plug" aria-hidden="true"></i>';
        else document.getElementById('p_out').innerHTML = json.Energia+'%<i class="fa fa-bolt" aria-hidden="true"></i>';

        console.log("agregando datos a la grafica...");
        var chartPE = $("#div-PEchart"+json.Id_Vemec).CanvasJS();
        var chartPS = $("#div-PSchart"+json.Id_Vemec).CanvasJS();
        
        chartPE.options.dataPoints.push({
            x: new Date(json.Timestamp_Data),
            y: json.Presion_Entrada
        });
        chartPS.options.dataPoints.push({
            x: new Date(json.Timestamp_Data),
            y: json.Presion_Salida
        });
        if(chartPE.options.dataPoints.length > 20) chartPE.options.dataPoints.shift();
        if(chartPS.options.dataPoints.length > 20) chartPS.options.dataPoints.shift();
        
        if(json.alerta === "activarAlerta") modoAlerta(true, "alerta", json.Id_Vemec);
        if(json.alerta === "activarBajaBateria") modoAlerta(true, "energia", json.Id_Vemec);
        if(json.alerta === "desactivarAlerta") modoAlerta(false, "alerta", json.Id_Vemec);
        if(json.alerta === "desactivarBajaBateria") modoAlerta(false, "energia", json.Id_Vemec);
    }

    function cargarDatosGraficas(idVeMec, registros) {
        var datosPE = [];
        var datosPS = [];
        var chartPE = new CanvasJS.Chart("div-PEchart"+idVeMec, {
            title :{text: "Presión de entrada"},
            axisY: {includeZero: false},      
            data: [{ type: "line", dataPoints: datosPE}]
        });
        var chartPS = new CanvasJS.Chart("div-PSchart"+idVeMec, {
            title :{text: "Presión de salida"},
            axisY: {includeZero: false},      
            data: [{ type: "line", dataPoints: datosPS, lineColor: "red"}]
        });

        if(registros !== undefined || registros.length === 0) {
            registros.forEach(item => {
               datosPE.push({
                   x: new Date(item.timestampData),
                   y: item.presionEntrada
               });
               datosPS.push({
                   x: new Date(item.timestampData),
                   y: item.presionSalida
               });
            });
        }

        //Evita se sature la grafica, solo 20 puntos visibles
        if (datosPE.length > 20) datosPE.shift();
        if (datosPS.length > 20) datosPS.shift();
        chartPE.render();
        chartPS.render();
    }

    function modoAlerta(activar, tipo, idVeMec) {
        var element = document.getElementById("vemec-card"+idVeMec);
        var audioPlayer = document.getElementById("audio-alerta");
        var clase ="";
        var audio = "${baseUrl}sound/";
        var count_div = "";

        if(tipo === "alerta") {
            clase = "alert-mode";
            audio += "alert1.mp3";
            count_div = "alert-count";
        }
        if(tipo === "energia") {
            clase = "lowEnergy-mode";
            audio += "alert2.mp3";
            count_div = "energy-alert-count";
        }

        if(activar) {
            element.classList.add(clase);
            audioPlayer.setAttribute('src', audio);
            document.getElementById(count).innerHTML = parseInt(document.getElementById(count).innerHTML)+1;
        } else {
            element.classList.remove(clase);
            audioPlayer.setAttribute('src', "");
            document.getElementById(count_div).innerHTML = parseInt(document.getElementById(count_div).innerHTML)-1;
        }
    }
    
    //Para seleccionar seccion y vemecs en caso de querer cambiarlos
    var arrayVeMecs = [];
    var arraySlaves = [];
    <c:forEach var="item" items="${slaves}">
        arraySlaves.push({
            id: "${item.id}", 
            Nombre: "${item.Nombre}"
        });
    </c:forEach>
    <c:forEach var="item" items="${vemecs_libres}">
        arrayVeMecs.push({
            id: "${item.id}", 
            Modelo: "${item.Modelo}",
            Marca: "${item.Marca}",
            Ubicacion: "${item.Ubicacion}",
            id_slave: "${item.id_slave}"
        });
    </c:forEach>

    function showDiv(hiddenItem, element)
    {
        if(element.value !== null && element.value !== "null") {
            let html = "";
            if(hiddenItem === "id_vemec") {
                html = '<option selected value="null">Seleccione un VeMec</option>';
                arrayVeMecs.forEach(vemec => {
                    if(vemec.id_slave === element.value) {
                        html+='<option value="'+vemec.id+'">'+vemec.Modelo+' - '+vemec.Ubicacion+'</option>';
                    }
                });
            }
            if(hiddenItem === "select_slave") {
                html = '<option selected value="null">Seleccione una seccion</option>';
                arraySlaves.forEach(slave => {
                    html+='<option value="'+slave.id+'">'+slave.Nombre+'</option>';
                });
            }
            document.getElementById(hiddenItem).innerHTML = html;
        }

        document.getElementById(hiddenItem).style.display = element.value === "null" ? 'none' : 'block';
    }
</script>

<style>
    #select_slave, #id_vemec {
        display: none;
    }
    
    #historialMedicoModal .modal-body {
        height: 450px;
        overflow-y: auto;
    }
    
    .vemec-col {
        width: 33%;
    }
    
    .vemec-card {
        font-size: 15px;
        width: 100%;
        height: 330px;
    }
    
    .vemec-chart {
        width: 100%;
        height: 50%;
    }
    
    .historial-chart {
        width: 100%;
        height: 100px;
    }

    .alert-mode {
        background: red;
    }
    
    .lowEnergy-mode {
        background: yellow;
    }
    
    @media screen and (max-width: 1000px) { 
        .vemec-col {
            width: 100%;
        }
        .vemec-col {
            height: 50%;
        }
    }
</style>

<body id="page-top">
  <audio id="audio-alerta" src="" autoplay>
  </audio>
  
  <div id="wrapper">
    <div id="content-wrapper" class="d-flex flex-column">
      <jsp:include page="../components/header.jsp"></jsp:include>
      <div id="content">
        <div class="container-fluid">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">${slave.Nombre}</h1>
            <a href="modificarSeccion?id=${slave.id}" class="d-none d-sm-inline-block btn btn btn-primary shadow">Modificar seccion</a>
          </div>
          <div class="row">

            <!-- VeMecs -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">VeMecs</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">${datos_vemecs.size()}</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-user fa-2x text-primary"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Alertas -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">Alertas</div>
                      <div id="alert-count" class="h5 mb-0 font-weight-bold text-gray-800">0</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-exclamation-triangle fa-2x text-danger"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Alertas de energia -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Alertas (Energia)</div>
                      <div id="energy-alert-count" class="h5 mb-0 font-weight-bold text-gray-800">0</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-battery-quarter fa-2x text-warning"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Content Row -->

          <div class="row">
            <!-- Informacion VeMecs -->
            <c:forEach var="dato" items="${datos_vemecs}">
            <div class="col-xl-4 vemec-col">
              <div id="vemec-card${dato.getVemec().getId()}" class="card shadow mb-4 vemec-card">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row justify-content-between">
                    <h6 class="m-0 font-weight-bold text-dark pull-left">
                        <c:choose>
                        <c:when test="${dato.getVemec().getIdPaciente() == null}">
                            No hay paciente asociado actualmente
                        </c:when>
                        <c:otherwise>
                            ${dato.getVemec().getIdPaciente().getNombre()}
                        </c:otherwise>
                        </c:choose>
                    </h6>
                    <h6 class="m-0 font-weight-bold text-dark pull-right">
                        <c:if test="${dato.getUltimoDato() != null && dato.getVemec().getIdPaciente() != null}">
                            <c:choose>
                            <c:when test="${dato.getUltimoDato().getConectadoCorriente()}">
                                Conectado a corriente <i class="fas fa-plug" aria-hidden="true"></i>
                            </c:when>
                            <c:otherwise>
                                ${dato.getUltimoDato().getEnergia()}%<i class="fa fa-bolt" aria-hidden="true"></i>
                            </c:otherwise>
                            </c:choose>
                        </c:if>
                    </h6>
                    <div class="dropdown no-arrow">
                      <a class="dropdown-toggle text-dark" href="#" role="button" id="dropdownVeMec${dato.getVemec().getId()}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                      </a>
                      <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownVeMec${dato.getVemec().getId()}">
                        <div class="dropdown-header">Acciones:</div>
                        <c:choose>
                            <c:when test="${dato.getVemec().getIdPaciente() != null}">
                                <a class="dropdown-item" data-toggle="modal" data-target="#pacienteModal" onclick="datosPaciente(${dato.getVemec().getIdPaciente().getId()})">
                                    Ver Datos Paciente
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a class="dropdown-item">
                                    No hay acciones
                                </a>
                            </c:otherwise>
                        </c:choose>
                        
                      </div>
                    </div>
                </div>
                <!-- Card Body -->
                <div class="card-body row">
                    <c:choose>
                    <c:when test="${dato.getUltimoDato() == null || dato.getVemec().getIdPaciente() == null}">
                        <h1 >VeMec Desconectado</h1>
                    </c:when>
                    <c:otherwise>
                    <div class="col">
                      <div id="div-PEchart${dato.getVemec().getId()}" class="vemec-chart">
                      </div>
                      <div id="div-PSchart${dato.getVemec().getId()}" class="vemec-chart">
                      </div>
                    </div>
                    <div id="datos-vemec" class="col">
                        <div class="row">
                            <div class="form-inline mx-1" data-toggle="tooltip" title="Presión Maxima (mmHg)">
                              <small class="font-weight-bold">Pmax</small>
                              <h4 class="font-weight-bold">
                                  <strong id="Pmax${dato.getVemec().getId()}">${dato.getUltimoDato().getPresionMaxima()}</strong>
                              </h4>
                            </div>
                            <div class="form-inline mx-1" data-toggle="tooltip" title="Presión Mínima (mmHg)">
                              <small class="font-weight-bold">Pmin</small>
                              <h4 class="font-weight-bold">
                                  <strong id="Pmin${dato.getVemec().getId()}">${dato.getUltimoDato().getPresionMinima()}</strong>
                              </h4>
                            </div>
                            <div class="form-inline mx-1" data-toggle="tooltip" title="Gas (cc)">
                              <small class="font-weight-bold">Gas</small>
                              <h4 class="font-weight-bold">
                                  <strong id="Gas${dato.getVemec().getId()}">${dato.getUltimoDato().getGas()}</strong>
                              </h4>
                            </div>
                            <div class="form-inline mx-1" data-toggle="tooltip" title="Frecuencia de aporte (/min)">
                              <small class="font-weight-bold">Fr</small>
                              <h4 class="font-weight-bold">
                                  <strong id="Fr${dato.getVemec().getId()}">${dato.getUltimoDato().getFrecuencia()}</strong>
                              </h4>
                            </div>
                            <div class="form-inline mx-1" data-toggle="tooltip" title="Composición de mezcla en porcentaje de O2">
                              <small class="font-weight-bold">O2</small>
                              <h4 class="font-weight-bold">
                                  <strong id="O2${dato.getVemec().getId()}">${dato.getUltimoDato().getMezcla()}%</strong>
                              </h4>
                            </div>
                            <div class="form-inline mx-1" data-toggle="tooltip" title="Humedad del aire">
                              <small class="font-weight-bold">Hum</small>
                              <h4 class="font-weight-bold">
                                  <strong id="Hum${dato.getVemec().getId()}">${dato.getUltimoDato().getHumedad()}%</strong>
                              </h4>
                            </div>
                            <div class="form-inline mx-1" data-toggle="tooltip" title="Temperatura de entrada (ºC)">
                              <small class="font-weight-bold">TE</small>
                              <h4 class="font-weight-bold">
                                  <strong id="TE${dato.getVemec().getId()}">${dato.getUltimoDato().getTemperaturaEntrada()}</strong>
                              </h4>
                            </div>
                            <div class="form-inline mx-1" data-toggle="tooltip" title="Temperatura de salida (ºC)">
                              <small class="font-weight-bold">TS</small>
                              <h4 class="font-weight-bold">
                                  <strong id="TS${dato.getVemec().getId()}">${dato.getUltimoDato().getTemperaturaSalida()}</strong>
                              </h4>
                            </div>
                            <div class="form-inline mx-1" data-toggle="tooltip" title="Presion de entrada (mmHg)">
                              <small class="font-weight-bold">PE</small>
                              <h4 class="font-weight-bold">
                                  <strong id="PE${dato.getVemec().getId()}">${dato.getUltimoDato().getPresionEntrada()}</strong>
                              </h4>
                            </div>
                            <div class="form-inline mx-1" data-toggle="tooltip" title="Presion de salida (mmHg)">
                              <small class="font-weight-bold">PS</small>
                              <h4 class="font-weight-bold">
                                  <strong id="PS${dato.getVemec().getId()}">${dato.getUltimoDato().getPresionSalida()}</strong>
                              </h4>
                            </div>
                            <div class="form-inline mx-1 pull-left" data-toggle="tooltip" title="Pulsaciones">
                              <h2 class="font-weight-bold">
                                  <strong id="Pulso${dato.getVemec().getId()}">${dato.getUltimoDato().getPulsaciones()}</strong>
                              </h2>
                              <h1>
                                  <i class="fa fa-heartbeat" aria-hidden="true" style="color: salmon"></i>
                              </h1>
                            </div>
                        </div>
                    </div>
                    </c:otherwise>
                    </c:choose>
                </div>
              </div>
            </div>
            </c:forEach>
          </div>
        </div>
        <!-- /.container-fluid -->

      </div>
      <jsp:include page="../components/footer.jsp"></jsp:include>

    </div>

  </div>

  <!-- Modal Accion Medica -->
  <div class="modal fade" id="accionMedicaModal" tabindex="-1" role="dialog" aria-labelledby="accionMedicaModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="accionMedicaModalLabel">Accion Medica</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Cerrar">
            <span aria-hidden="true">×</span>
          </button>
        </div>
          <div id="modal_AM_body" class="modal-body">
              <form id="accionMedicaForm" method="post">
                <input id="form_idPaciente" name="id_paciente" type="hidden" value=""/>
                <label for="nivel_riesgo">Nivel de Riesgo:</label>
                <select name="nivel_riesgo" id="form_nivel_riesgo" class="form-control">
                    <option value="Bajo">Bajo</option>
                    <option value="Medio">Medio</option>
                    <option value="Alto">Alto</option>
                    <option value="Grave">Grave</option>
                    <option value="Muy Grave">Muy Grave</option>
                </select>
                <label for="medicacion">Recetar Medicacion:</label>
                <textarea type="text" id="form_medicacion" name="medicacion" class="form-control"></textarea>
                <label for="descripcion">Descripcion:</label>
                <textarea type="text" id="form_descripcion" name="descripcion" class="form-control"></textarea>
                <label for="selectVemec">Cambiar Seccion o VeMec?:</label>
                <select name="selectVemec" id="selectVemec" class="form-control mb-1" onchange="showDiv('select_slave', this)">
                    <option selected value="null">No</option>
                    <option value="1">Si</option>
                </select>
                <!-- Oculto -->
                <select name="select_slave" id="select_slave" class="form-control mb-1" onchange="showDiv('id_vemec', this)">
                    <option selected value="null">Seleccione una seccion</option>
                    <c:forEach var="slave" items="${slaves}">
                        <option value="${slave.id}">${slave.Nombre}</option>
                    </c:forEach>
                </select>
                <select name="id_vemec" id="id_vemec" class="form-control mb-1">
                    <option selected value="null">Seleccione un VeMec</option>
                    <c:forEach var="vemec" items="${vemecs_libres}">
                        <c:if test="${vemec.id_slave} == id_slave">
                            <option value="${vemec.id}">${vemec.Modelo} - ${vemec.Ubicacion}</option>
                        </c:if>
                    </c:forEach>
                </select>
                <!-- -->
                <label for="alta">Dar de alta:</label>
                <select name="alta" id="form_alta" class="form-control mb-1">
                    <option selected value="false">No</option>
                    <option value="true">Si</option>
                </select>
                <label for="defuncion">Registrar defuncion:</label>
                <select name="defuncion" id="form_defuncion" class="form-control mb-1">
                    <option selected value="false">No</option>
                    <option value="true">Si</option>
                </select>
                <label for="medico_tratante">Medico tratante:</label>
                <input type="text" name="medico_tratante" id="form_medico_tratante" class="form-control">
                <div class="text-center">
                    <button class="btn btn-secondary text-white mt-1" type="button" onclick="altaAccionMedica()" data-dismiss="modal">
                        Enviar
                    </button>
                </div>
              </form>
          </div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Modal Datos de Paciente -->
  <div class="modal fade" id="pacienteModal" tabindex="-1" role="dialog" aria-labelledby="pacienteModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="pacienteModalModalLabel">Paciente</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Cerrar">
            <span aria-hidden="true">×</span>
          </button>
        </div>
          <div class="modal-body">
              <div class="form-inline">
                  <h6><strong>CI:</strong>&nbsp;</h6>
                  <h6 id="modal_ci"></h6>
              </div>
              <div class="form-inline">
                  <h6><strong>Nombre:</strong>&nbsp;</h6>
                  <h6 id="modal_nombre"></h6>
              </div>
              <div class="form-inline">
                  <h6><strong>Sexo:</strong>&nbsp;</h6>
                  <h6 id="modal_sexo"></h6>
              </div>
              <div class="form-inline">
                  <h6><strong>Edad:</strong>&nbsp;</h6>
                  <h6 id="modal_edad"></h6>
              </div>
              <div class="form-inline">
                  <h6><strong>Nacionalidad:</strong>&nbsp;</h6>
                  <h6 id="modal_nacionalidad"></h6>
              </div>
              <div class="form-inline">
                  <h6><strong>Lugar de Residencia:</strong>&nbsp;</h6>
                  <h6 id="modal_residencia"></h6>
              </div>
              <div class="form-inline">
                  <h6><strong>Direccion:</strong>&nbsp;</h6>
                  <h6 id="modal_direccion"></h6>
              </div>
              <div class="form-inline">
                  <h6><strong>Coordenadas:</strong>&nbsp;</h6>
                  <h6 id="modal_xyz"></h6>
              </div>
              <div>
                  <h6><strong>Antecedentes clinicos:</strong></h6>
                  <textarea readonly id="modal_antecedentes" class="form-control"></textarea>
              </div>
              <div class="form-inline">
                  <h6><strong>Nivel de riesgo: </strong>&nbsp;</h6>
                  <h6 id="modal_riesgo"></h6>
              </div>
              <div>
                  <h6><strong>Informacion de contacto:</strong></h6>
                  <textarea readonly id="modal_contactos" class="form-control"></textarea>
              </div>
          </div>
        <div class="modal-footer">
            <button class="btn btn-secondary" data-target="#accionMedicaModal">
                Accion Medica
            </button>
            <button id="modal_pac_historial" class="btn btn-secondary" data-target="#historialMedicoModal">
                Historial Medico
            </button>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Modal Historial Medico -->
  <div class="modal fade" id="historialMedicoModal" tabindex="-1" role="dialog" aria-labelledby="historialMedicoModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="historialMedicoModalLabel">Historial Medico</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Cerrar">
            <span aria-hidden="true">×</span>
          </button>
        </div>
          <div class="modal-body">
            <div class="col">
                <div id="historial-RespiracionChart" class="historial-chart">
                </div>
                <div id="historial-PulsacionesChart" class="historial-chart">
                </div>
            </div>
            <hr/>
            <div id="historialMedicoModalDatos">
                <!-- Template de ejemplo -->
                <h6>
                    <strong>Fecha y hora:</strong>&nbsp;
                    Descripcion<br/>
                    <!-- Si lo medican -->
                    <strong>Medicación:</strong>&nbsp; Medicacion<br/>
                    <!-- -->
                    <strong>Nivel de riesgo:</strong>&nbsp; Nivel de riesto<br/>
                    <!-- Si lo conectan a vemec -->
                    <strong>Conectado a Unidad:</strong>&nbsp; VeMec.ID<br/>
                    <strong>Localizada en:</strong> VeMec.Ubicacion<br/>
                    <!-- -->
                    <strong>Médico tratante:</strong>&nbsp; Medico<br/>
                </h6>
                <hr/>
            </div>
          </div>
        <div class="modal-footer">
            <button class="d-none d-sm-inline-block btn btn btn-primary shadow"><i class="fas fa-download fa-sm text-white-50"></i>
                Generar historial en pdf
            </button>
            <button class="btn btn-secondary" data-dismiss="modal">
                Cerrar
            </button>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Modal de confirmacion -->
  <div id="dataConfirmModal" class="modal" role="dialog" aria-labelledby="dataConfirmLabel" aria-hidden="true">
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          <h3 id="dataConfirmLabel">Por favor confirme su accion</h3>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
          <a class="btn btn-primary" id="dataConfirmOK">Confirmar</a>
      </div>
  </div>

</body>

</html>
