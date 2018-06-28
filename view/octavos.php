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
      <h3>Octavos de Final</h3>
      </div>
      <div class="card-body">



<?php

require_once("../model/Data.php");
require_once("../model/VersusFaseFinal.php");

$d=new Data();


    $versus=$d->getVersusOctavo();


    echo '<form action="../controller/eliminacionOctavos.php" method="post">';

    echo "<table border=default align=center>";
    echo "<tr>";
    echo "<th>Goles visitante</th>";
    echo "<th>Equipo visitante</th>";
    echo "<th>Contra</th>";
    echo "<th>Equipo local</th>";
    echo "<th>Goles local</th>";
    echo "</tr>";

        foreach ($versus as $v) {

            echo '<td><input type="text" name="v'.$v->getId().'" placeholder="goles visitante" /></td>';
            echo "<td><img src=".$v->getInsigniaVisita()."> &#160".$v->getNombreVisita()."</td>";
            echo "<td>VS</td>";
            echo "<td><img src=".$v->getInsigniaLocal()."> &#160".$v->getNombreLocal()."</td>";
            echo '<td><input type="text" name="l'.$v->getId().'"  placeholder="goles local"  /></td>';
            echo "</tr></tr>";
        

        }
        echo "</table>";
        echo "<br>";
        echo "<br>";
        echo "<br>";




?>

<input type="submit" value="Listo">
</form>
</div>
</div>
</div>


    
</body>
</html>