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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ultimos datos del VeMec</title>
        
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.js"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"> </script>
        <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
        <script language="javascript" type = "text/javascript">
            $(document).ready(function(){
                $('[data-toggle="tooltip"]').tooltip();
            });
            //Grafica de presión
            let arrayVemecsDatos2 = [];
            var chart2=[];
            var chart=[];
            var canvasesPE = [];
            var canvasesPS = [];
            const tiempo = parseFloat(location.search.split('tiempo=')[1].split("&")[0]) * 60; // Obtiene el intervalo de tiempo desde GET
            const id = location.search.split('id=')[1].split("&")[0];
            const intervaloEmergencia = parseFloat(location.search.split('intervaloEmergencia=')[1].split("&")[0]);

        //var segundosAUX = segundos;
          console.log("recibiendo datos de vemec..." +id);
            const socket = io('http://localhost:4000');
            socket.on('datosVeMec'+id, (res) => {
                console.log("recibiendo datos de vemec..."+id);
                var json = res;
            
                if(arrayVemecsDatos2[json.Id] != null){
                    //Vamos promediando en array bidimensional
                    arrayVemecsDatos2[json.Id]["Id_Vemec"] = json.Id;
                    arrayVemecsDatos2[json.Id]["idSlave"] = id;
                    arrayVemecsDatos2[json.Id]["Presion_Maxima"] = Math.round(((arrayVemecsDatos2[json.Id]["Presion_Maxima"] + json.Presion_Maxima) / 2) * 1e2 )/1e2;
                    arrayVemecsDatos2[json.Id]["Presion_Minima"] =  Math.round(((arrayVemecsDatos2[json.Id]["Presion_Minima"] + json.Presion_Minima) / 2)* 1e2 )/1e2;
                    arrayVemecsDatos2[json.Id]["Gas"] =  Math.round(((arrayVemecsDatos2[json.Id]["Gas"] + json.Gas) / 2)* 1e2 )/1e2;
                    arrayVemecsDatos2[json.Id]["Frecuencia"] =  Math.round(((arrayVemecsDatos2[json.Id]["Frecuencia"] + json.Frecuencia) / 2)* 1e2 )/1e2;
                    arrayVemecsDatos2[json.Id]["Mezcla"] =  Math.round(((arrayVemecsDatos2[json.Id]["Mezcla"] + json.Mezcla) / 2)* 1e2 )/1e2;
                    arrayVemecsDatos2[json.Id]["Humedad"] =  Math.round(((arrayVemecsDatos2[json.Id]["Humedad"] + json.Humedad) / 2)* 1e2 )/1e2;
                    arrayVemecsDatos2[json.Id]["Temperatura_Entrada"] =  Math.round(((arrayVemecsDatos2[json.Id]["Temperatura_Entrada"] + json.Temperatura_Entrada) / 2)* 1e2 )/1e2;
                    arrayVemecsDatos2[json.Id]["Temperatura_Salida"] =  Math.round(((arrayVemecsDatos2[json.Id]["Temperatura_Salida"] + json.Temperatura_Salida) / 2)* 1e2 )/1e2;
                    arrayVemecsDatos2[json.Id]["Presion_Entrada"] =  Math.round(((arrayVemecsDatos2[json.Id]["Presion_Entrada"] + json.Presion_Entrada) / 2)* 1e2 )/1e2;
                    arrayVemecsDatos2[json.Id]["Presion_Salida"] =  Math.round(((arrayVemecsDatos2[json.Id]["Presion_Salida"] + json.Presion_Salida) / 2)* 1e2 )/1e2;
                    arrayVemecsDatos2[json.Id]["Pulsaciones"] =  Math.round(((arrayVemecsDatos2[json.Id]["Pulsaciones"] + json.Pulsaciones) / 2)* 1e2 )/1e2;
                    arrayVemecsDatos2[json.Id]["Conectado_Corriente"] =  json.Conectado_Corriente;
                    arrayVemecsDatos2[json.Id]["Energia"] =  json.Energia;
                    arrayVemecsDatos2[json.Id]["Timestamp_Data"] = new Date().toLocaleString();
                
                    //Agregamos al body la section del nuevo array
                    document.getElementById('Pmax'+json.Id).innerHTML = json.Presion_Maxima;
                    document.getElementById('Pmin'+json.Id).innerHTML = json.Presion_Minima;
                    document.getElementById('Gas'+json.Id).innerHTML = json.Gas;
                    document.getElementById('Fr'+json.Id).innerHTML = json.Frecuencia;
                    document.getElementById('O2'+json.Id).innerHTML = json.Mezcla + "%";
                    document.getElementById('Hum'+json.Id).innerHTML = json.Humedad + "%";
                    document.getElementById('TE'+json.Id).innerHTML = json.Temperatura_Entrada;
                    document.getElementById('TS'+json.Id).innerHTML = json.Temperatura_Salida;
                    document.getElementById('PE'+json.Id).innerHTML = json.Presion_Entrada;
                    document.getElementById('PS'+json.Id).innerHTML = json.Presion_Salida;
                    document.getElementById('Pulso'+json.Id).innerHTML = json.Pulsaciones;
                    if(json.Conectado_Corriente === 1)
                        document.getElementById('energia'+json.Id).innerHTML = 'Conectado a corriente <i class="fas fa-plug" aria-hidden="true"></i>';
                    else 
                        document.getElementById('energia'+json.Id).innerHTML = json.Energia+'%<i class="fas fa-bolt" aria-hidden="true"></i>';
                    
                    //Alertas
                    if(json.Energia < 20 && json.Conectado_Corriente === 0) arrayVemecsDatos2[json.Id]["alerta"] = "activarBajaBateria";
                    else arrayVemecsDatos2[json.Id]["alerta"] = "desactivarBajaBateria";
                    if(json.Pulsaciones < 60 || json.Pulsaciones > 110 || json.Presion_Salida > 50)  arrayVemecsDatos2[json.Id]["alerta"] = "activarAlerta";
                    else arrayVemecsDatos2[json.Id]["alerta"] = "desactivarAlerta";

                    if(arrayVemecsDatos2[json.Id]["alerta"].startsWith("activar")) {
                        clearInterval(arrayVemecsDatos2[json.Id]["Intervalo"]);
                    	arrayVemecsDatos2[json.Id]["Intervalo"] = setInterval(function () { enviarDatosADB(arrayVemecsDatos2[json.Id]); }, intervaloEmergencia);
                    }
                   
                //Nuevo Vemec
                }else{
                    //agregamos datos nuevos a su array bidimensional promediado
                    arrayVemecsDatos2[json.Id]={};
                    arrayVemecsDatos2[json.Id]["Id_Vemec"] = json.Id;
                    arrayVemecsDatos2[json.Id]["idSlave"] = id;
                    arrayVemecsDatos2[json.Id]["Presion_Maxima"] = json.Presion_Maxima;
                    arrayVemecsDatos2[json.Id]["Presion_Minima"] =  json.Presion_Minima;
                    arrayVemecsDatos2[json.Id]["Gas"] = json.Gas;
                    arrayVemecsDatos2[json.Id]["Frecuencia"] =  json.Frecuencia;
                    arrayVemecsDatos2[json.Id]["Mezcla"] = json.Mezcla;
                    arrayVemecsDatos2[json.Id]["Humedad"] = json.Humedad;
                    arrayVemecsDatos2[json.Id]["Temperatura_Entrada"] =  json.Temperatura_Entrada;
                    arrayVemecsDatos2[json.Id]["Temperatura_Salida"] = json.Temperatura_Salida;
                    arrayVemecsDatos2[json.Id]["Presion_Entrada"] =  json.Presion_Entrada;
                    arrayVemecsDatos2[json.Id]["Presion_Salida"] = json.Presion_Salida;
                    arrayVemecsDatos2[json.Id]["Pulsaciones"] = json.Presion_Entrada;
                    arrayVemecsDatos2[json.Id]["Conectado_Corriente"] =  json.Conectado_Corriente;
                    arrayVemecsDatos2[json.Id]["Energia"] =  json.Energia;
                    arrayVemecsDatos2[json.Id]["Timestamp_Data"] = new Date().toLocaleString();
                    
                    
		    arrayVemecsDatos2[json.Id]["Intervalo"] = setInterval(function () { enviarDatosADB(arrayVemecsDatos2[json.Id]) }, tiempo); // Cada cierto tiempo envia los datos a la DB
                  
                    //Creamos la nueva seccion para el nuevo vemec
                    CreatingWorld(json);     
                }
              
               //Chart P Entrada
              if (chart[json.Id].data.datasets[0].data.length > 10)
                {
                    chart[json.Id].data.datasets[0].data.shift();
                    chart[json.Id].data.datasets[0].borderColor.shift();
                    chart[json.Id].data.labels.shift();
                }
                chart[json.Id].data.datasets[0].data.push(json.Presion_Entrada);
                chart[json.Id].data.labels.push('hi');
                chart[json.Id].update();
                
                
                //Chart P Salida
                if (chart2[json.Id].data.datasets[0].data.length > 10)
                {
                    chart2[json.Id].data.datasets[0].data.shift();
                    chart2[json.Id].data.datasets[0].borderColor.shift();
                    chart2[json.Id].data.labels.shift();
                }
                chart2[json.Id].data.datasets[0].data.push(json.Presion_Salida);
                chart2[json.Id].data.labels.push('hi');
                chart2[json.Id].update();
                
            }); 
            
            
            
            function CreatingWorld(json){
                inicializarDatos(json);
                inicializarCanvas(json.Id);
            }
                
        function inicializarDatos(json){
            var contenidoRico = '<div class="col-xl-4 vemec-col">'+
              '<div id="vemec-card'+json.Id+'" class="card shadow mb-4 vemec-card">'+
                '<div class="card-header py-3 d-flex flex-row justify-content-between">'+
                    '<h6 id="energia'+json.Id+'" class="m-0 font-weight-bold text-dark pull-right">';
            if(json.Conectado_Corriente === 1) 
                contenidoRico += 'Conectado a corriente <i class="fas fa-plug" aria-hidden="true"></i></h6>';
            else contenidoRico += json.Energia+'%<i class="fa fa-bolt" aria-hidden="true"></i></h6>';
               
            contenidoRico+= '</div>'+
                '<div class="card-body row">'+
                    '<div class="col">'+
                      '<div id="div-PEchart'+json.Id+'" class="vemec-chart">'+
                      '</div>'+
                      '<div id="div-PSchart'+json.Id+'" class="vemec-chart">'+
                      '</div>'+
                    '</div>'+
                    '<div id="datos-vemec" class="col">'+
                        '<div class="row">'+
                            '<div class="form-inline mx-1" data-toggle="tooltip" title="Presión Maxima (mmHg)">'+
                              '<small class="font-weight-bold">Pmax</small>'+
                              '<h5 class="font-weight-bold">'+
                                  '<strong id="Pmax'+json.Id+'">json.Presion_Maxima</strong>'+
                              '</h5>'+
                            '</div>'+
                            '<div class="form-inline mx-1" data-toggle="tooltip" title="Presión Mínima (mmHg)">'+
                              '<small class="font-weight-bold">Pmin</small>'+
                              '<h5 class="font-weight-bold">'+
                                  '<strong id="Pmin'+json.Id+'">json.Presion_Minima</strong>'+
                              '</h5>'+
                            '</div>'+
                        '</div>'+
                        '<div class="row">'+
                            '<div class="form-inline mx-1" data-toggle="tooltip" title="Composición de mezcla en porcentaje de O2">'+
                              '<small class="font-weight-bold">O2</small>'+
                              '<h5 class="font-weight-bold">'+
                                  '<strong id="O2'+json.Id+'">json.Mezcla%</strong>'+
                              '</h5>'+
                            '</div>'+
                            '<div class="form-inline mx-1" data-toggle="tooltip" title="Gas (cc)">'+
                              '<small class="font-weight-bold">Gas</small>'+
                              '<h5 class="font-weight-bold">'+
                                  '<strong id="Gas'+json.Id+'">json.Gas</strong>'+
                              '</h5>'+
                            '</div>'+
                        '</div>'+
                        '<div class="row">'+
                            '<div class="form-inline mx-1" data-toggle="tooltip" title="Humedad del aire">'+
                              '<small class="font-weight-bold">Hum</small>'+
                              '<h5 class="font-weight-bold">'+
                                  '<strong id="Hum'+json.Id+'">json.Humedad%</strong>'+
                              '</h5>'+
                            '</div>'+
                            '<div class="form-inline mx-1" data-toggle="tooltip" title="Frecuencia de aporte (/min)">'+
                              '<small class="font-weight-bold">Fr</small>'+
                              '<h5 class="font-weight-bold">'+
                                  '<strong id="Fr'+json.Id+'">json.Frecuencia</strong>'+
                              '</h5>'+
                            '</div>'+
                        '</div>'+
                        '<div class="row">'+
                            '<div class="form-inline mx-1" data-toggle="tooltip" title="Temperatura de entrada (ºC)">'+
                              '<small class="font-weight-bold">TE</small>'+
                              '<h5 class="font-weight-bold">'+
                                  '<strong id="TE'+json.Id+'">json.Temperatura_Entrada</strong>'+
                              '</h5>'+
                            '</div>'+
                            '<div class="form-inline mx-1" data-toggle="tooltip" title="Temperatura de salida (ºC)">'+
                              '<small class="font-weight-bold">TS</small>'+
                              '<h5 class="font-weight-bold">'+
                                  '<strong id="TS'+json.Id+'">json.Temperatura_Salida</strong>'+
                              '</h5>'+
                            '</div>'+
                        '</div>'+
                        '<div class="row">'+
                            '<div class="form-inline mx-1" data-toggle="tooltip" title="Presion de entrada (mmHg)">'+
                              '<small class="font-weight-bold">PE</small>'+
                              '<h5 class="font-weight-bold">'+
                                  '<strong id="PE'+json.Id+'">json.Presion_Entrada</strong>'+
                              '</h5>'+
                            '</div>'+
                            '<div class="form-inline mx-1" data-toggle="tooltip" title="Presion de salida (mmHg)">'+
                              '<small class="font-weight-bold">PS</small>'+
                              '<h5 class="font-weight-bold">'+
                                  '<strong id="PS'+json.Id+'">json.Presion_Salida</strong>'+
                              '</h5>'+
                            '</div>'+
                        '</div>'+
                        '<div class="row">'+
                            '<div class="form-inline mx-1 pull-left" data-toggle="tooltip" title="Pulsaciones">'+
                              '<h4 class="font-weight-bold">'+
                                  '<strong id="Pulso'+json.Id+'">'+json.Pulsaciones+'</strong>'+
                              '</h4>'+
                              '<h2>'+
                                  '<i class="fa fa-heartbeat" aria-hidden="true" style="color: salmon"></i>'+
                              '</h2>'+
                            '</div>'+
                        '</div>'+
                    '</div>'+
                '</div></div></div>';
            $('#container-datos').append(contenidoRico);
        }
        
        
        function inicializarCanvas(Id){                   
                    var canvas = document.createElement('canvas');
                    canvas.id = 'LayerPEchart' + Id;
                    canvas.className = 'c';
                    canvas.width = 190;
                    canvas.heigth = 116;
                    
                   
                    canvas.style.zIndex = Id;
                      
                    var canvas2 = document.createElement('canvas');
                    canvas2.id = 'LayerPSchart' + Id;
                    canvas2.className = 'c';
                    canvas2.width = 190;
                    canvas2.heigth = 116;
                    canvas2.style.zIndex = Id;
                    

                    document.getElementById('div-PEchart'+Id).appendChild(canvas);
                    document.getElementById('div-PSchart'+Id).appendChild(canvas2);
                    
                    
                    canvasesPE[Id] = canvas;
                    canvasesPS[Id] = canvas2; 
                    
                    canvasesPE[Id].ctx = canvas.getContext("2d");
                    canvasesPS[Id].ctx = canvas2.getContext("2d");
                    
        
                    pintarCanvas(Id);
        }
        
        
        function pintarCanvas(Id){     
                   chart[Id] = new Chart(canvasesPE[Id].ctx, {
                    type: 'line',
                    data: {
                        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
                        datasets: [{
                            label: 'Presión de Entrada',
                            data: [12, 19, 3, 5, 2, 3],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: false,
                        maintainAspectRatio: false,
                        legend:{display:false},
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }],
                          xAxes: [{
                                ticks: {
                                    display: false   
                                }
                            }]
                        
                        }
                    }
                });

                
               chart2[Id] = new Chart(canvasesPS[Id].ctx, {
                    type: 'line',
                    data: {
                        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
                        datasets: [{
                            label: 'Presión de Entrada',
                            data: [12, 19, 3, 5, 2, 3],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: false,
                        maintainAspectRatio: false,
                        legend:{display:false},
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }],
                          xAxes: [{
                                ticks: {
                                    display: false   
                                }
                            }]
                        
                        }
                    }
                });
               
                
        }
             
        function enviarDatosADB(datos) {
            var url = 'http://localhost:8080/RESTapi/webresources/entities.vemecsdata';
            var json = JSON.stringify(datos);
            //console.log("json:"+json);
            fetch(url, {
                method: 'POST',
                body: json,
                headers:{
                'Content-Type': 'application/json'
                }
            }).then(res => res.json())
            .catch(error => console.error('Error:', error))
            .then(response => console.log('Success:', response));
            socket.emit('datos_masterSlave', json);
            //console.log("json2");
        }
    </script>
    </head>
    
    <style>
        body {
            background-color: whitesmoke;
        }
        
        /*h1 {
            font-size: 50px;
            color: white;
        }*/
        
        label {
            font-weight: 600;
        }
        
        form {
            align-content: center;
        }
        
        .vemec-col {
            width: 33%;
        }

        .vemec-card {
            font-size: 15px;
            width: 100%;
            height: 330px;
        }

        .vemec-chart {
            width: 100%;
            height: 50%;
        }
        
        .w-90 {
            width: 90%;
        }
        
        @media screen and (max-width: 1000px) { 
            .vemec-col {
                width: 100%;
            }
            .vemec-col {
                height: 50%;
            }
        }
    </style>
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
                    <h1 class="h3 mb-0 mx-auto text-gray-800">Seccion</h1>
                  </div>
                  <div id="container-datos" class="row">
                      
                  </div>
                  <div id="G" class="Output row"></div> 
                </div>
              </div>  
            </div>
        </div>
    </body>
</html>
