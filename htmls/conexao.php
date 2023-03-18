<?php
try {
  $conn = new PDO('mysql:host=localhost;dbname=projeto_escola', 'root', null);
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

} catch(PDOException $e) {
    echo 'Erro com banco de dados: ' . $e->getMessage();

}
catch(Exception $e){
    echo 'ERRO generico: '. $e->getMessage();
}
?>
