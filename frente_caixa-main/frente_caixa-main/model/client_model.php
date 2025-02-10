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

    public function fetch(){
        $stm = $this->pdo->query("SELECT id_cliente, nome, email FROM cliente;
SELECT id_item, descricao, preco FROM item;
");
        if($stm->rowCount() > 0){
            return $stm->fetchAll(PDO::FETCH_ASSOC);
        }
        else{
            echo "juro kkkkk";
            return [];
        }
    }

    public function register_promotion($client, $itens, $discount, $description)
{
    try {
        $this->pdo->beginTransaction(); 
        $sql_pacote = "INSERT INTO pacote_preco (descricao, cliente, desconto) VALUES (:description, :client, :discount)";
        $stmt = $this->pdo->prepare($sql_pacote);
        $stmt->execute([
            ':description' => $description,
            ':client'   => $client,
            ':discount'  => $discount
        ]);

        $id_pacote = $this->pdo->lastInsertId();

        $sql_item = "INSERT INTO pacote_itens (id_pacote_preco, item) VALUES (:id_pacote, :item)";
        $stmt_item = $this->pdo->prepare($sql_item);

        foreach ($itens as $item) {
            $stmt_item->execute([
                ':id_pacote' => $id_pacote,
                ':item'      => $item
            ]);
        }

        $sql_update_cliente = "UPDATE cliente SET id_pacote_preco = :id_pacote WHERE id_cliente = :client";
        $stmt_update = $this->pdo->prepare($sql_update_cliente);
        $stmt_update->execute([
            ':id_pacote' => $id_pacote,
            ':client'    => $client
        ]);

        $this->pdo->commit();
        return true;
    } catch (Exception $e) {
        $this->pdo->rollBack();
        return false;
    }
}

}