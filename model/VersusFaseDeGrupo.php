<?php


class VersusFaseDeGrupo{
    
    private $id;
    private $nombreVisita;
    private $insigniaVisita;
    private $nombreLocal;
    private $insigniaLocal;


    public function __construct($id,$nombreVisita,$insigniaVisita,$nombreLocal,$insigniaLocal){
        $this->id= $id;
        $this->nombreVisita= $nombreVisita;
        $this->insigniaVisita= $insigniaVisita;
        $this->nombreLocal= $nombreLocal;
        $this->insigniaLocal= $insigniaLocal;

    
    }


    

    public function getId(){
        
        return $this->id;
    }


    public function getNombreVisita(){
        
        return $this->nombreVisita;
    }

    
    public function getInsigniaVisita(){
        
        return $this->insigniaVisita;
    }

    public function getNombreLocal(){
        
        return $this->nombreLocal;
    }

    
    public function getInsigniaLocal(){
        
        return $this->insigniaLocal;
    }
    
    public function setId($id){
        $this->id = $id;
    }


    public function setNombreVisita($nombreVisita){
        $this->nombreVisita = $nombreVisita;
    }


    public function setInsigniaVisita($insigniaVisita){
        $this->insigniaVisita = $insigniaVisita;
    }

    public function setNombreLocal($nombreLocal){
        $this->nombreLocal = $nombreLocal;
    }


    public function setInsigniaLocal($insigniaLocal){
        $this->insigniaLocal = $insigniaLocal;
    }

}