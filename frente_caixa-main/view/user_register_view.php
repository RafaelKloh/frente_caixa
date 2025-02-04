<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/frente_caixa-main/global_style.css">

</head>
<body>
    <form action="user_register" method = "POST">
        <p>Nome</p>
        <br>
        <input type="text" name="name" placeholder = "nome" required>
        <br>
        <p>Login</p>
        <br>
        <input type="e-mail" name = "login" placeholder = "e-mail" required>
        <br>
        <p>Senha</p>
        <br>
        <input type="password" name = "password" placeholder = "senha" required>
        <br>
        <br>
        <button type = "submite">Cadastrar</button>
    </form>
</body>
</html>