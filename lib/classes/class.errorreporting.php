<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of class
 *
 * @author developer
 */
class errorreporting {

    public function __construct($error = "E_ALL") {
        error_reporting($error);
	ini_set('display_errors',1);
        
    }

    public function __destruct() {
        
    }

}
