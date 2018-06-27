<?php

require_once("../model/Data.php");

session_start();
$d=new Data();

$_SESSION['H'] = $d->getEquiposGrupo(9);

header("location: ../view/grupoH.php");

?>