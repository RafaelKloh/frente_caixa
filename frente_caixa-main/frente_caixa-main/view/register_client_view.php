<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Cliente</title>
    <link rel="stylesheet" href="/frente_caixa-main/global_style.css">
    <link rel="stylesheet" href="/frente_caixa-main/client.css">

    <script>
        function toggleFields() {
            let nature = document.getElementById("nature").value;
            
            // Exibe CPF apenas se for pessoa física
            document.getElementById("cpf_field").style.display = (nature === "fisica") ? "block" : "none";
            
            // Exibe CNPJ e IE se for pessoa jurídica
            let isJuridical = (nature === "juridica");
            document.getElementById("cnpj_field").style.display = isJuridical ? "block" : "none";
            document.getElementById("ie_field").style.display = isJuridical ? "block" : "none";
        }
    </script>
</head>
<body>
    <h1>Cadastrar Cliente</h1>
    <form action="register_client" method="POST">
        <p>Nome</p>
        <input type="text" name="name">
        
        <p>Sexo</p>
        <select name="sex" id="sex">
            <option value="masc">Masculino</option>
            <option value="fem">Feminino</option>
        </select>

        <p>E-mail</p>
        <input type="email" name="email">
        
        <p>Data de Nascimento</p>
        <input type="date" name="date">

        <p>Código</p>
        <input type="number" name = "code">
        
        <p>Natureza</p>
        <select name="nature" id="nature" onchange="toggleFields()">
            <option value="">Selecione...</option>
            <option value="fisica">FÍSICA</option>
            <option value="juridica">JURÍDICA</option>
        </select>

        <div id="cpf_field" style="display: none;">
            <p>CPF</p>
            <input type="text" name="cpf">
        </div>

        <div id="cnpj_field" style="display: none;">
            <p>CNPJ</p>
            <input type="text" name="cnpj">
        </div>
        <div id="ie_field" style="display: none;">
            <p>Inscrição Estadual (IE)</p>
            <input type="text" name="ie">
        </div>
        <br>
        <p>RG</p>
        <br>
        <input type="number" name = "rg">
        <br>
        <p>CEP</p>
        <br>
        <input type="number" name = "cep">
        <br>
        <p>NUMERO</p>
        <br>
        <input type="number" name = "number">
        <br><br>
        <button type="submit">Cadastrar</button>
    </form>
</body>
</html>
