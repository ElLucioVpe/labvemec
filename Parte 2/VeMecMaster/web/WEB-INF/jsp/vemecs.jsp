<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <!-- js externos -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

        <!-- js internos -->
        <script type="text/javascript" src="<c:url value="/resources/js/confirm-modal.js" />"></script>
        
        <!-- css -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VeMec Master - VeMecs</title>
    </head>

    <body>
        <div id="wrapper">
            <div id="content-wrapper" class="d-flex flex-column">
                <jsp:include page="../components/header.jsp"></jsp:include>
                <div id="content">
                    <div class="container-fluid">
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">VeMecs</h1>
                        </div>
                        <!-- Menu botones -->
                        <div class="row">

                          <!-- VeMecs -->
                          <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                              <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                  <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-dark text-uppercase mb-1">VeMecs</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">${lista.size()}</div>
                                  </div>
                                  <div class="col-auto">
                                    <i class="fas fa-list-alt fa-2x text-gray-300" style="color: #007bff"></i>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <!-- Alta Vemec -->
                          <div class="col-xl-3 col-md-6 mb-4">
                            <a href="altaVeMec">
                            <div class="card border-left-primary shadow h-100 py-2">
                              <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                  <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-dark text-uppercase mb-1">Agregar VeMec</div>
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
                            <c:forEach var="vemec" items="${lista}">
                                <!-- VeMec -->
                                <div class="col w-90">
                                  <div class="card w-90 border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                      <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                          <div class="text-xs font-weight-bold text-dark text-uppercase mb-1">
                                                VeMec${vemec.Id} | Marca ${vemec.Marca} | 
                                                Modelo ${vemec.Modelo} | Ubicacion ${vemec.Ubicacion} |
                                                <c:if test="${vemec.id_slave != null && vemec.id_slave > 0}">
                                                    <a href="seccion?id=${vemec.id_slave}" class="text-dark">Ir a Seccion</a> | 
                                                </c:if>
                                                <a href="registrosVeMec?id=${vemec.Id}" class="btn btn-primary mt-1">
                                                    <i class="fas fa-database"></i> 
                                                </a>
                                                <a href="modificarVeMec?id=${vemec.Id}" class="btn btn-primary mt-1">
                                                  <i class="fas fa-edit"></i>
                                                </a>
                                                <a href="bajaVeMec?id=${vemec.Id}" data-confirm="¿Esta seguro que desea eliminar este VeMec?" class="btn btn-danger mt-1">
                                                  <i class="fas fa-trash"></i> 
                                                </a>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                <jsp:include page="../components/footer.jsp"></jsp:include>
            </div>
        </div>
    </body>
</html>
