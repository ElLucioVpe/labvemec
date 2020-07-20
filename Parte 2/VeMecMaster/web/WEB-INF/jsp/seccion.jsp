<%-- 
    Document   : seccion.jsp
    Created on : 07-jul-2020, 0:04:31
    Author     : Esteban
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- js externos -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    <script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.js"></script>
    
    <!-- js internos -->
    <script src="<c:url value="/resources/js/html2pdf.bundle.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/seccion.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/modals.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/selectVemecs.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/confirm-modal.js" />"></script>
    
    <!-- css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>VeMecMaster - Seccion</title>
</head>
<script type="text/javascript">
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();

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
    socket.on('datos_masterSlave'+${slave.id}, function(res) {
        //console.log("escuchando en websocket:"+JSON.stringify(res));
        actualizarDatos(res);
    });
    
    var urlSound = '<c:url value="/resources/sound/" />';
    
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
</script>

<body id="page-top">
  <audio id="audio-alerta" src="<c:url value="/resources/sound/" />" autoplay>
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
                    <h6 id="energia${dato.getVemec().getId()}" class="m-0 font-weight-bold text-dark pull-right">
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
                        </c:choose>
                        <a class="dropdown-item" href="registrosVeMec?id=${dato.getVemec().getId()}">
                            Ver todos los registros
                        </a>
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
                              <h5 class="font-weight-bold">
                                  <strong id="Pmax${dato.getVemec().getId()}">${dato.getUltimoDato().getPresionMaxima()}</strong>
                              </h5>
                            </div>
                            <div class="form-inline mx-1" data-toggle="tooltip" title="Presión Mínima (mmHg)">
                              <small class="font-weight-bold">Pmin</small>
                              <h5 class="font-weight-bold">
                                  <strong id="Pmin${dato.getVemec().getId()}">${dato.getUltimoDato().getPresionMinima()}</strong>
                              </h5>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-inline mx-1" data-toggle="tooltip" title="Composición de mezcla en porcentaje de O2">
                              <small class="font-weight-bold">O2</small>
                              <h5 class="font-weight-bold">
                                  <strong id="O2${dato.getVemec().getId()}">${dato.getUltimoDato().getMezcla()}%</strong>
                              </h5>
                            </div>
                            <div class="form-inline mx-1" data-toggle="tooltip" title="Gas (cc)">
                              <small class="font-weight-bold">Gas</small>
                              <h5 class="font-weight-bold">
                                  <strong id="Gas${dato.getVemec().getId()}">${dato.getUltimoDato().getGas()}</strong>
                              </h5>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-inline mx-1" data-toggle="tooltip" title="Humedad del aire">
                              <small class="font-weight-bold">Hum</small>
                              <h5 class="font-weight-bold">
                                  <strong id="Hum${dato.getVemec().getId()}">${dato.getUltimoDato().getHumedad()}%</strong>
                              </h5>
                            </div>
                            <div class="form-inline mx-1" data-toggle="tooltip" title="Frecuencia de aporte (/min)">
                              <small class="font-weight-bold">Fr</small>
                              <h5 class="font-weight-bold">
                                  <strong id="Fr${dato.getVemec().getId()}">${dato.getUltimoDato().getFrecuencia()}</strong>
                              </h5>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-inline mx-1" data-toggle="tooltip" title="Temperatura de entrada (ºC)">
                              <small class="font-weight-bold">TE</small>
                              <h5 class="font-weight-bold">
                                  <strong id="TE${dato.getVemec().getId()}">${dato.getUltimoDato().getTemperaturaEntrada()}</strong>
                              </h5>
                            </div>
                            <div class="form-inline mx-1" data-toggle="tooltip" title="Temperatura de salida (ºC)">
                              <small class="font-weight-bold">TS</small>
                              <h5 class="font-weight-bold">
                                  <strong id="TS${dato.getVemec().getId()}">${dato.getUltimoDato().getTemperaturaSalida()}</strong>
                              </h5>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-inline mx-1" data-toggle="tooltip" title="Presion de entrada (mmHg)">
                              <small class="font-weight-bold">PE</small>
                              <h5 class="font-weight-bold">
                                  <strong id="PE${dato.getVemec().getId()}">${dato.getUltimoDato().getPresionEntrada()}</strong>
                              </h5>
                            </div>
                            <div class="form-inline mx-1" data-toggle="tooltip" title="Presion de salida (mmHg)">
                              <small class="font-weight-bold">PS</small>
                              <h5 class="font-weight-bold">
                                  <strong id="PS${dato.getVemec().getId()}">${dato.getUltimoDato().getPresionSalida()}</strong>
                              </h5>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-inline mx-1 pull-left" data-toggle="tooltip" title="Pulsaciones">
                              <h4 class="font-weight-bold">
                                  <strong id="Pulso${dato.getVemec().getId()}">${dato.getUltimoDato().getPulsaciones()}</strong>
                              </h4>
                              <h2>
                                  <i class="fa fa-heartbeat" aria-hidden="true" style="color: salmon"></i>
                              </h2>
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
      <jsp:include page="../components/modals.jsp"></jsp:include>
      <jsp:include page="../components/footer.jsp"></jsp:include>
    </div>

  </div>
</body>

</html>
