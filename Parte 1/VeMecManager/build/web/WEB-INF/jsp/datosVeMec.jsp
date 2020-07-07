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
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ultimos datos del VeMec</title>
        
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {'packages':['corechart']});
            google.charts.setOnLoadCallback(drawChart);
            var segundos = 0;
            function drawChart() {
              let arrayDatos = [];
              
              arrayDatos.push(['Segundos', 'Presión de Entrada', 'Presión de Salida']);
              <c:forEach var="registro" items="${datos}">
                arrayDatos.push(['${segundos}' , ${registro.Presion_Entrada}, ${registro.Presion_Salida}]);
                segundos = segundos + 60;
              </c:forEach>
                  
              if(arrayDatos.length === 1) {
                  arrayDatos.push(['0', 0, 0]);
              }
              var data = google.visualization.arrayToDataTable(arrayDatos);
              var options = {
                title: 'Datos de Presión',
                curveType: 'function',
                legend: { position: 'bottom' }
              };

              var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

              chart.draw(data, options);
            }
    </script>
    </head>
    <body>
        <div class="container mt-4">
            
            <div class="row">
                <div id="div_datos1" class="col-sm">
                    <label>Presión máxima</label>
                    <h1>${ultimo_dato.Presion_Maxima}</h1>
                    
                    <label>Presión mínima</label>
                    <h1>${ultimo_dato.Presion_Minima}</h1>
                    
                    <label>Volumen de Gás</label>
                    <h1>${ultimo_dato.Gas}</h1>
                    
                    <label>Frecuencia de aporte</label>
                    <h1>${ultimo_dato.Frecuencia}</h1>
                    
                    <label>%O2 en mezcla</label>
                    <h1>${ultimo_dato.Mezcla}</h1>
                </div>
                <div id="div_datos2" class="col-sm">
                    <label>Humedad de aire</label>
                    <h1>${ultimo_dato.Humedad}</h1>
                    
                    <label>Temperatura de entrada</label>
                    <h1>${ultimo_dato.Temperatura_Entrada}</h1>
                    
                    <label>Temperatura de salida</label>
                    <h1>${ultimo_dato.Temperatura_Salida}</h1>
                    
                    <label>Presión de entrada</label>
                    <h1>${ultimo_dato.Presion_Entrada}</h1>
                    
                    <label>Presión de salida</label>
                    <h1>${ultimo_dato.Presion_Salida}</h1>

                </div>
                <div class="col-sm">
                    <a href="registrosVeMec.htm?id=${ultimo_dato.Id_Vemec}" class="btn btn-secondary">
                        <i class="fas fa-database"></i> 
                        Todos los registros
                    </a>
                </div>
            </div>
            <div id="curve_chart" style="width: 900px;"></div>
            
        </div>
    </body>
</html>
