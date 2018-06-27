<?php

require_once("../model/Data.php");

session_start();
$d=new Data();

$d->sortear_equipos();

header("location:../view/sorteo.php");

?>