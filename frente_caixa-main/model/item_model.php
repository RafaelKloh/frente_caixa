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
            
        } else {
            echo "Erro ao cadastrar o item. Verifique os dados e tente novamente.";
        }
    }

    public function fetch(){
        $stm = $this->pdo->query("SELECT * FROM item");
        if($stm->rowCount() > 0){
            return $stm->fetchAll(PDO::FETCH_ASSOC);
        }
        else{
            echo "juro kkkkk";
            return [];
        }
    }

    public function fetch_promotion()
    {
        $stm = $this->pdo->query("SELECT 
            c.nome AS cliente,
            pp.desconto AS percentual_desconto,
            i.denominacao AS item,
            i.preco AS preco_original,
            (i.preco - (i.preco * pp.desconto / 100)) AS preco_com_desconto
            FROM cliente c
            JOIN pacote_preco pp ON c.id_pacote_preco = pp.id_pacote_preco
            JOIN pacote_itens pi ON pp.id_pacote_preco = pi.id_pacote_preco
            JOIN item i ON pi.item = i.id_item;
");
        if($stm->rowCount() > 0){
            return $stm->fetchAll(PDO::FETCH_ASSOC);
        }
        else{
            echo "juro kkkkk";
            return [];
        }
    }
}