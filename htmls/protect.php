<?php
if (!isset($_SESSION)) {
    session_start();


}
if(!isset($_SESSION['nome'])){
die("<script>alert('Você não pode acessar está pagina! Faça login');
location.href=('login.html');
</script>");
die;
}

?>
