<?php
    require __DIR__ . '/vendor/autoload.php';
    require __DIR__ . '/include/DataHandler_class.php';

    use Ratchet\Server\IoServer;
    use Ratchet\Http\HttpServer;
    use Ratchet\WebSocket\WsServer;
    use DataHandlerApp\DataHandler;

    $protocol = "websocket";

    if($protocol = "websocket") {
        $server = IoServer::factory(
            new HttpServer(
                new WsServer(
                    new DataHandler()
                )
            ),
            8080
        );
        $server->run();
    } else {
        $dataHandler = new DataHandler();
    }

    

