<?php

require_once("../model/Data.php");

session_start();
$d=new Data();

$_SESSION['A'] = $d->getEquiposGrupo(2);
$_SESSION['B'] = $d->getEquiposGrupo(3);
$_SESSION['C'] = $d->getEquiposGrupo(4);
$_SESSION['D'] = $d->getEquiposGrupo(5);
$_SESSION['E'] = $d->getEquiposGrupo(6);
$_SESSION['F'] = $d->getEquiposGrupo(7);
$_SESSION['G'] = $d->getEquiposGrupo(8);
$_SESSION['H'] = $d->getEquiposGrupo(9);

header("location: ../view/sorteo.php");

?>