<?php

require_once("../model/Data.php");

session_start();
$d=new Data();

$_SESSION['F'] = $d->getEquiposGrupo(7);

header("location: ../view/grupoF.php");

?>