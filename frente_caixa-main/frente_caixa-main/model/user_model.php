<?php

class user_model extends database{
    private $pdo;

    public function __construct(){
        $this->pdo = $this->get_connection();
    }

    public function fetch(){
        $stm = $this->pdo->query("SELECT * FROM usuario ");
        if($stm->rowCount() > 0){
            return $stm->fetchAll(PDO::FETCH_ASSOC);
        }
        else{
            return [];
        }
    }

    public function fetch_user($login, $password) {
        $stm = $this->pdo->query("SELECT * FROM usuario WHERE login_usuario = '$login' AND senha = '$password'");
        if($stm->rowCount() > 0){
            return $stm->fetchAll(PDO::FETCH_ASSOC);
        }
        else{
            echo "<script>alert('Usuário ou senha incorretos.'); window.location.href = '/frente_caixa-main/';</script>";
            exit;
        }
    }
    public function user_register($name,$login,$password){
        $stm = $this->pdo->query("INSERT INTO usuario(nome,ativo,login_usuario,id_grupo_usuario,senha) VALUES ('$name','Sim','$login',1,'$password')");
    }
    public function register_user($name,$login,$password,$group)
    {
        $stm = $this->pdo->query("INSERT INTO usuario(nome,ativo,login_usuario,id_grupo_usuario,senha) VALUES ('$name','Sim','$login','$group','$password')");

    }
    
}