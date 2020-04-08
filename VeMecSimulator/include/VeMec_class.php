<?php
include 'GlobalVars.php';
include 'VeMecData_class.php';
class VeMec
{
    protected $id;
    protected $marca;
    protected $modelo;
    protected $ubicacion;
    protected $datos[];
    protected $running = true;
    
    protected $conexion;

    public function __construct($_id, $_marca, $_modelo, $_ubicacion, $_conexion)
    {
        $this->id = $_id;
        $this->marca = $_marca;
        $this->modelo = $_modelo;
        $this->ubicacion = $_ubicacion;
        $this->conexion = $_conexion;
    }

    public function esUrgente($objData) {
        // chequeos locos para saber si el pibe se esta muriendo xd
        if($objData->persion_max > 80) {
            return true;
        }
        return false;
    }

    public function enviarDatos($datos) {
        $this->conexion->sendData($datos);
    }

    public function __Cheking() {
        echo("--- Probando ---");

        int $i = 0;
        while($running) {
            $RandomPresMax = rand(15,35);
            $RandomPresMin = rand(15,35);
            $RandomGas = rand(15,35);
            $RandomFrecuencia = rand(15,35);
            $RandomMezcla= rand(15,35);
            $RandomHumedad= rand(15,35);
            $RandomTemperatura_in= rand(15,35);
            $RandomTemperatura_out= rand(15,35);
            $RandomPresion_in= rand(15,35);
            $RandomTemperatura_out= rand(15,35);
            $Date_Actual=  date("Y-m-d H:i:s");

            echo("--- adasd ---");

            $objData = new VeMec_Data($id,null,$RandomPresMax, $RandomGas, $RandomFrecuencia, $RandomMezcla, $RandomHumedad, $RandomTemperatura_in,$RandomTemperatura_out, $RandomPresion_in,$RandomTemperatura_out, $Date_Actual); 

            if(esUrgente($objData)) {
                enviarDatos();
            }

            array_push($this->datos, $objData);

            if($i === 60) {
                $i = 0;
                enviarDatos();
            } else {
                i++;
                sleep(1);
            }
        }
    }
}
