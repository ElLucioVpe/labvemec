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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VeMecMaster - Agregar Paciente</title>
    </head>
    <style>
        .btn-light {
            background-color: #15bef1;
            color: white;
        }
        
        .card-header {
            background-color: #15bef1;
            font-weight: 600;
        }
        
        #select_slave, #id_vemec {
            display: none;
        }
    </style>
    
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
                            <form method="POST">
                                <label for="CI">Cedula de identidad (Ej:1.111.111-1):</label>
                                <input type="text" name="CI" class="form-control">
                                <label for="nombre">Nombre:</label>
                                <input type="text" name="nombre" class="form-control" placeholder="Nombre">
                                <label for="sexo">Sexo:</label>
                                <select name="sexo" id="sexo" class="form-control">
                                    <option value="Femenino">Femenino</option>
                                    <option value="Masculino">Masculino</option>
                                    <option value="Otro">Otro</option>
                                </select>
                                <label for="edad">Edad:</label>
                                <input type="number" name="edad" class="form-control" placeholder="Edad">
                                <label for="nacionalidad">Nacionalidad:</label>
                                <input type="text" name="nacionalidad" class="form-control" placeholder="Nacionalidad">
                                <label for="lugar_residencia">Lugar de Residencia:</label>
                                <input type="number" name="lugar_residencia" class="form-control" placeholder="Lugar de Residencia">
                                <label for="direccion">Direccion:</label>
                                <input type="text" name="direccion" class="form-control" placeholder="Direccion">
                                <label for="coordenadas">Coordenadas:</label>
                                <input type="text" name="coordenadas" class="form-control" placeholder="Coordenadas">
                                <label for="antecedentes_clinicos">Antecedentes Clinicos:</label>
                                <textarea type="text" name="antecedentes_clinicos" class="form-control" placeholder="Antecedentes Clinicos">
                                </textarea>
                                <label for="nivel_riesgo">Nivel de Riesgo:</label>
                                <select name="nivel_riesgo" id="nivel_riesgo" class="form-control">
                                    <option value="Bajo">Bajo</option>
                                    <option value="Medio">Medio</option>
                                    <option value="Alto">Alto</option>
                                    <option value="Grave">Grave</option>
                                    <option value="Muy Grave">Muy Grave</option>
                                </select>
                                <label for="sexo">Conectar a VeMec?:</label>
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
                                <input type="submit" value="Agregar" class="btn btn-light">
                                <a href="/" class="btn btn-secondary" style="color: #15bef1">
                                    <i class="fas fa-chevron-left"></i> 
                                    Regresar
                                </a>
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
                                    
                                    function showDiv(hiddenItem, element)
                                    {
                                        if(element.value !== null && element.value !== "null") {
                                            let html = "";
                                            if(hiddenItem === "id_vemec") {console.log(arrayVeMecs);
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
                            </form>
                        </div>
                    </div>
                </div>
                <jsp:include page="../components/footer.jsp"></jsp:include>
            </div>
        </div>
    </body>
</html>
