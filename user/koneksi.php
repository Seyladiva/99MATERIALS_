<?php
$host    = "localhost";
$user    = "root";
$pass    = "";
$db    = "materials";

$koneksi    = mysqli_connect($host, $user, $pass ,$db);
if(!$koneksi){
    die ("Koneksi gagal");
}
?>