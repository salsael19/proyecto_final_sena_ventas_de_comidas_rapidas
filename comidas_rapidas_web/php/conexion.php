<?php
$conexion=mysqli_connect("localhost","root","","comidas");
mysqli_set_charset($conexion,"utf8");
/*if(!$conexion){
    die("conexion error".mysqli_connect());
}else{
    echo"estas conectado";
}*/ //ya hay conexion
?>