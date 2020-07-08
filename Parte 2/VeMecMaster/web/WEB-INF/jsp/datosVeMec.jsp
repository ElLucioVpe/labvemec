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
            var segundosAUX = segundos;
            const socket = io('http://localhost:4000');
            
            socket.on('datosVeMec'+${id}, (res) => {
                console.log("recibiendo datos de vemec...");
                var json = res;
                
                document.getElementById('p_mx').innerHTML = json.Presion_Maxima + "mmHg";
                document.getElementById('p_mn').innerHTML = json.Presion_Minima + "mmHg";
                document.getElementById('gas').innerHTML = json.Gas + "cc";
                document.getElementById('frec').innerHTML = json.Frecuencia + "/min";
                document.getElementById('mez').innerHTML = json.Mezcla + "%";
                document.getElementById('hum').innerHTML = json.Humedad + "%";
                document.getElementById('t_in').innerHTML = json.Temperatura_Entrada + "ºC";
                document.getElementById('t_out').innerHTML = json.Temperatura_Salida + "ºC";
                document.getElementById('p_in').innerHTML = json.Presion_Entrada + "mmHg";
                document.getElementById('p_out').innerHTML = json.Presion_Salida + "mmHg";
                
                console.log("agregando datos a la grafica...");
                segundos++;
                if((segundosAUX+30) == segundos){
                    segundosAUX = segundos;
                    arrayDatos = [];
                    arrayDatos.push(['Segundos', 'Presión de Entrada', 'Presión de Salida']);
                }
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
                            <h1 id="p_mx">${ultimo_dato.Presion_Maxima}mmHg</h1>
                        </form>
                    </div>
                    
                    <div class="card">
                        <form class="form-inline">
                            <label>Presión mínima &nbsp</label>
                            <h1 id="p_mn">${ultimo_dato.Presion_Minima}mmHg</h1>
                        </form>
                    </div>
                    
                    <div class="card">
                        <form class="form-inline">
                            <label>Volumen de Gás &nbsp</label>
                            <h1 id="gas">${ultimo_dato.Gas}cc</h1>
                        </form>
                    </div>
                    
                    <div class="card">
                        <form class="form-inline">
                            <label>Frecuencia de aporte &nbsp</label>
                            <h1 id="frec">${ultimo_dato.Frecuencia}/min</h1>
                        </form>
                    </div>
                        
                    <div class="card">
                        <form class="form-inline">
                            <label>%O2 en mezcla &nbsp</label>
                            <h1 id="mez">${ultimo_dato.Mezcla}%</h1>
                        </form>
                    </div>
                </div>
                <div id="div_datos2" class="col-sm">
                    <div class="card">
                        <form class="form-inline">
                            <label>Humedad de aire &nbsp</label>
                            <h1 id="hum">${ultimo_dato.Humedad}%</h1>
                        </form>
                    </div>
                        
                    <div class="card">
                        <form class="form-inline">
                            <label>Temperatura de entrada &nbsp</label>
                            <h1 id="t_in">${ultimo_dato.Temperatura_Entrada}ºC</h1>
                        </form>
                    </div>
                        
                    <div class="card">
                        <form class="form-inline">
                            <label>Temperatura de salida &nbsp</label>
                            <h1 id="t_out">${ultimo_dato.Temperatura_Salida}ºC</h1>
                        </form>
                    </div>
                        
                    <div class="card">   
                        <form class="form-inline">
                            <label>Presión de entrada &nbsp</label>
                            <h1 id="p_in">${ultimo_dato.Presion_Entrada}mmHg</h1>
                        </form>
                    </div>
                        
                    <div class="card">
                        <form class="form-inline">
                            <label>Presión de salida &nbsp</label>
                            <h1 id="p_out">${ultimo_dato.Presion_Salida}mmHg</h1>
                        </form>
                    </div>
                   
                </div>
                <div class="col-sm">
                    <a href="registrosVeMec.htm?id=${id}" class="btn btn-light" style="background-color: #15bef1">
                        <i class="fas fa-database"></i> 
                        Todos los registros
                    </a>
                    <a href="index.htm" class="btn btn-secondary" style="color: #15bef1">
                        <i class="fas fa-chevron-left"></i> 
                        Regresar
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
