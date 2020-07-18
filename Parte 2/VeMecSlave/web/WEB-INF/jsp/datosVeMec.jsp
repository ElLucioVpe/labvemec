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
             console.log("recibiendo datos de vemec...");
            var arrayVemecsDatos2[];
            console.log("recibiendo datos de vemec...");
           
            //var segundosAUX = segundos;
            const socket = io('http://localhost:4000');
            socket.on('datosVeMec1', (res) => {
                console.log("recibiendo datos de vemec...");
                var json = res;
                
                
                //Comparando si Es nuevo vemec o lo tenemos y sumandolo a su array promedidado
                //
                //Vemec Ya existe
                if(arrayVemecsDatos2[json.Id] != null){
                     //Vamos promediando en array bidimensional
                    arrayVemecsDatos2[json.id][0] = (arrayVemecsDatos2[json.id][0] + json.Presion_Maxima / 2);
                    arrayVemecsDatos2[json.id][1] = (arrayVemecsDatos2[json.id][1] + json.Presion_Minima / 2);
                    arrayVemecsDatos2[json.id][2] = (arrayVemecsDatos2[json.id][2] + json.Gas / 2);
                    arrayVemecsDatos2[json.id][3] = (arrayVemecsDatos2[json.id][3] + json.Frecuencia / 2);
                    arrayVemecsDatos2[json.id][4] = (arrayVemecsDatos2[json.id][4] + json.Mezcla / 2);
                    arrayVemecsDatos2[json.id][5] = (arrayVemecsDatos2[json.id][5] + json.Humedad / 2);
                    arrayVemecsDatos2[json.id][6] = (arrayVemecsDatos2[json.id][6] + json.Temperatura_Entrada / 2);
                    arrayVemecsDatos2[json.id][7] = (arrayVemecsDatos2[json.id][7] + json.Temperatura_Salida / 2);
                    arrayVemecsDatos2[json.id][8] = (arrayVemecsDatos2[json.id][8] + json.Presion_Entrada / 2);
                    arrayVemecsDatos2[json.id][9] = (arrayVemecsDatos2[json.id][9] + json.Presion_Salida / 2);
                    arrayVemecsDatos2[json.id][10] = (arrayVemecsDatos2[json.id][10] + json.Energia / 2);
                    arrayVemecsDatos2[json.id][11] = (arrayVemecsDatos2[json.id][11] + json.Pulsaciones / 2);
                    //Agregamos al body la section del nuevo array
                    
                document.getElementById('p_mx${json.Id}').innerHTML = json.Presion_Maxima + "mmHg";
                document.getElementById('p_mn${json.Id}').innerHTML = json.Presion_Minima + "mmHg";
                document.getElementById('gas${json.Id}').innerHTML = json.Gas + "cc";
                document.getElementById('frec${json.Id}').innerHTML = json.Frecuencia + "/min";
                document.getElementById('mez${json.Id}').innerHTML = json.Mezcla + "%";
                document.getElementById('hum${json.Id}').innerHTML = json.Humedad + "%";
                document.getElementById('t_in${json.Id}').innerHTML = json.Temperatura_Entrada + "ºC";
                document.getElementById('t_out${json.Id}').innerHTML = json.Temperatura_Salida + "ºC";
                document.getElementById('p_in${json.Id}').innerHTML = json.Presion_Entrada + "mmHg";
                document.getElementById('p_out${json.Id}').innerHTML = json.Presion_Salida + "mmHg";
                
                document.getElementById('p_out${json.Id}').innerHTML = json.Energia + "mmHg";
                document.getElementById('p_out${json.Id}').innerHTML = json.Pulsaciones + "mmHg";
                document.getElementById('p_out${json.Id}').innerHTML = json.Conectado + "mmHg";
                    
                    
                    
                //Nuevo Vemec
                }else{
                    //agregamos datos nuevos a su array bidimensional promediado
                    arrayVemecsDatos2.push({json.Id:
                    [
                        json.Presion_Maxima,
                        json.Presion_Minima,
                        json.Gas, 
                        json.Frecuencia,
                        json.Mezcla,
                        json.Humedad,
                        json.Temperatura_Entrada,
                        json.Temperatura_Salida,
                        json.Presion_Entrada,
                        json.Presion_Salida,
                        json.Energia,
                        json.Pulsaciones,
                        json.Conectado
                    ]
                    }); 
                    //Creamos la nueva seccion para el nuevo vemec
                      document.getElementById("container-datos").innerHTML+= `
            <div id = "vemec-container">
            <div class="row">
                <div id="div_datos1" class="col-sm">
                    <div class="card">
                        <form class="form-inline">
                            <label>Presión máxima &nbsp</label>
                            <h1 id="p_mx${json.Id}">${json.Presion_Maxima}mmHg</h1>
                        </form>
                    </div>
                    
                    <div class="card">
                        <form class="form-inline">
                            <label>Presión mínima &nbsp</label>
                            <h1 id="p_mn${json.Id}">${json.Presion_Minima}mmHg</h1>
                        </form>
                    </div>
                    
                    <div class="card">
                        <form class="form-inline">
                            <label>Volumen de Gás &nbsp</label>
                            <h1 id="gas${json.Id}">${json.Gas}cc</h1>
                        </form>
                    </div>
                    
                    <div class="card">
                        <form class="form-inline">
                            <label>Frecuencia de aporte &nbsp</label>
                            <h1 id="frec${json.Id}">${json.Frecuencia}/min</h1>
                        </form>
                    </div>
                        
                    <div class="card">
                        <form class="form-inline">
                            <label>%O2 en mezcla &nbsp</label>
                            <h1 id="mez${json.Id}">${json.Mezcla}%</h1>
                        </form>
                    </div>
                </div>
                <div id="div_datos2" class="col-sm">
                    <div class="card">
                        <form class="form-inline">
                            <label>Humedad de aire &nbsp</label>
                            <h1 id="hum${json.Id}">${json.Humedad}%</h1>
                        </form>
                    </div>
                        
                    <div class="card">
                        <form class="form-inline">
                            <label>Temperatura de entrada &nbsp</label>
                            <h1 id="t_in${json.Id}">${json.Temperatura_Entrada}ºC</h1>
                        </form>
                    </div>
                        
                    <div class="card">
                        <form class="form-inline">
                            <label>Temperatura de salida &nbsp</label>
                            <h1 id="t_out${json.Id}">${json.Temperatura_Salida}ºC</h1>
                        </form>
                    </div>
                        
                    <div class="card">   
                        <form class="form-inline">
                            <label>Presión de entrada &nbsp</label>
                            <h1 id="p_in${json.Id}">${json.Presion_Entrada}mmHg</h1>
                        </form>
                    </div>
                        
                    <div class="card">
                        <form class="form-inline">
                            <label>Presión de salida &nbsp</label>
                            <h1 id="p_out${json.Id}">${json.Presion_Salida}mmHg</h1>
                        </form>
                    </div>
                   
                </div>
            </div>
                        <br>
            <div class="row">
                <div class="col-sm">
                    <div class="card">
                        <div id="div-PSchart${json.Id}" style="width: 900px;"></div>
                        <div id="div-PEchart${json.Id}" style="width: 900px;"></div>
                    </div>
                </div>
                <div class="col-sm"></div>
            </div>  
          </div>
             `;
    
             var chartPE = new CanvasJS.Chart("div-PEchart"+json.Id, {
                 title :{text: "Presión de entrada"},
                 axisY: {includeZero: false},      
                 data: [{ type: "line", dataPoints: datosPE}]
             });
             var chartPS = new CanvasJS.Chart("div-PSchart"+json.Id, {
                 title :{text: "Presión de salida"},
                 axisY: {includeZero: false},      
                 data: [{ type: "line", dataPoints: datosPS, color: "red"}]
             });

             //Evita se sature la grafica, solo 20 puntos visibles
             if (datosPE.length > 20) datosPE.shift();
             if (datosPS.length > 20) datosPS.shift();
             chartPE.render();
             chartPS.render();
                    
                }
              
                //document.getElementById('p_id').innerHTML = json.Id;
                console.log("agregando datos a la grafica...");
            
                var chartPE = $("#div-PEchart"+json.Id).CanvasJS();
                var chartPS = $("#div-PSchart"+json.Id).CanvasJS();

                chartPE.options.data[0].dataPoints.push({
                    x: new Date(),
                    y: parseFloat(json.Presion_Entrada)
                });
                chartPS.options.data[0].dataPoints.push({
                    x: new Date(),
                    y: parseFloat(json.Presion_Salida)
                });
                if(chartPE.options.data[0].dataPoints.length > 20) chartPE.options.data[0].dataPoints.shift();
                if(chartPS.options.data[0].dataPoints.length > 20) chartPS.options.data[0].dataPoints.shift();
                
                
                
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
        <div id="container-datos" class="container mt-4">
                
        </div>
        
          <div class="col-sm">
                    <a href="index.htm" class="btn btn-secondary" style="color: #15bef1">
                        <i class="fas fa-chevron-left"></i> 
                        Regresar
                    </a>
          </div>

    </body>
</html>
