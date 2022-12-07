<?php
session_start();
// error_reporting(0);

include "koneksi.php";
$username = $_POST['username'];
$password = $_POST['password'];

$login = "";

$query = "SELECT * FROM akun WHERE username = '$username'";
$hasil = mysqli_query($koneksi, $query);
$data = mysqli_fetch_assoc($hasil);

if(isset($login)){
    if($password == $data['password'] && $username == $data['username']){
        $_SESSION['level'] = $data['admin'];
        $_SESSION['username'] = $data['username'];
        echo "<script>alert('login berhasil')</script>";
        header('Location: indexadmin.php');
	    exit;
    } else {
	    echo "<script>alert('login gagal')</script>";
        header("Location:index.php");
        exit;
    }
}
?>