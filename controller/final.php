<?php

require_once("../model/Data.php");

session_start();
$d=new Data();
$lista = array();

$lista = $d->getVersusFinal();
foreach ($lista as $v) {
    $id = $v->getId();
    $golesLocal=$_POST['v'.$id]; 
    $golesVisita=$_POST['l'.$id];
    if ( ($golesLocal == null) && ( $golesVisita != null ) ) {
        $golesLocal = 0;
    }elseif ( ($golesLocal != null) && ( $golesVisita == null ) ) {
        $golesVisita = 0;
    }elseif ( $golesLocal == $golesVisita ){
        $golesLocal = rand(0,5);
        $golesVisita = rand(0,5);
        while ($golesLocal == $golesVisita){
            $golesVisita = rand(0,5);
        }
    }
    $d->eliminacion_directa($golesLocal,$golesVisita,$id);
}

header("location:../view/faseFinal.php");
?>