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



<h4 class="card-title">Ingreso de goles</h4>



<?php

require_once("../model/Data.php");
require_once("../model/VersusFaseDeGrupo.php");
$d=new Data();


$idsDeGrupos=array(2, 3, 4, 5, 6, 7, 8, 9);




foreach ($idsDeGrupos as $n) {
    $versus=$d->getVersusGrupo($n);


    echo '<form action="../controller/controladorActualizarStatsDespuesDeFaseDeGrupos.php" method="post">';

    echo "<table border=default align=center>";
    echo "<tr>";
    echo "<th>Goles visitante</th>";
    echo "<th>Equipo visitante</th>";
    echo "<th>Contra</th>";
    echo "<th>Equipo local</th>";
    echo "<th>Goles visitante</th>";
    echo "</tr>";

        foreach ($versus as $v) {

            echo '<td><input type="text" name="goles['.$v->getNombreVisita().",".$v->getId().']" placeholder="goles visitante" required/></td>';
            echo "<td><img src=".$v->getInsigniaVisita()."> &#160".$v->getNombreVisita()."</td>";
            echo "<td>VS</td>";
            echo "<td><img src=".$v->getInsigniaLocal()."> &#160".$v->getNombreLocal()."</td>";
            echo '<td><input type="text" name="goles['.$v->getNombreLocal().",".$v->getId().']"  placeholder="goles local" required /></td>';
            echo "</tr></tr>";
        

        }
        echo "</table>";
        echo "<br>";
        echo "<br>";
        echo "<br>";



}




?>

<input type="submit" value="Listo" align:center>
</form>


    
</body>
</html>