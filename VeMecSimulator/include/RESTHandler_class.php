<?php
class RESTHandler
{
    private $url = 'http://www.someurl.com';
    private $protocol = "websocket";

    public function __constructor($protocol, $url) {
            if($protocol === "post") {
                $this->protocol = "post";
            }
    }

    public function sendData($data) {
        $this->protocol ? sendDataPOST($data) : sendDataWebSocket($data);
    }

    public function sendDataPOST($data)
    {
        $options = array(
            'http' => array(
                'header'  => "Access-Control-Allow-Origin: *\r\nContent-type: application/json; charset=UTF-8\r\n",
                'method'  => 'POST',
                'content' => http_build_query(json_encode($data))
            )
        );
        $context  = stream_context_create($options);
        $result = file_get_contents($this->url, false, $context);
        if ($result === FALSE) {
            /* Handle error */
        }

        var_dump($result);
    }
    
    public function sendDataWebSocket($data)
    {
        $options = array(
            'http' => array(
                'header'  => "Access-Control-Allow-Origin: *\r\nContent-type: application/json; charset=UTF-8\r\n",
                'method'  => 'POST',
                'content' => http_build_query(json_encode($data))
            )
        );
        $context  = stream_context_create($options);
        $result = file_get_contents($this->url, false, $context);
        if ($result === FALSE) {
            /* Handle error */
        }

        var_dump($result);
    }
}
