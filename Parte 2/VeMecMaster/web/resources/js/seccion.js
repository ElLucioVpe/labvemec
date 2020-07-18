/* 
 * Javascript
 * de Seccion
 */

$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
});

function actualizarDatos(json) {
    console.log("recibiendo datos de vemec...");

    document.getElementById('Pmax'+json.Id_Vemec).innerHTML = json.Presion_Maxima;
    document.getElementById('Pmin'+json.Id_Vemec).innerHTML = json.Presion_Minima;
    document.getElementById('Gas'+json.Id_Vemec).innerHTML = json.Gas;
    document.getElementById('Fr'+json.Id_Vemec).innerHTML = json.Frecuencia;
    document.getElementById('O2'+json.Id_Vemec).innerHTML = json.Mezcla+"%";
    document.getElementById('Hum'+json.Id_Vemec).innerHTML = json.Humedad+"%";
    document.getElementById('TE'+json.Id_Vemec).innerHTML = json.Temperatura_Entrada;
    document.getElementById('TS'+json.Id_Vemec).innerHTML = json.Temperatura_Salida;
    document.getElementById('PE'+json.Id_Vemec).innerHTML = json.Presion_Entrada;
    document.getElementById('PS'+json.Id_Vemec).innerHTML = json.Presion_Salida;
    document.getElementById('Pulso'+json.Id_Vemec).innerHTML = json.Pulsaciones;

    if(json.Conectado_Corriente === "true")
        document.getElementById('p_out').innerHTML = 'Conectado a corriente <i class="fas fa-plug" aria-hidden="true"></i>';
    else document.getElementById('p_out').innerHTML = json.Energia+'%<i class="fa fa-bolt" aria-hidden="true"></i>';

    console.log("agregando datos a la grafica...");
    var chartPE = $("#div-PEchart"+json.Id_Vemec).CanvasJS();
    var chartPS = $("#div-PSchart"+json.Id_Vemec).CanvasJS();

    chartPE.options.data[0].dataPoints.push({
        x: new Date(json.Timestamp_Data),
        y: parseFloat(json.Presion_Entrada)
    });
    chartPS.options.data[0].dataPoints.push({
        x: new Date(json.Timestamp_Data),
        y: parseFloat(json.Presion_Salida)
    });
    if(chartPE.options.data[0].dataPoints.length > 20) chartPE.options.data[0].dataPoints.shift();
    if(chartPS.options.data[0].dataPoints.length > 20) chartPS.options.data[0].dataPoints.shift();

    chartPE.render();
    chartPS.render();

    if(json.alerta === "activarAlerta") modoAlerta(true, "alerta", json.Id_Vemec);
    if(json.alerta === "activarBajaBateria") modoAlerta(true, "energia", json.Id_Vemec);
    if(json.alerta === "desactivarAlerta") modoAlerta(false, "alerta", json.Id_Vemec);
    if(json.alerta === "desactivarBajaBateria") modoAlerta(false, "energia", json.Id_Vemec);
}

function cargarDatosGraficas(idVeMec, registros) {
    var datosPE = [];
    var datosPS = [];
    
    if(registros !== undefined && registros.length > 0) {
        registros.forEach(item => {
           datosPE.push({
               x: new Date(item.timestampData),
               y: parseFloat(item.presionEntrada)
           });
           datosPS.push({
               x: new Date(item.timestampData),
               y: parseFloat(item.presionSalida)
           });
        });
    }
    
    var chartPE = new CanvasJS.Chart("div-PEchart"+idVeMec, {
        title :{text: "Presión de entrada"},
        axisY: {includeZero: false},      
        data: [{ type: "line", dataPoints: datosPE}]
    });
    var chartPS = new CanvasJS.Chart("div-PSchart"+idVeMec, {
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

function modoAlerta(activar, tipo, idVeMec) {
    var element = document.getElementById("vemec-card"+idVeMec);
    var audioPlayer = document.getElementById("audio-alerta");
    var clase ="";
    var audio = "";
    var count_div = "";

    if(tipo === "alerta") {
        clase = "alert-mode";
        audio += "alert1.mp3";
        count_div = "alert-count";
    }
    if(tipo === "energia") {
        clase = "lowEnergy-mode";
        audio += "alert2.mp3";
        count_div = "energy-alert-count";
    }

    if(activar) {
        element.classList.add(clase);
        audioPlayer.setAttribute('src', element.src + audio);
        document.getElementById(count_div).innerHTML = parseInt(document.getElementById(count_div).innerHTML)+1;
    } else {
        element.classList.remove(clase);
        audioPlayer.setAttribute('src', "");
        document.getElementById(count_div).innerHTML = parseInt(document.getElementById(count_div).innerHTML)-1;
    }
}