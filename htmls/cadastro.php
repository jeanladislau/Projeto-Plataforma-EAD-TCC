<?php
//Distanciano conexão
$pdo = new PDO('mysql:host=localhost; dbname=projeto_escola', 'root', null);


$matricula = filter_var($_POST['cad-matricula'], FILTER_VALIDATE_INT);
$nome = $_POST['cad-nome'];
$data = $_POST['dataNasc'];
$email = $_POST['cad-email'];
$telefone = $_POST['cad-telefone'];


// Verifica se a matricula já existe no banco 
$verificaMatricula = $pdo->prepare("SELECT COUNT(*) FROM TBLUSU WHERE Matricula = ? ");
$verificaMatricula->execute(array($matricula));
$count = $verificaMatricula->fetchColumn();

// Contar número de matricula igual entrada     
if ($count == 1) {
    header('location:Matricula_invalida.html');
    die();
} else {


// Realizar insert do formulario de Cadastro de Usuário
$cadastrarUser = $pdo->prepare("INSERT INTO TBLUSU (MATRICULA, NOME_COMP, DT_NASC, EMAIL, TELEFONE,Dt_Cad) VALUES (:MATRICULA, :NOME_COMP, :DT_NASC, :EMAIL, :TELEFONE, NOW())");
$cadastrarUser->bindValue(":MATRICULA", $matricula, PDO::PARAM_INT);
$cadastrarUser->bindValue(":NOME_COMP", $nome, PDO::PARAM_STR);
$data = implode("-", array_reverse(explode("/", $data)));
$cadastrarUser->bindValue(":DT_NASC", $data, PDO::PARAM_STR);
$cadastrarUser->bindValue(":EMAIL", $email, PDO::PARAM_STR);
$cadastrarUser->bindValue(":TELEFONE", $telefone, PDO::PARAM_STR);
$cadastrarUser->execute();


// Exebir usuário 
//$verificaCredenciais = $pdo->prepare("SELECT * FROM view_credenciais Where usuario= ? and SENHA= ?");
//$verificaCredenciais->execute(array($nome, $data));
//$exibe_credenciais = $verificaCredenciais->fetch(PDO::FETCH_ASSOC);



}
// Redirecionar para pagina de credenciais 
if ($pdo = ($cadastrarUser)) {
    header('location:cadastro_finalizado.php');
    die();



} else {
    // Executar o fechamento da conexão
    $pdo = new PDO('mysql:host=localhost; dbname=projeto_escola', 'root', null);
    $pdo = null;
    echo ("<script>alert('conexão encerrada')</script>");
    sleep(2);
}
