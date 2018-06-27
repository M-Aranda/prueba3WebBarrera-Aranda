<?php

require_once("../model/Data.php");

session_start();
$d=new Data();

$_SESSION['D'] = $d->getEquiposGrupo(5);

header("location: ../view/grupoD.php");

?>