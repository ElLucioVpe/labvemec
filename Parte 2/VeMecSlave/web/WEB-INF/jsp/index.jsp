<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JavaEE - Slaves Master</title>
        
    </head>
    <body>
        <div class="container mt-4" style="background-color: #15bef1">
            <div class="card">
                
                <div class="card-header text-center" style="background-color: #15bef1">
                    Lista de VeMecs
                </div>
                <div class="card-body bg-light">
                    <table class="table table-hover">
                        <thead>
                            <th>ID</th>
                            <th>NOMBRE</th>
                            <th>Intervalo Envio</th>
                            <th>Intervalo Emergencia</th>
                        </thead>
                        <tbody>
                            
                        <div id="vemecs_list"></div>
                        </tbody>
                    </table>
                </div>
            </div>
            
        </div>
        <script>
        $( document ).ready(function() {
                let htmlVemecs_list = $("#vemecs_list");
        	const url = "http://localhost:8080/RESTapi/webresources/entities.slaves";
                let datosSlaves = await fetch("http://localhost/test.html")
		  .then(function(response) {
		    return response.json();
		  });
                /*let datosSlaves = [{
                	Id: "1",
                	Nombre: "Ejemplo",
                	Intervalo_Envio: "1",
                	Intervalo_Emergencia: "20"
                }];*/
                let html = "";
                datosSlaves.forEach(function(entry) {
			html += `
		        <tr>
			    <td>`+entry.Id+`</td>
			    <td>`+entry.Nombre+`</td>
			    <td>`+entry.Intervalo_Envio+`</td>
			    <td>`+entry.Intervalo_Emergencia+`</td>
			    <td>
				<a href="datosVeMec.htm?id=`+entry.Id+`&tiempo=`+entry.Timestamp_Data+`" class="btn btn-light" style="background-color: #15bef1">
				    <i class="fas fa-database"></i>
				    Datos
				</a>
			    </td>
			</tr>
			`;
		  });
		  htmlVemecs_list.html(html)
	});
        </script>

    </body>
</html>
