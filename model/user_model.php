<?php

class user_model extends database{
    private $pdo;

    public function __construct(){
        $this->pdo = $this->get_connection();
    }

    public function fetch(){
        $stm = $this->pdo->query("SELECT * FROM usuario");
        if($stm->rowCount() > 0){
            return $stm->fetchAll(PDO::FETCH_ASSOC);
        }
        else{
            return [];
        }
    }

    public function fetch_by_id($id){
        $stm = $this->pdo->prepare("SELECT * FROM usuario WHERE id_usuario = ?");
        $stm->execute([$id]);
        return $stm->fetch(PDO::FETCH_ASSOC);
    }
}