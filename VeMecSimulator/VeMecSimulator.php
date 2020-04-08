<?php
require __DIR__ . '/vendor/autoload.php';
require __DIR__ . '/include/DataHandler_class.php';

use DataHandlerApp\DataHandler;
use Ratchet\Http\HttpServer;
use Ratchet\Server\IoServer;
use Ratchet\WebSocket\WsServer;

$protocol = "websocket";

$server = IoServer::factory(
    new HttpServer(
        new WsServer(
            new DataHandler()
        )
    ),
    8080
);
$server->run();

$vemec1 = new VeMec(1, "Marca", "adas", "adasd", $dataHandler);
$vemec1->__Cheking();
