<?php
	$connect = mysql_connect("localhost","root","root");
	mysql_select_db("webshaper", $connect);

	if(isset($_POST["username"])){
		$username=$_POST["username"];

		$query = "insert into users(username) values('$username')";
		if(mysql_query($query))
			echo "<center>Record Inserted!</center><br>";
	}
?>