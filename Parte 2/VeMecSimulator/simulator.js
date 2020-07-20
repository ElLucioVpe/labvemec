const io = require("socket.io-client");
const axios = require("axios").default;
const socket = io("http://localhost:4000");

class VeMec {
  constructor(_id, _marca, _modelo, _ubicacion, _running, _socket, _idSlave) {
    this.id = _id;
    this.idSlave = _idSlave;
    this.marca = _marca;
    this.modelo = _modelo;
    this.ubicacion = _ubicacion;
    this.running = _running;
    this.socket = _socket;
  }

  async checking() {
    let data;
    let segs = 0;
    return new Promise(async () => {
      let _this = this;
      let sendTimer = setInterval(function () {
        let RandomPresMax = _this.randomIntFromInterval(130, 139); //?
        let RandomPresMin = _this.randomIntFromInterval(80, 84); //?
        let RandomGas = _this.randomIntFromInterval(380, 760);
        let RandomFrecuencia = _this.randomIntFromInterval(12, 16);
        let RandomMezcla = _this.randomIntFromInterval(40, 100);
        let RandomHumedad = _this.randomIntFromInterval(80, 100);
        let RandomTemperatura_in = _this.randomIntFromInterval(35, 39);
        let RandomTemperatura_out = _this.randomIntFromInterval(30, 45);
        let RandomPresion_in = _this.randomIntFromInterval(10, 13); //Dudamos mas de este valor que de nostros mismos
        let RandomPresion_out = _this.randomIntFromInterval(8, 15); //Igual en este
        let RandomConectadoACorriente = _this.randomIntFromInterval(0,1);
        let RandomEnergia = _this.randomIntFromInterval(0,100);
        let RandomPulsaciones = _this.randomIntFromInterval(60,100);
        let today = new Date();
        let date =
          today.getFullYear() +
          "-" +
          (today.getMonth() < 10 ? "0" + today.getMonth() : today.getMonth()) +
          "-" +
          today.getDate();
        let time =
          today.getHours() +
          ":" +
          (today.getMinutes() < 10
            ? "0" + today.getMinutes()
            : today.getMinutes()) +
          ":" +
          today.getSeconds();

        if(_this.randomIntFromInterval(0,20) === 20) {
          RandomPulsaciones = _this.randomIntFromInterval(110, 150);
        } else if (_this.randomIntFromInterval(0, 20) === 20) {
          RandomPulsaciones = _this.randomIntFromInterval(30, 50);
        }
        
        if(RandomConectadoACorriente && RandomEnergia < 100) {
          if(_this.randomIntFromInterval(0,2) === 2) {
             RandomEnergia++;
          }
        }

        let data = new VeMecData(
          _this.id,
          _this.idSlave,
          RandomPresMax,
          RandomPresMin,
          RandomGas,
          RandomFrecuencia,
          RandomMezcla,
          RandomHumedad,
          RandomTemperatura_in,
          RandomTemperatura_out,
          RandomPresion_in,
          RandomPresion_out,
          RandomEnergia,
          RandomPulsaciones,
          RandomConectadoACorriente,
          date + "T" + time + "Z[UTC]"
        );
        
        socket.emit("envio_datosVeMec", JSON.stringify(data.getData()));
        console.log(
          "> Esto es el ventilador " + _this.id + "ts" + data.time_Stamp
        );
      }, 1000);
    });
    //sleep(1000);
  }

  send(data) {
    socket.emit("envio_datosVeMec", JSON.stringify(data));
  }

  randomIntFromInterval(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min);
  }
}

class VeMecData {
  constructor(
    _id_Vemec,
    _id_Slave,
    _presion_max,
    _presion_min,
    _gas,
    _frecuencia,
    _mezcla,
    _humedad,
    _temperatura_in,
    _temperatura_out,
    _presion_in,
    _presion_out,
    _energia,
    _pulsaciones,
    _conectado,
    _time_Stamp
  ) {
    this.id_Vemec = _id_Vemec;
    this.id_Slave = _id_Slave;
    this.presion_max = _presion_max;
    this.presion_min = _presion_min;
    this.gas = _gas;
    this.frecuencia = _frecuencia;
    this.mezcla = _mezcla;
    this.humedad = _humedad;
    this.temperatura_in = _temperatura_in;
    this.temperatura_out = _temperatura_out;
    this.presion_in = _presion_in;
    this.presion_out = _presion_out;
    this.energia = _energia;
    this.pulsaciones = _pulsaciones;
    this.conectado = _conectado;
    this.time_Stamp = _time_Stamp;
  }

  getData() {
    let data = {};
    data["Id"] = this.id_Vemec;
    data["Presion_Maxima"] = this.presion_max;
    data["Presion_Minima"] = this.presion_min;
    data["Gas"] = this.gas;
    data["Frecuencia"] = this.frecuencia;
    data["Mezcla"] = this.mezcla;
    data["Humedad"] = this.humedad;
    data["Temperatura_Entrada"] = this.temperatura_in;
    data["Temperatura_Salida"] = this.temperatura_out;
    data["Presion_Entrada"] = this.presion_in;
    data["Presion_Salida"] = this.presion_out;
    data["Timestamp_Data"] = this.time_Stamp;
    
    return data;
  }

  getJSON() {
    let data = {};
    data["presionMaxima"] = this.presion_max.toFixed(1);
    data["presionMinima"] = parseFloat(this.presion_min.toFixed(1));
    data["gas"] = parseFloat(this.gas).toFixed(1);
    data["frecuencia"] = parseFloat(this.frecuencia).toFixed(1);
    data["mezcla"] = parseFloat(this.mezcla).toFixed(1);
    data["humedad"] = parseFloat(this.humedad).toFixed(1);
    data["temperaturaEntrada"] = parseFloat(this.temperatura_in).toFixed(1);
    data["temperaturaSalida"] = parseFloat(this.temperatura_out).toFixed(1);
    data["presionEntrada"] = parseFloat(this.presion_in).toFixed(1);
    data["presionSalida"] = parseFloat(this.presion_out).toFixed(1);
    data["timestampData"] = this.time_Stamp;
    data["vemecsDataPK"] = {
      idData: 0,
      idVemec: this.id_Vemec,
    };

    return data;
  }
}

let vemecsData;

async function getDatos() {
  await axios.get('http://localhost:8080/RESTapi/webresources/entities.vemecs').then(
    function (response) {
      vemecsData = response.data;
    }
  )
  console.log("> VeMecs recibidos");
}

let vemecs = [];

async function instanciarVemecs() {
  vemecsData.forEach(function (vemec) {
    vemecs.push(new VeMec(vemec.id, vemec.idSlave, vemec.marca, vemec.modelo, vemec.ubicacion, true, socket));
    console.log(vemec.id);
  })
}

async function runVemecs() {
  vemecs.forEach(async function(vemec) {
    await vemec.checking();
  });
  console.log("> Esperando a lanzar VeMecs");
}

async function run() {
  await getDatos();
  await instanciarVemecs();
  await runVemecs();
  await console.log(vemecs);
}

run()
