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

        $query="SELECT * FROM partido WHERE tipo_partido_id = 2";

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
    public function getVersusCuartos(){
        $this->con->conectar();

        $query="SELECT * FROM partido WHERE tipo_partido_id = 3";

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
    public function getVersusSemi(){
        $this->con->conectar();

        $query="SELECT * FROM partido WHERE tipo_partido_id = 4";

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

    public function getVersusFinal(){
        $this->con->conectar();

        $query="SELECT * FROM partido WHERE tipo_partido_id = 5";

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
