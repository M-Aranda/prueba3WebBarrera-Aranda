<?php
require_once("Conexion.php");
require_once("Equipo.php");
require_once("VersusFaseDeGrupo.php");
require_once("VersusFaseFinal.php");

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

    // primer gol es visita, segundo es local
    public function actualizarGolesVisita($idPartido, $golesVisita, $golesLocal){
        $query="CALL actualizarGolesEquipoVisita($idPartido,$golesVisita,$golesLocal)";
        $this->usarConexion($query);
    }

        // primer gol es local, segundo es visita
    public function actualizarGolesLocal($idPartido, $golesLocal, $golesVisita){
        $query="CALL actualizarGolesEquipoLocal($idPartido,$golesVisita,$golesLocal)";
        $this->usarConexion($query);
    }


    public function sortear_equipos(){
        $query="CALL sortear_equipos()";
        $this->usarConexion($query);
    }

    public function sortear_octavos(){
        $query="CALL generar_octavos()";
        $this->usarConexion($query);
    }
    public function sortear_cuartos(){
        $query="CALL generar_cuartos()";
        $this->usarConexion($query);
    }
    public function sortear_semi(){
        $query="CALL generar_semi()";
        $this->usarConexion($query);
    }
    public function sortear_final(){
        $query="CALL generar_final()";
        $this->usarConexion($query);
    }

    public function reset_final(){
        $query="DELETE FROM partido WHERE tipo_partido_id > 1";
        $this->usarConexion($query);
    }

    public function eliminacion_directa($gLocal,$gVisita,$id_partido){
        $query="CALL eliminacion_directa($gLocal,$gVisita,$id_partido)";
        $this->usarConexion($query);
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

    public function getVersusOctavo(){
        $this->con->conectar();

        $query="SELECT * FROM octavos_de_final";

        $rs = $this->con->ejecutar($query);

        $listadoDePartidos = array();
        
        while($reg = $rs->fetch_array()){
            
            $id=$reg[0];
            $nombreVisita=$reg[1];
            $insigniaVisita=$reg[2];
            $nombreLocal=$reg[3];
            $insigniaLocal=$reg[4];
            $tipo_partido_id=$reg[5];
            $idLocal=$reg[6];
            $idVisita=$reg[7];

            $versus = new VersusFaseFinal($id,$nombreVisita,$insigniaVisita,$nombreLocal,$insigniaLocal,$idVisita,$idLocal,$tipo_partido_id);
            $listadoDePartidos[]=$versus;
        }

        

        $this->con->desconectar();

        return $listadoDePartidos;
    }
    public function getVersusCuartos(){
        $this->con->conectar();

        $query="SELECT * FROM cuartos_de_final";

        $rs = $this->con->ejecutar($query);

        $listadoDePartidos = array();
        
        while($reg = $rs->fetch_array()){
            
            $id=$reg[0];
            $nombreVisita=$reg[1];
            $insigniaVisita=$reg[2];
            $nombreLocal=$reg[3];
            $insigniaLocal=$reg[4];
            $tipo_partido_id=$reg[5];
            $idLocal=$reg[6];
            $idVisita=$reg[7];

            $versus = new VersusFaseFinal($id,$nombreVisita,$insigniaVisita,$nombreLocal,$insigniaLocal,$idVisita,$idLocal,$tipo_partido_id);
            $listadoDePartidos[]=$versus;
        }
        

        $this->con->desconectar();

        return $listadoDePartidos;
    }
    public function getVersusSemi(){
        $this->con->conectar();

        $query="SELECT * FROM semi_final";

        $rs = $this->con->ejecutar($query);

        $listadoDePartidos = array();
        
        while($reg = $rs->fetch_array()){
            
            $id=$reg[0];
            $nombreVisita=$reg[1];
            $insigniaVisita=$reg[2];
            $nombreLocal=$reg[3];
            $insigniaLocal=$reg[4];
            $tipo_partido_id=$reg[5];
            $idLocal=$reg[6];
            $idVisita=$reg[7];

            $versus = new VersusFaseFinal($id,$nombreVisita,$insigniaVisita,$nombreLocal,$insigniaLocal,$idVisita,$idLocal,$tipo_partido_id);
            $listadoDePartidos[]=$versus;
        }
        

        $this->con->desconectar();

        return $listadoDePartidos;
    }

    public function getVersusFinal(){
        $this->con->conectar();

        $query="SELECT * FROM final";

        $rs = $this->con->ejecutar($query);

        $listadoDePartidos = array();
        
        while($reg = $rs->fetch_array()){
            
            $id=$reg[0];
            $nombreVisita=$reg[1];
            $insigniaVisita=$reg[2];
            $nombreLocal=$reg[3];
            $insigniaLocal=$reg[4];
            $tipo_partido_id=$reg[5];
            $idLocal=$reg[6];
            $idVisita=$reg[7];

            $versus = new VersusFaseFinal($id,$nombreVisita,$insigniaVisita,$nombreLocal,$insigniaLocal,$idVisita,$idLocal,$tipo_partido_id);
            $listadoDePartidos[]=$versus;
        }

        

        $this->con->desconectar();

        return $listadoDePartidos;
    }

    public function getCampeon(){
        $this->con->conectar();

        $query="SELECT e.id,e.nombre,e.insignia FROM equipo e WHERE nombre = (SELECT ganador FROM partido WHERE tipo_partido_id = 5 LIMIT 0,1)";

        $rs = $this->con->ejecutar($query);

        $campeon = null;
        
        if($reg = $rs->fetch_array()){
            
            $id=$reg[0];
            $nombreVisita=$reg[1];
            $insigniaVisita=$reg[2];

            $campeon = new Equipo($id,$nombreVisita,$insigniaVisita,0,0,0,0,0);
        }

        

        $this->con->desconectar();

        return $campeon;
    }
    public function getTercero(){
        $this->con->conectar();

        $query="SELECT e.id,e.nombre,e.insignia FROM equipo e WHERE nombre = (SELECT ganador FROM partido WHERE tipo_partido_id = 5 LIMIT 1,1)";

        $rs = $this->con->ejecutar($query);

        $campeon = null;
        
        if($reg = $rs->fetch_array()){
            
            $id=$reg[0];
            $nombreVisita=$reg[1];
            $insigniaVisita=$reg[2];

            $campeon = new Equipo($id,$nombreVisita,$insigniaVisita,0,0,0,0,0);
        }

        

        $this->con->desconectar();

        return $campeon;
    }


    public function getEquiposGrupo($id_grupo){
        $this->con->conectar();

        $query="SELECT * FROM equipo WHERE grupo_id=$id_grupo order by puntaje DESC";

          
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
