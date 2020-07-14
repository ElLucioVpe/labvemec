<%-- 
    Document   : pacientes
    Created on : 09-jul-2020, 18:33:59
    Author     : Esteban
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- js externos -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <!-- js internos -->
        <script src="<c:url value="/resources/js/html2pdf.bundle.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/modals.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/selectVemecs.js" />"></script>
        
        <!-- css -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VeMecMaster - Pacientes</title>
    </head>
    <script>
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
    <body>
        <div id="wrapper">
            <div id="content-wrapper" class="d-flex flex-column">
              <jsp:include page="../components/header.jsp"></jsp:include>
              <div id="content">
                <div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Pacientes</h1>
                    </div>
                    <!-- Menu botones -->
                    <div class="row">

                      <!-- Pacientes -->
                      <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-primary shadow h-100 py-2">
                          <div class="card-body">
                            <div class="row no-gutters align-items-center">
                              <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-dark text-uppercase mb-1">Pacientes</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">${lista.size()}</div>
                              </div>
                              <div class="col-auto">
                                <i class="fas fa-list-alt fa-2x text-gray-300" style="color: #007bff"></i>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- Alta Paciente -->
                      <div class="col-xl-3 col-md-6 mb-4">
                        <a href="agregarPaciente">
                        <div class="card border-left-primary shadow h-100 py-2">
                          <div class="card-body">
                            <div class="row no-gutters align-items-center">
                              <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-dark text-uppercase mb-1">Agregar Paciente</div>
                              </div>
                              <div class="col-auto">
                                <i class="fas fa-plus fa-2x text-gray-300" style="color: #007bff"></i>
                              </div>
                            </div>
                          </div>
                        </div>
                        </a>
                      </div>
                    </div>
                    <!-- Fin Menu botones -->          
                    <div>
                        <c:forEach var="paciente" items="${lista}">
                            <!-- Seccion -->
                            <div class="col w-90">
                              <a data-toggle="modal" data-target="#pacienteModal" onclick="datosPaciente(${paciente.id})">
                              <div class="card w-90 border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                  <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                      <div class="text-xs font-weight-bold text-dark text-uppercase mb-1">${paciente.Nombre}</div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
              </div>
              <jsp:include page="../components/modals.jsp"></jsp:include>
              <jsp:include page="../components/footer.jsp"></jsp:include>
            </div>
        </div>
        
    </body>
</html>
