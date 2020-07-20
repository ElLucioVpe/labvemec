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
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"> </script>
        <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
        <script language="javascript" type = "text/javascript">
            //Grafica de presión
            let arrayVemecsDatos2 = [];
            var charsVemecs = [];
            var charX;
            var charY;
            var canvasesPE = [];
            var canvasesPS = [];
       		const tiempo = location.search.split('tiempo=')[1].split("&")[0];; // Obtiene el intervalo de tiempo desde GET
                const id = location.search.split('id=')[1].split("&")[0];
       		const intervaloEmergencia = location.search.split('intervaloEmergencia=')[1].split("&")[0];;
       
        //var segundosAUX = segundos;
          console.log("recibiendo datos de vemec..." +id);
            const socket = io('http://localhost:4000');
            socket.on('datosVeMec'+id, (res) => {
                console.log("recibiendo datos de vemec..."+id);
                var json = res;
                
                
                //Comparando si Es nuevo vemec o lo tenemos y sumandolo a su array promedidado
                //
                //Vemec Ya existe
            
                if(arrayVemecsDatos2[json.Id] != null){
                    //Vamos promediando en array bidimensional
                    arrayVemecsDatos2[json.Id]["Id_Vemec"] = json.Id;
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
                    arrayVemecsDatos2[json.Id]["Pulsaciones"] =  Math.round(((arrayVemecsDatos2[json.Id]["Pulsaciones"] + json.Presion_Entrada) / 2)* 1e2 )/1e2;
                    arrayVemecsDatos2[json.Id]["Conectado_Corriente"] =  json.Conectado_Corriente;
                    arrayVemecsDatos2[json.Id]["Energia"] =  json.Energia;
                    arrayVemecsDatos2[json.Id]["Timestamp_Data"] = new Date().toLocaleString();
                
                    //Agregamos al body la section del nuevo array

                    document.getElementById('p_mx'+json.Id).innerHTML = json.Presion_Maxima + "mmHg";
                    document.getElementById('p_mn'+json.Id).innerHTML = json.Presion_Minima + "mmHg";
                    document.getElementById('gas'+json.Id).innerHTML = json.Gas + "cc";
                    document.getElementById('frec'+json.Id).innerHTML = json.Frecuencia + "/min";
                    document.getElementById('mez'+json.Id).innerHTML = json.Mezcla + "%";
                    document.getElementById('hum'+json.Id).innerHTML = json.Humedad + "%";
                    document.getElementById('t_in'+json.Id).innerHTML = json.Temperatura_Entrada + "ºC";
                    document.getElementById('t_out'+json.Id).innerHTML = json.Temperatura_Salida + "ºC";
                    document.getElementById('p_in'+json.Id).innerHTML = json.Presion_Entrada + "mmHg";
                    document.getElementById('p_out'+json.Id).innerHTML = json.Presion_Salida + "mmHg";
                    
                    //Alertas
                    if(json.Energia < 20) arrayVemecsDatos2[json.Id]["alerta"] = "activarBajaBateria";
                    else arrayVemecsDatos2[json.Id]["alerta"] = "desactivarBajaBateria";
                    if(json.Pulsaciones < 60 || json.Pulsaciones > 110 || json.Presion_Salida > 50)  arrayVemecsDatos2[json.Id]["alerta"] = "activarAlerta";
                    else arrayVemecsDatos2[json.Id]["alerta"] = "desactivarAlerta";
                    
                    if(arrayVemecsDatos2[json.Id][11].includes("activar")) {
                        clearInterval(arrayVemecsDatos2[json.Id][10]);
                    	arrayVemecsDatos2[json.Id]["Intervalo"] = setInterval(function () { enviarDatosADB(arrayVemecsDatos2[json.Id]); }, intervaloEmergencia);
                    }

                //Nuevo Vemec
                }else{
                    //agregamos datos nuevos a su array bidimensional promediado
                    arrayVemecsDatos2[json.Id]=[];
                    arrayVemecsDatos2[json.Id]["Id_Vemec"] = json.Id;
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
                      document.getElementById("container-datos").innerHTML+= `
                        <div id = "vemec-container">
                        <div class="row">
                            <div id="div_datos1" class="col-sm">
                                <div class="card">
                                    <form class="form-inline">
                                        <label>Presión máxima &nbsp</label>
                                        <h1 id="p_mx`+json.Id+`">`+json.Presion_Maxima+`mmHg</h1>
                                    </form>
                                </div>

                                <div class="card">
                                    <form class="form-inline">
                                        <label>Presión mínima &nbsp</label>
                                        <h1 id="p_mn`+json.Id+`">`+json.Presion_Minima+`mmHg</h1>
                                    </form>
                                </div>

                                <div class="card">
                                    <form class="form-inline">
                                        <label>Volumen de Gás &nbsp</label>
                                        <h1 id="gas`+json.Id+`">`+json.Gas+`cc</h1>
                                    </form>
                                </div>

                                <div class="card">
                                    <form class="form-inline">
                                        <label>Frecuencia de aporte &nbsp</label>
                                        <h1 id="frec`+json.Id+`">`+json.Frecuencia+`/min</h1>
                                    </form>
                                </div>

                                <div class="card">
                                    <form class="form-inline">
                                        <label>%O2 en mezcla &nbsp</label>
                                        <h1 id="mez`+json.Id+`">`+json.Mezcla+`%</h1>
                                    </form>
                                </div>
                            </div>
                            <div id="div_datos2" class="col-sm">
                                <div class="card">
                                    <form class="form-inline">
                                        <label>Humedad de aire &nbsp</label>
                                        <h1 id="hum`+json.Id+`">`+json.Humedad+`%</h1>
                                    </form>
                                </div>

                                <div class="card">
                                    <form class="form-inline">
                                        <label>Temperatura de entrada &nbsp</label>
                                        <h1 id="t_in`+json.Id+`">`+json.Temperatura_Entrada+`ºC</h1>
                                    </form>
                                </div>

                                <div class="card">
                                    <form class="form-inline">
                                        <label>Temperatura de salida &nbsp</label>
                                        <h1 id="t_out`+json.Id+`">`+json.Temperatura_Salida+`ºC</h1>
                                    </form>
                                </div>

                                <div class="card">   
                                    <form class="form-inline">
                                        <label>Presión de entrada &nbsp</label>
                                        <h1 id="p_in`+json.Id+`">`+json.Presion_Entrada+`mmHg</h1>
                                    </form>
                                </div>

                                <div class="card">
                                    <form class="form-inline">
                                        <label>Presión de salida &nbsp</label>
                                        <h1 id="p_out`+json.Id+`">`+json.Presion_Salida+`mmHg</h1>
                                    </form>
                                </div>

                            </div>
                        </div>
                                    <br>
                        <div class="row">
                            <div class="col-sm">
                                <div class="card">
                                    <div id="div-PSchart`+json.Id+`"></div>
                                </div>
                            </div>

                            <div class="col-sm">
                             <div id="div-PEchart`+json.Id+`"></div>
                           </div>
                        </div>  
                      </div>`;
    
                inicializarCanvas(json.Id);
             
                }
                console.log("CARAMELOSS");
                
                
            });     
             
             
            function enviarDatosADB(datos) {
		var url = 'http://localhost:8080/RESTapi/webresources/entities.vemecsdata';

                fetch(url, {
                  method: 'POST',
                  body: JSON.stringify(datos),
                  headers:{
                    'Content-Type': 'application/json'
                  }
                }).then(res => res.json())
                .catch(error => console.error('Error:', error))
                .then(response => console.log('Success:', response));
        
                socket.emit('datos_masterSlave'+id, JSON.stringify(data.getData()));
            } 
                    
                    
                    function inicializarCanvas(Id){                   
                    var canvas = document.createElement('canvas');
                    canvas.id = 'LayerPEchart' + Id;
                    canvas.className = 'c';
                    canvas.width = 400;
                    canvas.height = 400;
                    canvas.style.zIndex = Id;
                    
                    var canvas2 = document.createElement('canvas');
                    canvas.id = 'LayerPSchart' + Id;
                    canvas.className = 'c';
                    canvas.width = 400;
                    canvas.height = 400;
                    canvas.style.zIndex = Id;

                    document.getElementById('G').appendChild(canvas);
                    document.getElementById('G').appendChild(canvas2);
                    
                     canvasesPE[Id] = canvas;
                     canvasesPS[Id] = canvas2;
                     
                     canvasesPE[Id].ctx = canvas.getContext("2d");
                     canvasesPS[Id].ctx = canvas2.getContext("2d");
                     
                     
                     log.console(canvasesPE[Id].ctx);
                     log.console(canvasesPS[Id].ctx);
                     
        
                    matarme(Id);
                    }
                    
                 function matarme(Id){
                   
                  let chart = new Chart(canvasesPE[Id].ctx, {
                    type: 'line',
                    data: {
                        datasets: [{
                            label: 'First dataset',
                            data: [0, 20, 40, 50]
                        }],
                        labels: ['January', 'February', 'March', 'April']
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    suggestedMin: 50,
                                    suggestedMax: 100
                                }
                            }]
                        }
                    }
                });
                
                  let chart = new Chart(canvasesPS[Id].ctx, {
                    type: 'line',
                    data: {
                        datasets: [{
                            label: 'First dataset',
                            data: [0, 20, 40, 50]
                        }],
                        labels: ['January', 'February', 'March', 'April']
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    suggestedMin: 50,
                                    suggestedMax: 100
                                }
                            }]
                        }
                    }
                });
            }
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
        <div id="container-datos" class="container mt-4">
                
        </div>
            <div id="G" class="Output"></div> 
      

    </body>
</html>
