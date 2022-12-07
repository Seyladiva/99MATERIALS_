<?
include 'koneksi.php';
$koneksi    = mysqli_connect($host, $user, $pass ,$name);;
if (isset($_POST['konfirmasi'])) {
$username=$_POST['username'];
$nama_lengkap=$_POST['nama_lengkap'];
$kata_sandi=$_POST['password'];
$alamat_rumah=$_POST['alamat_rumah'];
$no_telepon=$_POST['no_telepon'];
$tanggal_lahir=$_POST['tanggal_lahir'];
$alamat_email=$_POST['alamat_email'];
}
$query="INSERT INTO daftar VALUES('$username','$nama_lengkap','$kata_sandi','$alamat_rumah','$no_telepon','$tanggal_lahir','$alamat_email')";

mysqli_query($koneksi,$query);
header('Location:masuk.php');
?>  