const express = require('express');
const socket = require('socket.io');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
app.use(cors({origin: '*'}));
app.use(bodyParser);
let x = true;

const server = app.listen(4000,() => {
    console.log('Started in 4000');
});

const io = socket(server);

io.sockets.on('connection', (socket) => {
    console.log(`new connection id: ${socket.id}`);
    //sendData(socket);

    socket.on ('envio_datosVeMec', function (msg) {
        console.log('data: '+msg);
        var json = JSON.parse(msg);
        io.sockets.emit('datosVeMec'+json.Id, json);
    });

})

function sendData(socket){

    setTimeout(() => {
        sendData(socket);
    }, 10000);
}