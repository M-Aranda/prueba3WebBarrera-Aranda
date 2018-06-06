<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ver Grupo A</title>

    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href=../"js/bootstrap.js">

</head>
<body>

<table border=default>

<tr>
<th>Pais</th>
<th>Puntaje</th>
<th>Numero de goles a favor  </th>
<th>Numero de goles en contra  </th>
<th>Diferencia de goles</th>
</tr>

<?php

require_once("../model/Data.php");
require_once("../model/Equipo.php");

session_start();

$id_grupo=7;

$d=new Data();
$equiposDelGrupo=$d->getEquiposGrupo($id_grupo);


foreach ($equiposDelGrupo as $e => $equipo) {
    echo "<td><img src=".$equipo->getInsignia()."> &#160".$equipo->getNombre()."</td>";
    echo"<td>".$equipo->getPuntaje()."</td>";
    echo"<td>".$equipo->getNGolesAFavor()."</td>";
    echo"<td>".$equipo->getNGolesEnContra()."</td>";
    echo"<td>".$equipo->getDiferenciaDeGoles()."</td>";
    echo "</tr></tr>";

}


?>

</table>

    
</body>
</html>