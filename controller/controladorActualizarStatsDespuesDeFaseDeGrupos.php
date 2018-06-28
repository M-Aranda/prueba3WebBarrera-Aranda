<?php

require_once("../model/Data.php");

session_start();
$d=new Data();

$goles=$_POST['goles']; 

$j=1;

for ($i=0; $i < 96; $i+=2) { 
    $golesVisita=array_values($goles)[$i];
    $golesLocal=array_values($goles)[$i+1];

    echo $golesVisita;
    echo "<br>";
    echo $golesLocal;
    echo "<br>";

    $d->actualizarGolesVisita($j,$golesVisita,$golesLocal);
    $d->actualizarGolesLocal($j,$golesVisita,$golesLocal);
    
    $j++;
   
}

$d->reset_final();
$d->sortear_octavos();

header("location:../view/octavos.php");

?>