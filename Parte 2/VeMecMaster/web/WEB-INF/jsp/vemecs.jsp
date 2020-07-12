<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Laboratorio 1 JavaEE - VeMec</title>
    </head>

    <body>
        <div id="wrapper">
            <div id="content-wrapper" class="d-flex flex-column">
                <jsp:include page="../components/header.jsp"></jsp:include>
                <div class="container mt-4" style="background-color: #15bef1">
                    <div class="card">
                        <div class="card-header">
                           <a class="btn btn-light" href="altaVeMec">
                                <i class="fas fa-plus"></i>
                                Agregar nuevo VeMec
                            </a>
                        </div>

                        <div class="card-header text-center" style="background-color: #15bef1">
                            Lista de VeMecs
                        </div>
                        <div class="card-body bg-light">
                            <table class="table table-hover">
                                <thead>
                                    <th>ID</th>
                                    <th>Marca</th>
                                    <th>Modelo</th>
                                    <th>Ubicacion</th>
                                </thead>
                                <tbody>
                                    <c:forEach var="vemec" items="${lista}">
                                        <tr>
                                            <td>${vemec.Id}</td>
                                            <td>${vemec.Marca}</td>
                                            <td>${vemec.Modelo}</td>
                                            <td>${vemec.Ubicacion}</td>
                                            <td>
                                                <a href="modificarVeMec?id=${vemec.Id}" class="btn btn-light" style="background-color: #15bef1">
                                                    <i class="fas fa-edit"></i>
                                                    Modificar
                                                </a>
                                                <a href="bajaVeMec?id=${vemec.Id}" class="btn btn-danger">
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
                <jsp:include page="../components/footer.jsp"></jsp:include>
            </div>
        </div>
    </body>
</html>
