<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sorteo</title>

    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/estilos.css">
    <link rel="stylesheet" href="../js/bootstrap.js">

</head>
<body>   


<?php
require_once("../model/Equipo.php");
session_start();

if (!isset($_SESSION['A'])){ 
    header("location:../controller/llenarGrupos.php");
}
?>

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
      <h3>Equipos clasificados para el mundial Rusia 2018</h3>
      </div>
      <div class="card-body">
        <div class="row">
            <div class="col">            
                <div class="row">Grupo A</div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION['A'][0];
                echo "<img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre();
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["A"][1];
                echo "<img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre();
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["A"][2];
                echo "<img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre();
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["A"][3];
                echo "<img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre();
                ?></div>
            </div>
            <div class="col">
                
                <div class="row">Grupo B</div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION['B'][0];
                echo "<img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre();
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["B"][1];
                echo "<img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre();
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["B"][2];
                echo "<img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre();
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["B"][3];
                echo "<img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre();
                ?></div>
            </div>
            <div class="col">
                
                <div class="row">Grupo C</div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION['C'][0];
                echo "<img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre();
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["C"][1];
                echo "<img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre();
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["C"][2];
                echo "<img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre();
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["C"][3];
                echo "<img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre();
                ?></div>
            </div>
            <div class="col">            
                <div class="row">Grupo D</div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION['D'][0];
                echo "<img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre();
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["D"][1];
                echo "<img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre();
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["D"][2];
                echo "<img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre();
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["D"][3];
                echo "<img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre();
                ?></div>
            </div>
        </div>
            <br>
            <br>
        <div class="row">
            <div class="col">            
                <div class="row">Grupo E</div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION['E'][0];
                echo "<td><img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre()."</td>";
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["E"][1];
                echo "<td><img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre()."</td>";
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["E"][2];
                echo "<td><img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre()."</td>";
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["E"][3];
                echo "<td><img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre()."</td>";
                ?></div>
            </div>
            <div class="col">
                 
                <div class="row">Grupo F</div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION['F'][0];
                echo "<td><img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre()."</td>";
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["F"][1];
                echo "<td><img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre()."</td>";
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["F"][2];
                echo "<td><img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre()."</td>";
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["F"][3];
                echo "<td><img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre()."</td>";
                ?></div>
            </div>
            <div class="col">
                
                <div class="row">Grupo G</div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION['G'][0];
                echo "<td><img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre()."</td>";
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["G"][1];
                echo "<td><img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre()."</td>";
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["G"][2];
                echo "<td><img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre()."</td>";
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["G"][3];
                echo "<td><img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre()."</td>";
                ?></div>
            </div>
            <div class="col">            
                <div class="row">Grupo H</div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION['H'][0];
                echo "<td><img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre()."</td>";
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["H"][1];
                echo "<td><img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre()."</td>";
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["H"][2];
                echo "<td><img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre()."</td>";
                ?></div>
                <br>
                <div class="row"><?php
                $equipo = $_SESSION["H"][3];
                echo "<td><img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre()."</td>";
                session_destroy();
                ?></div>
            </div>
        </div>
        <br>
        <br>
        <a class='btn btn-success' href="../controller/sorteoEquipos.php">Sortear</a>
      </div>
    </div>
  </div>


    

</body>
</html>