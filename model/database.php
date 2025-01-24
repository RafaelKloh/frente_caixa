<?php 
class Database{
    public function get_connection(){
        try{
            $pdo = new PDO("mysql:dbname=frente_caixa;host=localhost", "root", "");
            return $pdo;
        }
        catch (PDOException $error){
            
        }

    }
}
?>