<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of smartyDebug
 *
 * @author developer
 */
class smartyDebug {

    public function __construct(&$smarty) {
        $this->setDebug($smarty, $_GET, $_POST, $_SERVER, $_SESSION);
    }

    public function __destruct() {
        ;
    }

    protected function setDebug(&$smarty, $get, $post, $server, $session) {
        /* Beginn Smarty Debug */
        $smarty->assign("debug", json_encode(array("templateVars" => $smarty->getTemplateVars(), "getVars" => $get, "postVars" => $post, "serverVars" => $server, "sessionVars" => $session)));
        /* Ende Smarty Debug  */
    }

}
