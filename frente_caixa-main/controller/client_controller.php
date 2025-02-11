<?php 

class client_controller extends render_view
{
    public function render_register_client()
    {
        
        $this->load_view('register_client_view',[]);
    }

    public function register_client()
    {
        function consultarCep($cep) {
            $cep = preg_replace("/[^0-9]/", "", $cep);
            $url = "https://viacep.com.br/ws/$cep/json/";

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            $response = curl_exec($ch);
            curl_close($ch);

            $dados = json_decode($response, true) ?? []; 
            if (!is_array($dados) || empty($dados) || isset($dados['erro'])) {
                die("Erro ao consultar o CEP. Verifique o valor informado.");
            }


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

        
        $log = $dados['logradouro'];
        $burgh = $dados['bairro'];
        $city = $dados['localidade'];
        $state = $dados['uf'];
        $ibge = $dados['ibge'];
        if($cpf == ""){
            $cpf = $cnpj;
        }
        $client = new client_model();
        $this->load_view('menu_view', ['client' => $client->register_client($name,$sex,$email,$code,$date,$nature,$cpf,$ie,$rg,$cep,$number,$log,$burgh,$city,$state,$ibge)]);
    }

    public function render_register_promotion(){
        $client = new client_model();
        $item = new item_model();

        $clientsData = $client->fetch();
        $itemsData = $item->fetch();

        $this->load_view('register_promotion_view', [
            'client' => $clientsData,
            'item' => $itemsData
        ]);

    }

    public function register_promotion()
    {
        $client = $_POST['client'];
        $itens = $_POST['item']; // Array de itens
        $discount = $_POST['discount'];
        $description = $_POST['obs'];

        if($discount > 100){
            echo "<script>alert('Insira um valor menor do que 100% no campo desconto');window.location.href = '/frente_caixa-main/render_register_promotion';</script>";
            return;
        }

        $client_model = new client_model();
        $success = $client_model->register_promotion($client, $itens, $discount, $description);

        if ($success) {
            echo "<script>alert('Promoção cadastrada com sucesso'); window.location.href = '/frente_caixa-main/menu_view';</script>";

        } else {
            echo "<script>alert('Erro ao tentar cadastrar promoção'); window.location.href = '/frente_caixa-main/register_promotion_view';</script>";
        }
    }
    
}
