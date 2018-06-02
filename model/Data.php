<?php
require_once("Conexion.php");
require_once("Equipo.php");

class Data{
    private $con;

    public function __construct(){
        $this->con = new Conexion();
    }

    public function usarConexion($query){

        $this->con->conectar();
        $this->con->ejecutar($query);
        $this->con->desconectar();


    }


    public function getEquiposDelMundial(){
        $this->con->conectar();

        $query="SELECT * FROM equipo";

        
        $rs = $this->con->ejecutar($query);


        
        $listaDeEquipos = array();


        while($reg = $rs->fetch_array()){
            

            $id=$reg[0];
            $nombre=$reg[1];
            $insignia=$reg[2];
            $puntaje=$reg[3];
            $nGolesAFavor=$reg[4];
            $nGolesEnContra=$reg[5];
            $diferenciaDeGoles=$reg[6];


            $equipo = new Equipo($id,$nombre,$insignia,$puntaje,$nGolesAFavor,$nGolesEnContra,$diferenciaDeGoles);
            

            $listaDeEquipos[]=$equipo;

        }

        $this->con->desconectar();

        return $listaDeEquipos;



}
}
