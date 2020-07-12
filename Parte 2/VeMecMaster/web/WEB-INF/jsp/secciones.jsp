<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VeMecMaster - Secciones</title>
    </head>

    <body >
        <div id="wrapper">
            <div id="content-wrapper" class="d-flex flex-column">
              <jsp:include page="../components/header.jsp"></jsp:include>
              <div id="content">
                <div class="container-fluid">
                   <div class="container mt-4" style="background-color: #15bef1">
                        <div class="card">
                            <div class="card-header">
                               <a class="btn btn-light" href="altaSeccion">
                                    <i class="fas fa-plus"></i>
                                    Agregar una nueva seccion.
                                </a>
                            </div>

                            <div class="card-header text-center" style="background-color: #15bef1">
                                Secciones
                            </div>
                            <div class="card-body bg-light">
                                <table class="table table-hover">
                                    <thead>
                                        <th>ID</th>
                                        <th>Nombre</th>
                                        <th>Intervalo de envio</th>
                                        <th>Intervalo de envio (Emergencia)</th>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="slave" items="${lista}">
                                            <tr>
                                                <td>${slave.id}</td>
                                                <td>${slave.Nombre}</td>
                                                <td>${slave.Intervalo_Envio}</td>
                                                <td>${slave.Intervalo_Emergencia}</td>
                                                <td>
                                                    <a href="seccion?id=${slave.id}" class="btn btn-light" style="background-color: #15bef1">
                                                        <i class="fas fa-database"></i>
                                                        Ir A
                                                    </a>
                                                    <a href="modificarSeccion?id=${slave.id}" class="btn btn-light" style="background-color: #15bef1">
                                                        <i class="fas fa-edit"></i>
                                                        Modificar
                                                    </a>
                                                    <a href="bajaSeccion?id=${slave.id}" class="btn btn-danger">
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
