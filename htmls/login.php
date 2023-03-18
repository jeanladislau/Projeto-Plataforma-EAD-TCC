<?php
session_start();
//istanciano conexão
$pdo = new PDO('mysql:host=localhost; dbname=projeto_escola', 'root', null);

    $nome = $_POST['nome'];
    $senha = $_POST['senha'];


//Verificar credenciais de login
    $verificaLogin = $pdo->prepare("SELECT  concat(substring(aln.descricao, 1,1), substring_index(aln.descricao,' ',-1)), date_format(aln.dtnasc, '%d%m%Y') 
    FROM TBLALN ALN WHERE  concat(substring(aln.descricao, 1,1), substring_index(aln.descricao,' ',-1)) = ? AND date_format(aln.dtnasc, '%d%m%Y') = ? ");
    $verificaLogin->execute(array($nome,$senha));
    
    
    if( $verificaLogin->rowCount() == 1) {
        $_SESSION['nome'] = $nome;
        header('Location: home.php');
        exit(); 

    }else{
        echo("<script>
        location.href=('Matricula_invalida.html');
        </script>");
}

?>