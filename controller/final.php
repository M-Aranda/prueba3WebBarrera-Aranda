<?php

require_once("../model/Data.php");

session_start();
$d=new Data();

$goles=$_POST['goles']; 

$j=1;

$d->sortear_final();

?>