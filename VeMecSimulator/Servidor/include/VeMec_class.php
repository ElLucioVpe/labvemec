<?php
require 'GlobalVars.php';
require 'VeMecData_class.php';

class VeMec
{
    protected $id;
    protected $marca;
    protected $modelo;
    protected $ubicacion;
    //protected $datos[];
    protected $datos= array();
    protected $running = true;

    protected $cliente;

    public function __construct($_id, $_marca, $_modelo, $_ubicacion, $_cliente)
    {
        $this->id = $_id;
        $this->marca = $_marca;
        $this->modelo = $_modelo;
        $this->ubicacion = $_ubicacion;
        $this->cliente = $_cliente;
    }

    public function esUrgente($objData) {
        // chequeos locos para saber si el pibe se esta muriendo xd
        if($objData->getPresionMax() > 80) {
            return true;
        }
        return false;
    }

    public function enviarDatos($datos) {
        $this->cliente->send(json_encode($datos));
    }

    public function __Cheking() {
        //echo("--- Probando ---");

        while($this->running==true) {
            $RandomPresMax = rand(15,35);
            $RandomPresMin = rand(15,35);
            $RandomGas = rand(15,35);
            $RandomFrecuencia = rand(15,35);
            $RandomMezcla= rand(15,35);
            $RandomHumedad= rand(15,35);
            $RandomTemperatura_in= rand(15,35);
            $RandomTemperatura_out= rand(15,35);
            $RandomPresion_in= rand(15,35);
            $RandomPresion_out= rand(15,35);
            $Date_Actual=  date("Y-m-d H:i:s");

            $objData = new VeMec_Data($this->id,$RandomPresMax, $RandomPresMin,$RandomGas, $RandomFrecuencia, $RandomMezcla, $RandomHumedad, $RandomTemperatura_in,$RandomTemperatura_out, $RandomPresion_in,$RandomPresion_out, $Date_Actual);

            //echo("--- Probando ---" . $this->id);

            $this->enviarDatos(json_encode($objData->getData()));
            sleep(1);
        }
    }
}
