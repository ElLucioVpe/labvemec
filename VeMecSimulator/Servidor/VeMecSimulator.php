<?php
require __DIR__ . '/vendor/autoload.php';
require __DIR__ . '/include/DataHandler_class.php';

require_once 'include/VeMec_class.php';

use WebSocket\Client;
use AsyncPHP\Doorman\Manager\ProcessManager;
use AsyncPHP\Doorman\Task\ProcessCallbackTask;

$client = new Client("ws://localhost:8080/");
$vemec1 = new VeMec(1, "Marca", "adas", "adasd", $client);
$vemec2 = new VeMec(2, "Marca", "adas", "adasd", $client);

$task1 = new ProcessCallbackTask(function () use ($vemec1) {
    $vemec1->__Cheking();
});

$task2= new ProcessCallbackTask(function () use ($vemec2) {
    $vemec2->__Cheking();
});

$manager = new ProcessManager();
$manager->setBinary("/opt/lampp/bin/php");
$manager->setLogPath("/home/luciano/");


$manager->addTask($task1);
$manager->addTask($task2);