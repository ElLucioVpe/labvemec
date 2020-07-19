<%-- 
    Document   : altaSeccion
    Created on : 07-jul-2020, 1:12:19
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
        <script src="<c:url value="/resources/js/ci.jquery.js" />"></script>
        <script src="<c:url value="/resources/js/pacienteform.js" />"></script>
        
        <!-- css -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/css/forms.css" />">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VeMecMaster - Agregar Paciente</title>
    </head>
    <script>
        //Cargo datos
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
                <div class="container mt-4 col-lg-6">
                    <div class="card">
                        <div class="card-header text-white">
                            Agregar Paciente
                        </div>
                        <div class="card-body">
                            <form method="POST" class="needs-validation" novalidate>
                                <label for="ci">Cedula de identidad (Ej:1.111.111-1):</label>
                                <input type="text" name="ci" id="ci" class="form-control" required>
                                <div id="ci-invalid" class="invalid-feedback">
                                    Por favor ingrese una cedula valida
                                </div>
                                <div id="ci-invalid-existe" class="invalid-feedback d-none">
                                    La cedula de identidad que ingreso ya esta registrada
                                </div>
                                <label for="nombre">Nombre:</label>
                                <input type="text" name="nombre" class="form-control" placeholder="Nombre" required>
                                <label for="sexo">Sexo:</label>
                                <select name="sexo" id="sexo" class="form-control">
                                    <option value="Femenino">Femenino</option>
                                    <option value="Masculino">Masculino</option>
                                    <option value="Otro">Otro</option>
                                </select>
                                <label for="edad">Edad:</label>
                                <input type="number" name="edad" class="form-control" placeholder="Edad" required>
                                <label for="nacionalidad">Nacionalidad:</label>
                                <input type="text" name="nacionalidad" class="form-control" placeholder="Nacionalidad" required>
                                <label for="lugarResidencia">Lugar de Residencia:</label>
                                <input type="text" name="lugarResidencia" class="form-control" placeholder="Lugar de Residencia" required>
                                <label for="direccion">Direccion:</label>
                                <input type="text" name="direccion" class="form-control" placeholder="Direccion" required>
                                <label for="coordenadas">Coordenadas:</label>
                                <input type="text" name="coordenadas" class="form-control" placeholder="Coordenadas">
                                <label for="antecedentesClinicos">Antecedentes Clinicos:</label>
                                <textarea type="text" name="antecedentesClinicos" class="form-control" placeholder="Antecedentes Clinicos"></textarea>
                                <label for="nivelRiesgo">Nivel de Riesgo:</label>
                                <select name="nivelRiesgo" id="nivel_riesgo" class="form-control" required>
                                    <option value="Bajo">Bajo</option>
                                    <option value="Medio">Medio</option>
                                    <option value="Alto">Alto</option>
                                    <option value="Grave">Grave</option>
                                    <option value="Muy Grave">Muy Grave</option>
                                </select>
                                <label for="selectVemec">Conectar a VeMec?:</label>
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
                                <select name="idVemec" id="id_vemec" class="form-control mb-1">
                                    <option selected value=null>Seleccione un VeMec</option>
                                    <c:forEach var="vemec" items="${vemecs_libres}">
                                        <c:if test="${vemec.id_slave} == id_slave">
                                            <option value="${vemec.id}">${vemec.Modelo} - ${vemec.Ubicacion}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                                <!-- -->
                                <!-- Contactos -->
                                <label for="listaContactos">Contactos:</label>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <button type="button" onclick="addContacto()" class="btn btn-success"><i class='fas fa-plus'></i></button>
                                        <ul id="listaContactos">
                                        </ul>
                                    </div>
                                </div>
                                <!-- -->
                                <input type="submit" value="Agregar" class="btn btn-light">
                                <a href="./" class="btn btn-secondary" style="color: #15bef1">
                                    <i class="fas fa-chevron-left"></i> 
                                    Regresar
                                </a>
                            </form>
                        </div>
                    </div>
                </div>
                <jsp:include page="../components/footer.jsp"></jsp:include>
            </div>
        </div>
    </body>
</html>
