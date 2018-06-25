<?php
require_once("Conexion.php");
require_once("Equipo.php");
require_once("VersusFaseDeGrupo.php");

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

    //metodo que debiese actualizar id_grupo de equipos, pero creo que no se necesuta porque se sortea en bd
    public function sortear($id_grupo,$idEquipo){
        $query="UPDATE equipo SET grupo_id=$id_grupo WHERE id=$idEquipo";
        usarConexion($query);
    }

    public function getVersusGrupo($idG){
        $this->con->conectar();

        $query="CALL mostrarVSDeUnGrupo($idG)";

        $rs = $this->con->ejecutar($query);

        $listadoDePartidos = array();
        
        while($reg = $rs->fetch_array()){
            
            $id=$reg[0];
            $nombreVisita=$reg[1];
            $insigniaVisita=$reg[2];
            $nombreLocal=$reg[3];
            $insigniaLocal=$reg[4];

            $versus = new VersusFaseDeGrupo($id,$nombreVisita,$insigniaVisita,$nombreLocal,$insigniaLocal);
            $listadoDePartidos[]=$versus;
        }

        

        $this->con->desconectar();

        return $listadoDePartidos;
    }


    public function getEquiposGrupo($id_grupo){
        $this->con->conectar();

        $query="SELECT * FROM equipo WHERE grupo_id=$id_grupo";

          
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
            $grupo_id=$reg[7];


            $equipo = new Equipo($id,$nombre,$insignia,$puntaje,$nGolesAFavor,$nGolesEnContra,$diferenciaDeGoles,$grupo_id);
            

            $listaDeEquipos[]=$equipo;

        }

        $this->con->desconectar();

        return $listaDeEquipos;
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
            $grupo_id=$reg[7];


            $equipo = new Equipo($id,$nombre,$insignia,$puntaje,$nGolesAFavor,$nGolesEnContra,$diferenciaDeGoles,$grupo_id);
            

            $listaDeEquipos[]=$equipo;

        }

        $this->con->desconectar();

        return $listaDeEquipos;



}
}
