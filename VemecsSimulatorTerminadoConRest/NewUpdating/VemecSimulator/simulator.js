const io = require('socket.io-client');
const socket = io('http://localhost:4000');

class VeMec {
  constructor(_id, _marca, _modelo, _ubicacion, _running, _socket) {
    this.id = _id;
    this.marca = _marca;
    this.modelo = _modelo;
    this.ubicacion = _ubicacion;
    this.running = _running;
    this.socket = _socket;
  }

  async checking() {
    let data;
    let segs = 0;
    return new Promise(async (resolve, reject) => {
        let _this = this;
        let sendTimer = setInterval(function() {
            let RandomPresMax = _this.randomIntFromInterval(15,35);
            let RandomPresMin = _this.randomIntFromInterval(15,35);
            let RandomGas = _this.randomIntFromInterval(15,35);
            let RandomFrecuencia = _this.randomIntFromInterval(15,35);
            let RandomMezcla = _this.randomIntFromInterval(15,35);
            let RandomHumedad = _this.randomIntFromInterval(15,35);
            let RandomTemperatura_in = _this.randomIntFromInterval(15,35);
            let RandomTemperatura_out = _this.randomIntFromInterval(15,35);
            let RandomPresion_in = _this.randomIntFromInterval(15,35);
            let RandomPresion_out = _this.randomIntFromInterval(15,35);
            let today = new Date();
            let date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
            let time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();

            let data = new VeMecData(_this.id, RandomPresMax, RandomPresMin, RandomGas, RandomFrecuencia, RandomMezcla, RandomHumedad, RandomTemperatura_in, RandomTemperatura_out, RandomPresion_in, RandomPresion_out, date+' '+time);
            socket.emit('envio_datosVeMec', JSON.stringify(data.getData()));
            console.log("> Esto es el ventialdor " + _this.id);
            segs+=1;

            if(segs>59){
              segs=0;
              console.log("Enviando Respaldo a Bd");
              //aca llamo al Rest Wacho
            }
        }, 1000);
    });
  }

  send(data) {
    socket.emit('envio_datosVeMec', JSON.stringify(data));
  }
  
    randomIntFromInterval(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    }
}

class VeMecData {
  constructor(_id_Vemec, _presion_max, _presion_min, _gas, _frecuencia, _mezcla, _humedad, _temperatura_in, _temperatura_out, _presion_in, _presion_out, _time_Stamp) {
    this.id_Vemec = _id_Vemec;
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
}

let veMec1 = new VeMec(1,"Marca","Modelo","ubicacion",true,socket);
let veMec2 = new VeMec(4,"asdasd","adsasd","ubicacion",true,socket);

async function run_veMec1() {
    await veMec1.checking();
}
async function run_veMec2() {
    await veMec2.checking();
}

//run_veMec1();
run_veMec2();