<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sorteo</title>

    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../js/bootstrap.js">


</head>
<body>




    <h3>Equipos clasificados para el mundial Rusia 2018</h3>

    <table border="default">
    
<?php
require_once("../model/Data.php");
require_once("../model/Equipo.php");

session_start();

$d= new Data();

$equiposMundial=$d->getEquiposDelMundial();

/*
<img class="img-fluid" src="../imagenes/egipto.png" alt="">
*/


foreach ($equiposMundial as $e => $equipo) {// ciclo que muestra nombres de equipos junto a sus banderas #somosnada
    echo "<td>" .$equipo->getNombre()."</td>";
    echo "<td><img src=".$equipo->getInsignia()."></td>";
    echo "</tr></tr>";

}






?>


    </table>

    <form action="#" method="post">
    <input type="submit" value="Sortear equipos">
    </form>


    <a href="grupoA.php">Ver grupo A</a>
    <br>
    <a href="grupoB.php">Ver grupo B</a>
    <br>
    <a href="grupoC.php">Ver grupo C</a>
    <br>
    <a href="grupoD.php">Ver grupo D</a>
    <br>
    <a href="grupoE.php">Ver grupo E</a>
    <br>
    <a href="grupoF.php">Ver grupo F</a>
    <br>
    <a href="grupoG.php">Ver grupo G</a>
    <br>
    <a href="grupoH.php">Ver grupo H</a>

</body>
</html>