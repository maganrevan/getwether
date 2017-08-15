<?php

$user = "user";
$password = "pass";
$database = "database";
$dsn = "mysql:host=localhost;dbname=$database";

try {
    $pdo = new PDO($dsn, $user, $password);
} catch (PDOException $e) {
    $error_message = $e->getMessage();
    echo $error_message;
    die();
}
    
