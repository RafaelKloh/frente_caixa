<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Descontos</title>
    <link rel="stylesheet" href="/frente_caixa-main/global_style.css">
    <link rel="stylesheet" href="/frente_caixa-main/list_promotion.css">
</head>
<body>

    <h2>Lista de Descontos</h2>

    <table>
        <tr>
            <th>Cliente</th>
            <th>Item</th>
            <th>Preço Original</th>
            <th>Desconto (%)</th>
            <th>Preço com Desconto</th>
        </tr>
        
        <?php foreach ($list as $l): ?>
            <tr>
                <td><?= htmlspecialchars($l['cliente']); ?></td>
                <td><?= htmlspecialchars($l['item']); ?></td>
                <td>R$ <?= number_format($l['preco_original'], 2, ',', '.'); ?></td>
                <td><?= $l['percentual_desconto']; ?>%</td>
                <td><strong>R$ <?= number_format($l['preco_com_desconto'], 2, ',', '.'); ?></strong></td>
            </tr>
        <?php endforeach; ?>
    </table>

</body>
</html>
