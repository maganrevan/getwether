<?php

session_start();
$server = $_SERVER;
$post = $_POST;
$get = $_GET;
$session = $_SESSION;

/* Beginn Smarty */

require_once(__DIR__ . "/smarty/Smarty.class.php");
$smarty = new Smarty;
$smarty->template_dir = $server['DOCUMENT_ROOT'] . "/templates/";
$smarty->compile_dir = $server['DOCUMENT_ROOT'] . "/templates_c/";
$smarty->cache_dir = $server['DOCUMENT_ROOT'] . "/cache/";
$smarty->config_dir = $server['DOCUMENT_ROOT'] . "/config/";
$smarty->caching = false;
$smarty->debugging = false;
$smarty->assign("parentTemplateDir", $server['DOCUMENT_ROOT'] . "/templates/index/");
$smarty->assign("self", $server["PHP_SELF"]);

/* Ende Smarty */

/* Beginn Errorreporting */

require_once(__DIR__ . "/classes/class.errorreporting.php");

$errorreporting = new errorreporting("E_ALL");

/* Ende Errorreporting */

/* Beginn Datenbankinitialisierung */

require_once __DIR__ . '/dbConfig.php';

/* Ende Datenbankinitialisierung */

/* Beginn Updatecheck */

require_once __DIR__.'/classes/class.update.php';
$dataBase = new Update($pdo, $server);
$smarty->assign("DatabaseVersion", $dataBase->getVersionNumber());

/* Ende Updatecheck */

/* Beginn Define */
define("APIURL", "http://api.openweathermap.org/data/2.5/weather?appid=");
define("APIKEY", "564f826e3d4ba6550b3a784986f85d0c");
$smarty->assign("apiURL", APIRUL);
$smarty->assign("apiKKEY", APIKEY);

/* Ende Define */

/* Own Functions Beginn */

function get_http_response_code($url, $result = []) {
    $aHeader = get_head($url, array('header' => "Authorization: Basic " . base64_encode("$result->cVerzeichnisUser:$result->cVerzeichnisPass")));
    if(isset($aHeader[1]["Status"])){
        return array("status" => substr($aHeader[1]["Status"], 9, 3), "redirect" => true, "newLocation" => $aHeader[0]["Location"]);
    }
    else{
        return array("status" => substr($aHeader[0]["Status"], 9, 3), "redirect" => false);
    }
}

function get_head($url, array $opts = []) {
    // Store previous default context
    $prev = stream_context_get_options(stream_context_get_default());

    // Set new one with head and a small timeout
    stream_context_set_default(['http' => $opts +
            [
            'method' => 'HEAD',
            'timeout' => 30,
    ]]);

    $headers = [];
    
    // Do the head request
    $req = @get_headers($url, true);
    if (!$req){
        return false;
    }

    // Make more sane response
    foreach ($req as $h => $v) {
        if (is_int($h)) {
            $headers[$h]['Status'] = $v;
        } else {
            if (is_string($v))
                $headers[0][$h] = $v;
            else {
                foreach ($v as $x => $y) {
                    $headers[$x][$h] = $y;
                }
            }
        }
    }

    // Restore previous default context and return
    stream_context_set_default($prev);
    return $headers;
}

/* Own Functions End */
