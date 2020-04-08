<?php
include 'GlobalVars.php';
include 'VeMecData_class.php';
class VeMec
{
    private $id;
    private $marca;
    private $modelo;
    private $ubicacion;

    public function __construct()
    {
    }

    public function __construct($id, $marca, $modelo, $ubicacion)
    {
    }

    public function __Cheking(){
        //declaro array
        $arr[];
        while(true){
        //make data broh

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

        $objData = new VeMec_Data($id,null,$RandomPresMax, $RandomGas, $RandomFrecuencia, $RandomMezcla, $RandomHumedad, $RandomTemperatura_in,$RandomTemperatura_out, $RandomPresion_in,$RandomTemperatura_out, $Date_Actual); 
        //Agrega a array
        if()
        
            
        }


        sleep(1);
    }
}
