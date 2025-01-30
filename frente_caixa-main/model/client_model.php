<?php

class client_model extends database{

    private $pdo;

    public function __construct(){
        $this->pdo = $this->get_connection();
    }

    public function register_client($name,$sex,$email,$code,$date,$nature,$cpf,$ie,$rg,$cep,$number,$log,$burgh,$city,$state,$ibge)
    {
        $stm = $this->pdo->query("INSERT INTO cliente(nome,email,nascimento,codigo,natureza,cnpj_cpf,rg,ie,cep,logradouro,bairro,cidade,estado,id_cidade_ibge,numero,ativo,sexo)
        values('$name','$email','$date','$code','$nature','$cpf','$rg','$ie','$cep','$log','$burgh','$city','$state','$ibge','$number','Sim','$sex')");
        
    }
}