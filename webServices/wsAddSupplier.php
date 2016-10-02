<?php
	include_once('connection_bills.php');
	//Call object of class connection and create a new connection to my localhost database
	$connection = new createConnection(); 
	$connection->connectToDatabase();
	$connection->selectDatabase();
	mysql_query('SET CHARACTER SET utf8');
	if($_SERVER['REQUEST_METHOD'] == "POST"){
	// Get data
	$name = isset($_POST['name']) ? mysql_real_escape_string($_POST['name']) : "";
	$rut = isset($_POST['rut']) ? mysql_real_escape_string($_POST['rut']) : "";

	/* HARDCORE DATA
	$day = "1";
	$month = "12";
	$year = "2016";
	$bill_value = "200";
	$initial_bill = "99600";
	$end_bill = "99602";
	$bill_number = "200";*/

	// Insert data into data base
	$sql = "INSERT INTO `suppliers` (`id`, `name`, `rut`) VALUES (NULL, '$name', '$rut');";
	$qur = mysql_query($sql);
		if($qur){
			$json = array("status" => "OK", "msg" => "Product added successfull!");
		}else{
			$json = array("status" => "NOK", "msg" => "Error occur adding user!");
		}
	}else{
		$json = array("status" => "NOK", "msg" => "Request method not accepted");
	}

@mysql_close($conn);

/* Output header */
	header('Content-type: application/json');
	echo json_encode($json);

	//Close connection
	$connection->closeConnection();
?>