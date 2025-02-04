<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/frente_caixa-main/global_style.css">

</head>
<body>
    <h1>Cadastrar Promoção</h1>
    <form action="register_promotion" method="POST">
        <p>Cliente</p>
        <br>
        <select name="client" id="client">
            <?php
             foreach ($client as $c) {
                echo "<option value='" . $c['id_cliente'] . "'>" . $c['nome'] . "</option>";
            } 
            ?>
        </select>
        <br>
        <p>Item</p>
        <br>
        <select name="item[]" id="item" multiple>
            <?php
                foreach ($item as $i) {
                    echo "<option value='" . $i['id_item'] . "'>" . $i['denominacao'] . "</option>";
                } 
            ?>
        </select>
        <br>
        <p>Porcentagem de desconto</p>
        <br>
        <input type="number" name = "discount">
        <br>
        <p>Observações</p>
        <br>
        <input type="text" name = "obs">
        <br>
        <br>
        <button type ="submit">Cadastrar</button>
    </form>
</body>
</html>