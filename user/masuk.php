<?php
session_start();

$username="";
$password="";
?>

<!DOCTYPE html>
<html>
<head>
	<title>masuk</title>
	<link rel="stylesheet" href="dsn_login.css">
</head>
<body>
	<div class="main">  	
		<input type="checkbox" id="chk" aria-hidden="true">

			<div class="masuk">
				<form action="proses_masuk.php" method="POST">
					<label for="chk" aria-hidden="true">Masuk</label>
					<input type="text" name="username" placeholder="Nama pengguna" required="" value="<?php echo $username ?>">
					<input type="password" name="password" placeholder="Kata sandi" required="" value="<?php echo $password ?>">
					<button><href="index.html">Masuk</href></button>
				</form>
			</div>
	</div>
</body>
</html>