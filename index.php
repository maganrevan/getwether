<?php

require_once 'lib/defines.php';

//�berpr�fung der Rechte der einzelnen Ordner welche f�r Smarty relevant sind
//$smarty->testInstall();

require_once 'lib/beforeOutput.php';

$smarty->display("home/index.tpl");
