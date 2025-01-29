<?php

class payment_method_model extends database{

    private $pdo;

    public function __construct(){
        $this->pdo = $this->get_connection();
    }

    public function register_payment_method()
    {
        $stm = $this->pdo->query("INSERT INTO forma_pagamento(denominacao)");
    }
}