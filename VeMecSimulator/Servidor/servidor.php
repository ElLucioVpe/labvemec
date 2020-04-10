<?php
require __DIR__ . '/vendor/autoload.php';
require __DIR__ . '/include/DataHandler_class.php';

use DataHandlerApp\DataHandler;
use Ratchet\Http\OriginCheck;
use Ratchet\Http\HttpServer;
use Ratchet\Server\IoServer;
use Ratchet\WebSocket\WsServer;

$protocol = "websocket";

/*
    $server = IoServer::factory(
        new HttpServer(
            new WsServer(
                new DataHandler()
            )
        ),
        4000
    );
    
    $server->run();
*/

$checkedApp = new OriginCheck(new WsServer(new DataHandler()), array('localhost'));
$checkedApp->allowedOrigins[] = '*';

$server = IoServer::factory(new HttpServer($checkedApp),4000);
$server->run();
