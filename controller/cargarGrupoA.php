<?php

require_once("../model/Data.php");

session_start();
$d=new Data();

$_SESSION['A'] = $d->getEquiposGrupo(2);

header("location: ../view/grupoA.php");

?>