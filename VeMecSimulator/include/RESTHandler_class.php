<?php
class RESTHandler
{
    private $url = 'http://www.someurl.com';

    public function sendData($data)
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
