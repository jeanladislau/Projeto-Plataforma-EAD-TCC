<?php
$pdo = new PDO('mysql:host=localhost; dbname=Prod_school', 'root', 'Admin@10g');


// Exebir usuário 
$verificaCredenciais = $pdo->prepare("SELECT * FROM view_credenciais Where usuario= ? and SENHA= ?");
$verificaCredenciais->execute(array($nome, $data));
$exibe_credenciais = $verificaCredenciais->fetchAll();

echo $exibe_credenciais ['usuario'];
?>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" type="image/x- icon " href="../images/logo.png" />

        <!-- links fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
        
        <!-- bootstrap -->
        <link rel="stylesheet" type="text/css" href="../css/style.css" media="screen" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <title>Cadastro Concluído</title>
    </head>

    <body class="container-tela">   
        <header>
            <div class="login-navbar">
                <div class="login-navbar-logo"><img src="../images/logo.png" alt=""></div>
                <div class="login-navbar-paginacao"><p>CADASTRO</p></div>
                <div class="login-navbar-btncadastro"><a href="./login.html">IR PARA LOGIN</a></div>
            </div>
        </header>

        <div class="body-cadastro">

            <div class="container-cadastro">

                <div class="container-concluido"> <p>Cadastro Realizado Com Sucesso!</p></div>
                <div class="container-info-login"> <p>Usuário:<span style ="color: #BF0404"> ♦</span></p> <p>Senha:<span style ="color: #BF0404">♣</span></p></div>
                <div class="container-vapara">VÁ PARA A ABA LOGIN</div>
            </div>

            <div class="container-cadastro-image">
                <img src="../images/processo3.jpg" style = "width: 628px;" alt="">
            </div>
        </div>
        
        
        
        
        
        
        
        <!-- script boostrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        
    </body>

</html>