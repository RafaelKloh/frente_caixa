<?php 

class client_controller extends render_view
{
    public function render_register_client()
    {
        //$client = new client_model();
        $this->load_view('register_client_view',[]);
    }

    public function register_client()
    {
        function consultarCep($cep) {
            $cep = preg_replace("/[^0-9]/", "", $cep); // Remove caracteres não numéricos
            $url = "https://viacep.com.br/ws/$cep/json/";

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            $response = curl_exec($ch);
            curl_close($ch);

            $dados = json_decode($response, true);

            if (isset($dados['erro'])) {
                return "CEP não encontrado!";
            }

            return $dados;
        }


        $name = $_POST['name'];
        $sex = $_POST['sex'];
        $email = $_POST['email'];
        $code = $_POST['code'];
        $date = $_POST['date'];
        $nature = $_POST['nature'];
        $cpf = $_POST['cpf'];
        $cnpj = $_POST['cnpj'];
        $ie = $_POST['ie'];
        $rg = $_POST['rg'];
        $cep = $_POST['cep'];
        $number = $_POST['number'];
        $dados = consultarCep($cep);

        if (is_array($dados)) {
            echo "<strong>CEP:</strong> " . $dados['cep'] . "<br>";
            echo "<strong>Logradouro:</strong> " . $dados['logradouro'] . "<br>";
            echo "<strong>Bairro:</strong> " . $dados['bairro'] . "<br>";
            echo "<strong>Cidade:</strong> " . $dados['localidade'] . "<br>";
            echo "<strong>Estado:</strong> " . $dados['uf'] . "<br>";
            echo "<strong>DDD:</strong> " . $dados['ddd'] . "<br>";
            echo "<strong>IBGE:</strong> " . $dados['ibge'] . "<br>";
        } else {
            echo $dados;
        }
        $log = $dados['logradouro'];
        $burgh = $dados['bairro'];
        $city = $dados['localidade'];
        $state = $dados['estado'];
        $ibge = $dados['ibge'];
        if($cpf == ""){
            $cpf = $cnpj;
        }
        $client = new client_model();
        $this->load_view('home_view', ['client' => $client->register_client($name,$sex,$email,$code,$date,$nature,$cpf,$ie,$rg,$cep,$number,$log,$burgh,$city,$state,$ibge)]);
        


    }
    
}