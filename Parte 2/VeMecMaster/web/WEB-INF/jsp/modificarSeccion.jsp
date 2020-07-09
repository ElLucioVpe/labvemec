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
    </style>
    
    <body>
        <div id="wrapper">
            <div id="content-wrapper" class="d-flex flex-column">
                <jsp:include page="../components/header.jsp"></jsp:include>
                <div class="container mt-4 col-lg-6">
                    <div class="card">
                        <div class="card-header text-white">
                            Modificar Seccion
                        </div>
                        <div class="card-body">
                            <form method="POST">

                                <label>Nombre</label>
                                <input type="text" name="nombre" class="form-control" value="${lista[0].Nombre}">
                                <label>Intervalo de envio a servidor (min)</label>
                                <input type="number" name="intervalo_envio" class="form-control" value="${lista[0].Intervalo_Envio}">
                                <label>Intervalo de envio en emergencia (seg)</label>
                                <input type="number" name="intervalo_emergencia" class="form-control" value="${lista[0].Intervalo_Emergencia}">
                                <input type="submit" value="Modificar" class="btn btn-light">
                                <a href="index.htm" class="btn btn-secondary" style="color: #15bef1">
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
