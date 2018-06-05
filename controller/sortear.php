<?php

require_once("../model/Data.php");

session_start();


//aqui va lo que se obtiene



$yaSorteados=array(); //array que guarda los numeros ya sorteados




//ciclo para guaradar numeros ya sorteados, pero incompleto
while(in_array($numeroR=rand(1,32), $yaSorteados){
    $yaSorteados[]=$numR;
}




$d=new Data();

//aqui el metodo que sortea, todavia falta programar lo que es el view de los equipos sorteados

header("location:../view/sorteo.php");

?>