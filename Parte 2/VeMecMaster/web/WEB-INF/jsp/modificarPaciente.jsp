<%-- 
    Document   : modificarSeccion
    Created on : 07-jul-2020, 1:12:38
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

        <!-- js internos -->
        <script src="<c:url value="/resources/js/selectVemecs.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/confirm-modal.js" />"></script>
        
        <!-- css -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/css/forms.css" />">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VeMecMaster - Modificar Seccion</title>
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
        console.log("${paciente}");
    </script>
    <body>
        <div id="wrapper">
            <div id="content-wrapper" class="d-flex flex-column">
                <jsp:include page="../components/header.jsp"></jsp:include>
                <div class="container mt-4 col-lg-6">
                    <div class="card">
                        <div class="card-header text-white">
                            Modificar Paciente
                        </div>
                        <div class="card-body">
                            <form method="POST">
                                <label for="CI">Cedula de identidad (Ej:1.111.111-1):</label>
                                <input type="text" name="ci" class="form-control" value="${paciente.ci}">
                                <label for="nombre">Nombre:</label>
                                <input type="text" name="nombre" class="form-control" value="${paciente.nombre}">
                                <label for="sexo">Sexo:</label>
                                <select name="sexo" id="sexo" class="form-control" value="${paciente.sexo}">
                                    <option value="Femenino">Femenino</option>
                                    <option value="Masculino">Masculino</option>
                                    <option value="Otro">Otro</option>
                                </select>
                                <label for="edad">Edad:</label>
                                <input type="number" name="edad" class="form-control" value="${paciente.edad}">
                                <label for="nacionalidad">Nacionalidad:</label>
                                <input type="text" name="nacionalidad" class="form-control" value="${paciente.nacionalidad}">
                                <label for="lugarResidencia">Lugar de Residencia:</label>
                                <input type="text" name="lugarResidencia" class="form-control" value="${paciente.lugar_residencia}">
                                <label for="direccion">Direccion:</label>
                                <input type="text" name="direccion" class="form-control" value="${paciente.direccion}">
                                <label for="coordenadas">Coordenadas:</label>
                                <input type="text" name="coordenadas" class="form-control" value="${paciente.coordenadas}">
                                <label for="antecedentesClinicos">Antecedentes Clinicos:</label>
                                <textarea type="text" name="antecedentesClinicos" class="form-control">${paciente.antecedentes_clinicos}</textarea>
                                <label for="nivelRiesgo">Nivel de Riesgo:</label>
                                <select name="nivelRiesgo" id="nivel_riesgo" class="form-control">
                                    <option value="Bajo" <c:if test="${paciente.nivel_riesgo == 'Bajo'}">selected</c:if>>Bajo</option>
                                    <option value="Medio" <c:if test="${paciente.nivel_riesgo == 'Medio'}">selected</c:if>>Medio</option>
                                    <option value="Alto" <c:if test="${paciente.nivel_riesgo == 'Alto'}">selected</c:if>>Alto</option>
                                    <option value="Grave" <c:if test="${paciente.nivel_riesgo == 'Grave'}">selected</c:if>>Grave</option>
                                    <option value="Muy Grave" <c:if test="${paciente.nivel_riesgo == 'Muy Grave'}">selected</c:if>>Muy Grave</option>
                                </select>
                                <label for="sexo">Conectar a VeMec?:</label>
                                <select name="selectVemec" id="selectVemec" class="form-control" onchange="showDiv('select_slave', this)">
                                    <option selected value="null">No</option>
                                    <option value="1">Si</option>
                                </select>
                                <!-- Oculto -->
                                <select name="select_slave" id="select_slave" class="form-control" onchange="showDiv('id_vemec', this)">
                                    <option selected value="null">Seleccione una seccion</option>
                                </select>
                                <select name="idVemec" id="id_vemec" class="form-control">
                                    <option selected value="${paciente.id_vemec}">Seleccione un VeMec</option>
                                </select>
                                <!-- -->
                                <input type="submit" value="Modificar" class="btn btn-light">
                                <a href="pacientes" class="btn btn-secondary" style="color: #15bef1">
                                    <i class="fas fa-chevron-left"></i> 
                                    Regresar
                                </a>
                            </form>
                            <hr/>
                            <a href="bajaPaciente?id=${paciente.id}" data-confirm="¿Eliminara este paciente?" class="btn btn-danger mt-1 text-center">
                                <i class="fas fa-trash"></i> 
                                Eliminar
                            </a>
                        </div>
                    </div>
                </div>
                <jsp:include page="../components/footer.jsp"></jsp:include>
            </div>
        </div>
    </body>
</html>
