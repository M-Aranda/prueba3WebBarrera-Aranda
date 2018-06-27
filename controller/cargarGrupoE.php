<?php

require_once("../model/Data.php");

session_start();
$d=new Data();

$_SESSION['E'] = $d->getEquiposGrupo(6);

header("location: ../view/grupoE.php");

?>