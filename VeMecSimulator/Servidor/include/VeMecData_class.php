<?php
class VeMec_Data
{
    //protected $id_data;
    protected $id_Vemec;
    protected $presion_max;
    protected $presion_min;
    protected $gas;
    protected $frecuencia;
    protected $mezcla;
    protected $humedad;
    protected $temperatura_in;
    protected $temperatura_out;

    /**
     * @return mixed
     */
    public function getIdVemec()
    {
        return $this->id_Vemec;
    }

    /**
     * @return mixed
     */
    public function getPresionMax()
    {
        return $this->presion_max;
    }

    /**
     * @return mixed
     */
    public function getPresionMin()
    {
        return $this->presion_min;
    }

    /**
     * @return mixed
     */
    public function getGas()
    {
        return $this->gas;
    }

    /**
     * @return mixed
     */
    public function getFrecuencia()
    {
        return $this->frecuencia;
    }

    /**
     * @return mixed
     */
    public function getMezcla()
    {
        return $this->mezcla;
    }

    /**
     * @return mixed
     */
    public function getHumedad()
    {
        return $this->humedad;
    }

    /**
     * @return mixed
     */
    public function getTemperaturaIn()
    {
        return $this->temperatura_in;
    }

    /**
     * @return mixed
     */
    public function getTemperaturaOut()
    {
        return $this->temperatura_out;
    }

    /**
     * @return mixed
     */
    public function getPresionIn()
    {
        return $this->presion_in;
    }

    /**
     * @return mixed
     */
    public function getPresionOut()
    {
        return $this->presion_out;
    }

    /**
     * @return mixed
     */
    public function getTimeStamp()
    {
        return $this->time_Stamp;
    }
    protected $presion_in;
    protected $presion_out;
    protected $time_Stamp;

    public function __construct($id_Vemec, $presion_max, $presion_min, $gas, $frecuencia, $mezcla, $humedad, $temperatura_in, $temperatura_out, $presion_in, $presion_out, $time_Stamp)
    {
        //$this->id_data = $id_data;
        $this->id_Vemec = $id_Vemec;
        $this->presion_max = $presion_max;
        $this->presion_min = $presion_min;
        $this->gas = $gas;
        $this->frecuencia = $frecuencia;
        $this->mezcla = $mezcla;
        $this->humedad = $humedad;
        $this->temperatura_in = $temperatura_in;
        $this->temperatura_out = $temperatura_out;
        $this->presion_in = $presion_in;
        $this->presion_out = $presion_out;
        $this->time_Stamp = $time_Stamp;
    }

    public function getData() {
        return array(
            "id_Vemec" => $this->id_Vemec,
            "presion_max" => $this->presion_max,
            "presion_min" => $this->presion_min
        );
    }


}