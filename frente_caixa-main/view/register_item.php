<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/frente_caixa-main/global_style.css">

</head>
<body>
    <h1>Cadastro de item</h1>

    <form action="register_item" method = "POST">
        <p>Denominação</p>
        <br>
        <input type="text" name = "name">
        <br>
        <p>Preço</p>
        <br>
        <input type="number" name="price">
        <br>
        <p>Código</p>
        <br>
        <input type="text" name = "code">
        <br>
        <p>Codigo de barra</p>
        <br>
        <input type="text" name = "code_bar">
        <br>
        <p>Unidade de medida</p>
        <select name = "unit" id = "unit">
            <option value="kg">Kg</option>
            <option value="lt">Lt</option>    
        <select>
        <br>
        <p>Saldo em estoque</p>
        <br>
        <input type="number" name = "stock">
        <br>
        <p>Categoria</p>
        <br>
        <select name="category" id = "category"">
        <?php 
    foreach ($item as $category) {
        $id = $category['id_categoria'];
        $denominacao = $category['denominacao'];
        echo "<option value=\"$id\">$denominacao</option>";
    }
    ?>
        </select>
        <br>
        <p>Comissão</p>
        <br>
        <input type="number" name = "commission">
        <br>
        <br>
        <button type = "submite">Cadastrar</button>
    </form>
</body>
</html>