
<?php
define("ONLINE", false);

class Conexion {

    private $mysql;
    private $bdName;
    private $user;
    private $pass;
    
    public function __construct() {//puede que haya que cambiar los parametros de conexion (invertir el orden, online en !ONLINE y offline en ONLINE)
        if (!ONLINE) {
            $this->bdName = "mundial2018";
            $this->user = "root";
            $this->pass = "";
        }else{
            $this->bdName = "nombreOnlineDeBD";
            $this->user = "usuarioOnlineDeBD";
            $this->pass = "passwordBDOnline";
        }
    }

    public function conectar() {
        $this->mysql = new mysqli(
                "localhost", $this->user, $this->pass, $this->bdName
        );

        if (mysqli_connect_errno()) {
            printf("Error de conexión: %s\n", mysqli_connect_error());
            exit();
        }
    }

    public function ejecutar($query) {
        return $this->mysql->query($query);
    }

    public function desconectar() {
        $this->mysql->close();
    }

}
