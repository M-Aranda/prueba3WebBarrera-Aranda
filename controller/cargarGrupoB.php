<?php

require_once("../model/Data.php");

session_start();
$d=new Data();

$_SESSION['B'] = $d->getEquiposGrupo(3);

header("location: ../view/grupoB.php");

?>