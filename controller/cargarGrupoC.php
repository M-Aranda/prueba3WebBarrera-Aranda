<?php

require_once("../model/Data.php");

session_start();
$d=new Data();

$_SESSION['C'] = $d->getEquiposGrupo(4);

header("location: ../view/grupoC.php");

?>