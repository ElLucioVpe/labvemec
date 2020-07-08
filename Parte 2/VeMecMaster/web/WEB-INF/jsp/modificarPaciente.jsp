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
        body{
            background-color: #15bef1;
        }
        
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
        <div class="container mt-4 col-lg-4">
            <div class="card">
                <div class="card-header text-white">
                    Modificar Seccion
                </div>
                <div class="card-body">
                    <form method="POST">
                        <label for="CI">Cedula de identidad (Ej:1.111.111-1):</label>
                        <input type="text" name="CI" class="form-control">
                        <label for="nombre">Nombre:</label>
                        <input type="text" name="nombre" class="form-control" placeholder="Nombre">
                        <label for="sexo">Sexo:</label>
                        <select name="sexo" id="sexo">
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
                        <select name="selectVemec" id="selectVemec" onchange="showDiv('select_slave', this)">
                            <option selected value="null">No</option>
                            <option value="1">Si</option>
                        </select>
                        <!-- Oculto -->
                        <select name="select_slave" id="select_slave" onchange="showDiv('id_vemec', this)">
                            <option selected value="null">Seleccione una seccion</option>
                            <c:forEach var="slave" items="${slaves}">
                                <option value="${slave.id}">${slave.Nombre}</option>
                            </c:forEach>
                        </select>
                        <select name="id_vemec" id="id_vemec">
                            <option selected value="null">Seleccione un VeMec</option>
                            <c:forEach var="vemec" items="${vemecs_libres}">
                                <c:if test="${vemec.id_slave} == id_slave">
                                    <option value="${vemec.id}">${vemec.Modelo} - ${vemec.Ubicacion}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                        <!-- -->
                        <input type="submit" value="Agregar" class="btn btn-light">
                        <a href="index.htm" class="btn btn-secondary" style="color: #15bef1">
                            <i class="fas fa-chevron-left"></i> 
                            Regresar
                        </a>
                        <script>
                            var id_slave = 0;
                            function mostrarVeMecs(hiddenItem, element)
                            {
                                if(element.value !== null && element.value !== "null" && hiddenItem === "id_vemec") {
                                    let html = '<option selected value="null">Seleccione un VeMec</option>';
                                    foreach(vemec in ${vemecs_libres}) {
                                        if(vemec.id_slave = element.value) {
                                            html+='<option value="'+vemec.id+'">'+vemec.Modelo' - '+vemec.Ubicacion+'</option>';
                                        }
                                    }
                                    document.getElementById(hiddenItem).innerHTML = html;
                                }
                                
                                document.getElementById(hiddenItem).style.display = element.value === "null" ? 'none' : 'block';
                                id_slave = element.value;
                            }
                        </script>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
