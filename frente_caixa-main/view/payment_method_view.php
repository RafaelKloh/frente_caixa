<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>cadastrar forma de pagamento</h1>
    <form action="register_payment_method" method= "POST">
        <p>Denominação</p>
        <br>
        <input type="text" name = "name">
        <br>
        <p>tipo recebimento</p>
        <br>
        <select name="receipt_type" id = "receipt_type"">
        <?php 
    foreach ($payment_method as $type) {
        $id = $type['id_tipo_recebimento'];
        $denominacao = $type['denominacao'];
        echo "<option value=\"$id\">$denominacao</option>";
    }
    ?>
        </select>
        <br>
        <p>Código</p>
        <br>
        <input type="number" name ="code">
        <br>
        <p>Quantidade de Parcelas</p>
        <br>
        <input type="number" name = "qtd">
        <br>
        <br>
        <button type = "submite">Cadastrar</button>
    </form>
</body>
</html>