<%-- 
    Document   : modificarSeccion
    Created on : 07-jul-2020, 1:12:38
    Author     : Esteban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VeMecMaster - Modificar Seccion</title>
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
                            Modificar Paciente
                        </div>
                        <div class="card-body">
                            <form method="POST">
                                <label for="CI">Cedula de identidad (Ej:1.111.111-1):</label>
                                <input type="text" name="CI" class="form-control">
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
                                <label for="lugar_residencia">Lugar de Residencia:</label>
                                <input type="number" name="lugar_residencia" class="form-control" value="${paciente.lugarResidencia}">
                                <label for="direccion">Direccion:</label>
                                <input type="text" name="direccion" class="form-control" value="${paciente.direccion}">
                                <label for="coordenadas">Coordenadas:</label>
                                <input type="text" name="coordenadas" class="form-control" value="${paciente.coordenadas}">
                                <label for="antecedentes_clinicos">Antecedentes Clinicos:</label>
                                <textarea type="text" name="antecedentes_clinicos" class="form-control">
                                    ${paciente.antecedentesClinicos}
                                </textarea>
                                <label for="nivel_riesgo">Nivel de Riesgo:</label>
                                <select name="nivel_riesgo" id="nivel_riesgo" class="form-control" value="${paciente.nivelRiesgo}">
                                    <option value="Bajo">Bajo</option>
                                    <option value="Medio">Medio</option>
                                    <option value="Alto">Alto</option>
                                    <option value="Grave">Grave</option>
                                    <option value="Muy Grave">Muy Grave</option>
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
                                <select name="id_vemec" id="id_vemec" class="form-control">
                                    <option selected value="${paciente.idVemec.id}">Seleccione un VeMec</option>
                                </select>
                                <!-- -->
                                <input type="submit" value="Agregar" class="btn btn-light">
                                <a href="index.htm" class="btn btn-secondary" style="color: #15bef1">
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
                            </form>
                        </div>
                    </div>
                </div>
                <jsp:include page="../components/footer.jsp"></jsp:include>
            </div>
        </div>
    </body>
</html>
