<?php

require_once("../model/Data.php");

session_start();
$d=new Data();

$_SESSION['G'] = $d->getEquiposGrupo(8);

header("location: ../view/grupoG.php");

?>