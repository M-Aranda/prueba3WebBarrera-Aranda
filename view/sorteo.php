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


    
</body>
</html>