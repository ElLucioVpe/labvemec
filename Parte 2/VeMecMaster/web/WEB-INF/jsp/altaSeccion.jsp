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

        <!-- css -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/css/forms.css" />">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VeMecMaster - Alta Seccion</title>
    </head>
    
    <body>
        <div id="wrapper">
            <div id="content-wrapper" class="d-flex flex-column">
                <jsp:include page="../components/header.jsp"></jsp:include>
                <div class="container mt-4 col-lg-6">
                    <div class="card">
                        <div class="card-header text-white">
                            Alta de Seccion
                        </div>
                        <div class="card-body">
                            <form method="POST">
                                <label>Nombre</label>
                                <input type="text" name="nombre" class="form-control" placeholder="Nombre">
                                <label>Intervalo de envio a servidor (min)</label>
                                <input type="number" name="intervalo_envio" class="form-control" placeholder="Intervalo de envio a servidor (min)">
                                <label>Intervalo de envio en emergencia (seg)</label>
                                <input type="number" name="intervalo_emergencia" class="form-control" placeholder="Intervalo de envio en emergencia (seg)">
                                <input type="submit" value="Agregar" class="btn btn-light mt-1">
                                <a href="secciones" class="btn btn-secondary mt-1" style="color: #15bef1">
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
