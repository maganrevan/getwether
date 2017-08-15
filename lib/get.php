<?php

require_once 'defines.php';


if (isset($get["city"]) && $get["city"] !== "") {

    $url = APIURL . APIKEY . "&q=" . $get["city"]. "&lang=de&units=metric";
    try {
        $item["url"] = $url;
        $item["connection_header"] = get_http_response_code($url);

        $response = '{"coord":{"lon":13.41,"lat":52.52},"weather":[{"id":800,"main":"Clear","description":"Klarer Himmel","icon":"01d"}],"base":"stations","main":{"temp":27,"pressure":1016,"humidity":42,"temp_min":27,"temp_max":27},"visibility":10000,"wind":{"speed":5.1,"deg":140},"clouds":{"all":0},"dt":1502814000,"sys":{"type":1,"id":4892,"message":0.0031,"country":"DE","sunrise":1502769009,"sunset":1502821802},"id":2950159,"name":"Berlin","cod":200}';        
        if ($item["connection_header"]["status"] !== false) {
            #$item["connection_api_value"] = json_decode(file_get_contents($url));
            $item["connection_api_value"] = json_decode($response);
        }
    } catch (Exception $ex) {
        var_dump($ex);
    }
}

        

