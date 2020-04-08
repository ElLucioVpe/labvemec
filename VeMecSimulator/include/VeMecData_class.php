<?php
class VeMec_Data
{
    private $id_data;
    private $id_Vemec;
    private $persion_max;
    private $persion_min;
    private $gas;
    private $frecuencia;
    private $mezcla;
    private $humedad;
    private $temperatura_in;
    private $temperatura_out;
    private $persion_in;
    private $persion_out;
    private $time_Stamp;

    public function __construct()
    {
    }

    public function __construct($id_data, $id_Vemec, $persion_max, $persion_min,$gas,$frecuencia,$mezcla,$humedad,$temperatura_in,$temperatura_out,$persion_in,$persion_out,$time_Stamp)
    {

    }

}