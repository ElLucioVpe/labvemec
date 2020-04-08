<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
     <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresar nuevo VeMec</title>
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
                    Alta de VeMec
                </div>
                <div class="card-body">
                    <form method="POST">
                        <input type="text" name="marca" class="form-control" placeholder="Marca">
                        <input type="text" name="modelo" class="form-control" placeholder="Modelo">
                        <input type="text" name="ubicacion" class="form-control" placeholder="Ubicacion">
                        <input type="submit" value="Agregar" class="btn btn-light">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
