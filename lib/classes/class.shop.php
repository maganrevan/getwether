<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of shop
 *
 * @author developer
 */
class shop {
    protected $url;
    protected $licence;
    protected $vsUser;
    protected $vsPw;
    protected $https;


    public function __construct() {
        define("ROUTE","/includes/plugins/s360_monitoring/version/100/adminmenu/monitoring.php");
    }
    
    public function __destruct() {
        ;
    }
}
