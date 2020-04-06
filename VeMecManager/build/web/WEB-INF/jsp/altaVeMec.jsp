<%-- 
    Document   : altaPersona
    Created on : 18/03/2020, 01:30:31 AM
    Author     : esteban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
     <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Laboratorio 1 JavaEE - VeMec</title>
    </head>
    
    <div class="container mt-4 col-lg-4">
        <div class="card">
            <div class="card-header bg-secondary text-white">
                Alta de VeMec
            </div>
            <div class="card-body">
                <form method="POST">
                    <input type="text" name="marca" class="form-control" placeholder="Marca">
                    <input type="text" name="modelo" class="form-control" placeholder="Modelo">
                    <input type="text" name="ubicacion" class="form-control" placeholder="Ubicacion">
                    <input type="submit" value="Agregar" class="btn btn-primary">
                </form>
            </div>
        </div>
    </div>
    </div>
    </body>
</html>
