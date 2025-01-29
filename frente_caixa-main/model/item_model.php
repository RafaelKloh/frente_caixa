<?php 

class item_model extends database
{
    private $pdo;

    public function __construct(){
        $this->pdo = $this->get_connection();
    }

    public function get_category(){
        $stm = $this->pdo->query("SELECT * FROM categoria");
        if($stm->rowCount() > 0){
            return $stm->fetchAll(PDO::FETCH_ASSOC);
        }
        else{
            echo "juro kkkkk";
            return [];
        }
    }

    public function register_item($name,$price,$code,$code_bar,$unit,$stock,$category,$commission)
    {
        $stmt = $this->pdo->prepare("INSERT INTO
         item(denominacao,preco,codigo,codigo_barra,unidade_medida,saldo_estoque_atual,id_categoria,registra_comissao,ativo) 
         VALUES ('$name','$price','$code','$code_bar','$unit','$stock','$category','$commission','Sim')");
        if ($stmt->execute()) {
            echo "Item cadastrado com sucesso! $category jdsjf";
        } else {
            echo "Erro ao cadastrar o item. Verifique os dados e tente novamente.";
        }
    }
}