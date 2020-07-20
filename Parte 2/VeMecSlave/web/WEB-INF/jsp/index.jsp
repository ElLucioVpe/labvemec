<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <title>JavaEE - Slaves Master</title>
        
    </head>
    <body>
        <div id="wrapper">
            <div id="content-wrapper" class="d-flex flex-column">
                <!-- Header -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <h3 class="text-center  mx-auto" id="page-top"><a href="index.htm" class="text-dark">VeMecSlave</a></h3>
                </nav>
                <!-- Header -->
              <div id="content">
                <div class="container-fluid">
                  <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 mx-auto text-gray-800">Secciones</h1>
                  </div>
                    <div class="container mt-4" style="background-color: #15bef1">
                        <div class="card">

                            <div class="card-header text-center" style="background-color: #15bef1">
                                Lista de Slaves
                            </div>
                            <div class="card-body bg-light">
                                <table class="table table-hover">
                                    <thead>
                                        <th>ID</th>
                                        <th>NOMBRE</th>
                                        <th>Intervalo Envio</th>
                                        <th>Intervalo Emergencia</th>
                                    </thead>
                                    <tbody id="slaves_list">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
              </div>
            </div>
        </div>
        <script>
           
        $(document ).ready(async function() {
                let htmlVemecs_list = $("#slaves_list");
        	const url = "http://localhost:8080/RESTapi/webresources/entities.slaves";
              
                 let datosSlaves = await fetch(url, {
                    method: 'GET', // or 'PUT'
                    headers:{
                      'Accept': 'application/json'
                    }
                  })
		  .then(function(response) {
		    return response.json();
		  });
                  
                  console.log(datosSlaves);
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
			    <td>`+entry.id+`</td>
			    <td>`+entry.nombre+`</td>
			    <td>`+entry.intervaloEnvio+`</td>
			    <td>`+entry.intervaloEmergencia+`</td>
			    <td>
				<a href="datosVeMec.htm?id=`+entry.id+`&tiempo=`+entry.intervaloEnvio+`&intervaloEmergencia=`+entry.intervaloEmergencia+`" class="btn btn-light" style="background-color: #15bef1">
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
