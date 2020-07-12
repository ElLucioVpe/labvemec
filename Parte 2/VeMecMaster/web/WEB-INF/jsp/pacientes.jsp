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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VeMecMaster - Pacientes</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="content-wrapper" class="d-flex flex-column">
              <jsp:include page="../components/header.jsp"></jsp:include>
              <div id="content">
                <div class="container-fluid">
                   <div class="container mt-4" style="background-color: #15bef1">
                        <div class="card">
                            <div class="card-header">
                               <a class="btn btn-light" href="agregarPaciente">
                                    <i class="fas fa-plus"></i>
                                    Agregar un nuevo paciente.
                                </a>
                            </div>

                            <div class="card-header text-center" style="background-color: #15bef1">
                                Pacientes
                            </div>
                            <div class="card-body bg-light">
                                <table class="table table-hover">
                                    <thead>
                                        <th>CI</th>
                                        <th>Nombre</th>
                                        <th>Sexo</th>
                                        <th>Edad</th>
                                        <th>Nacionalidad</th>
                                        <th>Residencia</th>
                                        <th>Direccion</th>
                                        <th>Coordenadas</th>
                                        <th>Antecedentes</th>
                                        <th>Nivel de riesgo</th>
                                        <th>Defuncion</th>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="paciente" items="${lista}">
                                            <tr>
                                                <td>${paciente.CI}</td>
                                                <td>${paciente.Nombre}</td>
                                                <td>${paciente.Sexo}</td>
                                                <td>${paciente.Edad}</td>
                                                <td>${paciente.Nacionalidad}</td>
                                                <td>${paciente.Lugar_Residencia}</td>
                                                <td>${paciente.Direccion}</td>
                                                <td>${paciente.Coordenadas}</td>
                                                <td>${paciente.Antecedentes_Clinicos}</td>
                                                <td>${paciente.Nivel_Riesgo}</td>
                                                <td>${paciente.Defuncion}</td>
                                                <td>
                                                    <a href="modificarPaciente?id=${paciente.id}" class="btn btn-light" style="background-color: #15bef1">
                                                        <i class="fas fa-edit"></i>
                                                        Modificar
                                                    </a>
                                                    <a href="bajaPaciente?id=${paciente.id}" class="btn btn-danger">
                                                        <i class="fas fa-trash"></i> 
                                                        Eliminar
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
              </div>
              <jsp:include page="../components/footer.jsp"></jsp:include>
            </div>
        </div>
        
    </body>
</html>
