<%-- 
    Document   : datosVeMec
    Created on : 05/04/2020, 11:29:12 PM
    Author     : esteban
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ultimos datos del VeMec</title>
        
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.js"></script>
        <script language = "javascript" type = "text/javascript">
    
            //Grafica de presión
            var arrayDatos = [];
            var segundos = 0;
            
            arrayDatos.push(['Segundos', 'Presión de Entrada', 'Presión de Salida']);   
            <c:forEach var="registro" items="${datos}">
                arrayDatos.push(['${segundos}' , ${registro.Presion_Entrada}, ${registro.Presion_Salida}]);
                segundos = segundos + 60;
            </c:forEach>
                
            if(arrayDatos.length === 1) {
                arrayDatos.push(['0', 0, 0]);
            }
            
            const socket = io('http://localhost:4000');

            socket.on('datosVeMec'+${id}, (res) => {
                console.log("recibiendo datos de vemec...");
                var json = res;
                
                console.log("agregando datos a la grafica...");
                segundos++;
                arrayDatos.push(['${segundos}' , json.Presion_Entrada, json.Presion_Salida]);
            });
            
            google.charts.load('current', {
                callback: function () {

                  drawChart();
                  setInterval(drawChart, 1000);
                  
                  function drawChart() {
                    console.log("en draw");

                    var data = google.visualization.arrayToDataTable(arrayDatos);
                    var options = {
                        title: 'Datos de Presión',
                        curveType: 'function',
                        legend: { position: 'bottom' }
                    };

                    var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
                    chart.draw(data, options);
                  }

                },
                packages: ['corechart']
              });
              
    </script>
    </head>
    
    <style>
        body {
            background-color: whitesmoke;
        }
        
        h1 {
            font-size: 50px;
            color: white;
        }
        
        label {
            font-weight: 600;
            
        }
        
        form {
            align-content: center;
        }
        
        .card {
            background-color: #15bef1;
        }
    </style>
    <body>
        <div class="container mt-4">
            
            <div class="row">
                <div id="div_datos1" class="col-sm">
                    <div class="card">
                        <form class="form-inline">
                            <label>Presión máxima &nbsp</label>
                            <h1>${ultimo_dato.Presion_Maxima}</h1>
                        </form>
                    </div>
                    
                    <div class="card">
                        <form class="form-inline">
                            <label>Presión mínima &nbsp</label>
                            <h1>${ultimo_dato.Presion_Minima}</h1>
                        </form>
                    </div>
                    
                    <div class="card">
                        <form class="form-inline">
                            <label>Volumen de Gás &nbsp</label>
                            <h1>${ultimo_dato.Gas}</h1>
                        </form>
                    </div>
                    
                    <div class="card">
                        <form class="form-inline">
                            <label>Frecuencia de aporte &nbsp</label>
                            <h1>${ultimo_dato.Frecuencia}</h1>
                        </form>
                    </div>
                        
                    <div class="card">
                        <form class="form-inline">
                            <label>%O2 en mezcla &nbsp</label>
                            <h1>${ultimo_dato.Mezcla}</h1>
                        </form>
                    </div>
                </div>
                <div id="div_datos2" class="col-sm">
                    <div class="card">
                        <form class="form-inline">
                            <label>Humedad de aire &nbsp</label>
                            <h1>${ultimo_dato.Humedad}</h1>
                        </form>
                    </div>
                        
                    <div class="card">
                        <form class="form-inline">
                            <label>Temperatura de entrada &nbsp</label>
                            <h1>${ultimo_dato.Temperatura_Entrada}</h1>
                        </form>
                    </div>
                        
                    <div class="card">
                        <form class="form-inline">
                            <label>Temperatura de salida &nbsp</label>
                            <h1>${ultimo_dato.Temperatura_Salida}</h1>
                        </form>
                    </div>
                        
                    <div class="card">   
                        <form class="form-inline">
                            <label>Presión de entrada &nbsp</label>
                            <h1>${ultimo_dato.Presion_Entrada}</h1>
                        </form>
                    </div>
                        
                    <div class="card">
                        <form class="form-inline">
                            <label>Presión de salida &nbsp</label>
                            <h1>${ultimo_dato.Presion_Salida}</h1>
                        </form>
                    </div>
                   
                </div>
                <div class="col-sm">
                    <a href="registrosVeMec.htm?id=${ultimo_dato.Id_Vemec}" class="btn btn-light" style="background-color: #15bef1">
                        <i class="fas fa-database"></i> 
                        Todos los registros
                    </a>
                </div>
            </div>
                        <br>
            <div class="row">
                <div class="col-sm">
                    <div class="card">
                        <div id="curve_chart" style="width: 900px;"></div>
                    </div>
                </div>
                <div class="col-sm"></div>
            </div>
        </div>
    </body>
</html>
