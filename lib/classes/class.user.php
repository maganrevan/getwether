<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of user
 *
 * @author developer
 */
class user {

    protected $email;
    protected $login;
    protected $pass;
    protected $sureName;
    protected $lastName;

    public function __construct() {
        
    }

    public function __destruct() {
        
    }

    public function login($db, $user, $pass) {
        $sql = "SELECT * FROM tUser WHERE cLogin='$user' AND cPasswort='" . hash(HASH, $pass) . "'";
        $stmt = $db->prepare($sql);
        $stmt->execute();
        if ($stmt->rowCount() === 1) {
            $_SESSION["user"] = $stmt->fetchObject();
        }
    }

    public function logout() {
        session_destroy();
        header('Location: /');
        exit;
    }

}
