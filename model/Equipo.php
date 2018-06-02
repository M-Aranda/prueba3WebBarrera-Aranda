<?php


class Equipo{
    
    private $id;
    private $nombre;
    private $insignia;
    private $puntaje;
    private $nGolesAFavor;
    private $nGolesEnContra;
    private $diferenciaDeGoles;
    private $grupo_id;

    public function __construct($id,$nombre,$insignia,$puntaje,$nGolesAFavor,$nGolesEnContra,$diferenciaDeGoles,$grupo_id){
        $this->id= $id;
        $this->nombre= $nombre;
        $this->insignia= $insignia;
        $this->puntaje= $puntaje;
        $this->nGolesAFavor= $nGolesAFavor;
        $this->nGolesEnContra= $nGolesEnContra;
        $this->diferenciaDeGoles= $diferenciaDeGoles;
        $this->grupo_id= $grupo_id;
    
    }


    

    public function getId(){
        
        return $this->id;
    }


    public function getNombre(){
        
        return $this->nombre;
    }

    
    public function getInsignia(){
        
        return $this->insignia;
    }


    public function getPuntaje(){
        
        return $this->puntaje;
    }

    
    public function getNGolesAFavor(){
        
        return $this->nGolesAFavor;
    }


    public function getNGolesEnContra(){
        
        return $this->nGolesEnContra;
    }

    
    public function getDiferenciaDeGoles(){
        
        return $this->diferenciaDeGoles;
    }

    public function getGrupo_id(){
        
        return $this->grupo_id;
    }

    

    
    public function setId($id){
        $this->id = $id;
    }


    public function setNombre($nombre){
        $this->nombre = $nombre;
    }


    public function setInsignia($insignia){
        $this->insignia = $insignia;
    }

    public function setPuntaje($puntaje){
        $this->puntaje= $puntaje;
    }

    public function setNGolesAFavor($nGolesAFavor){
        $this->nGolesAFavor= $nGolesAFavor;
    }

    public function setNGolesEnContra($nGolesEnContra){
        $this->nGolesEnContra= $nGolesEnContra;
    }

    public function setDiferenciaDeGoles($diferenciaDeGoles){
        $this->diferenciaDeGoles= $diferenciaDeGoles;
    }

    
    public function setGrupo_id($grupo_id){
        
        $this->grupo_id=$grupo_id;
    }

}