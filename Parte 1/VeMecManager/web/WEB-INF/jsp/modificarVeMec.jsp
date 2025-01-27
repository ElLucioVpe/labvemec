<%-- 
    Document   : modificarPersona
    Created on : 18/03/2020, 01:33:20 AM
    Author     : esteban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar datos de VeMec</title>
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
    </style>
    
    <body>
        <div class="container mt-4 col-lg-4">
            <div class="card">
                <div class="card-header text-white">
                    Modificar VeMec
                </div>
                <div class="card-body">
                    <form method="POST">

                        <label>Marca</label>
                        <input type="text" name="marca" class="form-control" value="${lista[0].Marca}">
                        <label>Modelo</label>
                        <input type="text" name="modelo" class="form-control" value="${lista[0].Modelo}">
                        <label>Ubicacion</label>
                        <input type="text" name="ubicacion" class="form-control" value="${lista[0].Ubicacion}">
                        <input type="submit" value="Modificar" class="btn btn-light">
                        <a href="index.htm" class="btn btn-secondary" style="color: #15bef1">
                            <i class="fas fa-chevron-left"></i> 
                            Regresar
                        </a>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
