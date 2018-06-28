<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ingresar goles en fase de grupo</title>

    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href=../"js/bootstrap.js">
    <link rel="stylesheet" href="../css/estilos.css">

</head>
<body>
<div class="claseDelDiv">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Mundial 2018</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="sorteo.php">Sortear<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="grupoA.php">A<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="grupoB.php">B<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="grupoC.php">C<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="grupoD.php">D<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="grupoE.php">E<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="grupoF.php">F<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="grupoG.php">G<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="grupoH.php">H<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="octavos.php">Octavos<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="cuartos.php">Cuartos<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="semi.php">Semifinal<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="final.php">Final<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="verGruposConEstadisticas.php">Grupos<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="faseDeGruposGoles.php">Goles<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="faseFinal.php">Resultado<span class="sr-only">(current)</span></a>
      </li>
      
    </ul>
  </div>
</nav>
    <br>
    <br>
    <br>
    <div class="card text-center" style="margin-left: 20%; margin-right: 20%;" >
      <div class="card-header">
      <h3>Resultado</h3>
      </div>
      <div class="card-body">



<?php

require_once("../model/Data.php");
require_once("../model/Equipo.php");

$d=new Data();

    $campeon=$d->getCampeon();
    $tercer=$d->getTercero();
    
    if($campeon != null){
?>
<div class="col"><h3>Campeon</h3></div>
                <br>
                <div class="centrado"><?php
                echo "<img src=".$campeon->getInsignia()."> &#160".$campeon->getNombre();
                ?></div>
                <br>
                <br>
                <br>
<div class="col"><h3>Tercer Lugar</h3></div>
                <br>
                <div class="centrado"><?php
                echo "<img src=".$tercer->getInsignia()."> &#160".$tercer->getNombre();
                ?></div>
                <br>
</div>
<?php
    }else{
?>
<div class="col"><h3>Campeon</h3></div>
                <br>
                <div class="centrado"><?php
                echo "POR DEFINIR";
                ?></div>
                <br>
                <br>
                <br>
<div class="col"><h3>Tercer Lugar</h3></div>
                <br>
                <div class="centrado"><?php
                echo "POR DEFINIR";
                ?></div>
                <br>
</div>
<?php
    }
?>
</div>


    
</body>
</html>