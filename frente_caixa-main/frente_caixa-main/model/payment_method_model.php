<?php

class payment_method_model extends database{

    private $pdo;

    public function __construct(){
        $this->pdo = $this->get_connection();
    }

    public function register_payment_method($name,$receipt_type,$code,$qtd)
    {
        $stm = $this->pdo->query("INSERT INTO forma_pagamento(denominacao,id_tipo_recebimento,ativo,codigo,qnt_max_parcelas) values('$name','$receipt_type','Sim','$code','$qtd')");
    }
    public function fetch()
    {
        $stm = $this->pdo->query("SELECT * FROM tipo_recebimento");
        if($stm->rowCount() > 0){
            return $stm->fetchAll(PDO::FETCH_ASSOC);
        }
    }
}