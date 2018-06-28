<?php


class VersusFaseFinal{
    
    private $id;
    private $nombreVisita;
    private $insigniaVisita;
    private $nombreLocal;
    private $insigniaLocal;
    private $idVisita;
    private $idLocal;
    private $tipoPartido;


    public function __construct($id,$nombreVisita,$insigniaVisita,$nombreLocal,$insigniaLocal,$idVisita,$idLocal,$tipoPartido){
        $this->id= $id;
        $this->nombreVisita= $nombreVisita;
        $this->insigniaVisita= $insigniaVisita;
        $this->nombreLocal= $nombreLocal;
        $this->insigniaLocal= $insigniaLocal;
        $this->idVisita= $idVisita;
        $this->idLocal= $idLocal;
        $this->tipoPartido = $tipoPartido;    
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

    public function getIdVisita(){
        
        return $this->idVisita;
    }

    public function getIdLocal(){
        
        return $this->idLocal;
    }

    public function getTipoPartido(){
        
        return $this->tipoPartido;
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

    public function setIdVisita($idVisita){
        $this->idVisita = $idVisita;
    }

    public function setIdLocal($idLocal){
        $this->idLocal = $idLocal;
    }


    public function setTipoPartido($tipoPartido){
        $this->tipoPartido = $tipoPartido;
    }

}