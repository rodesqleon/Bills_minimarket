<?php
	include_once('connection_bills.php');
	//Call object of class connection and create a new connection to my localhost database
	$connection = new createConnection(); 
	$connection->connectToDatabase();
	$connection->selectDatabase();
	mysql_query('SET CHARACTER SET utf8');
	if($_SERVER['REQUEST_METHOD'] == "POST"){
	// Get data
	$day = isset($_POST['day']) ? mysql_real_escape_string($_POST['day']) : "";
	$month = isset($_POST['month']) ? mysql_real_escape_string($_POST['month']) : "";
	$year = isset($_POST['year']) ? mysql_real_escape_string($_POST['year']) : "";
	$receipt_number = isset($_POST['receipt_number']) ? mysql_real_escape_string($_POST['receipt_number']) : "";
	$supplier = isset($_POST['supplier']) ? mysql_real_escape_string($_POST['supplier']) : "";
	$rut = isset($_POST['rut']) ? mysql_real_escape_string($_POST['rut']) : "";
	$account_charge = isset($_POST['account_charge']) ? mysql_real_escape_string($_POST['account_charge']) : "";
	$purchase_value = isset($_POST['purchase_value']) ? mysql_real_escape_string($_POST['purchase_value']) : "";
	$iva = isset($_POST['iva']) ? mysql_real_escape_string($_POST['iva']) : "";
	$receipt_value = isset($_POST['receipt_value']) ? mysql_real_escape_string($_POST['receipt_value']) : "";
	$comment = isset($_POST['comment']) ? mysql_real_escape_string($_POST['comment']) : "";


	/* HARDCORE DATA
	$day = "1";
	$month = "12";
	$year = "2016";
	$bill_value = "200";
	$initial_bill = "99600";
	$end_bill = "99602";
	$bill_number = "200";*/

	// Insert data into data base
	$sql = "INSERT INTO `receipts` (`id`, `day`, `month`, `year`, `receipt_number`, `supplier`, `rut`, `account_charge`, `purchase_value`, `iva`, `receipt_value`, `comment`) VALUES (NULL, '$day', '$month', '$year', '$receipt_number', '$supplier', '$rut', '$account_charge', '$purchase_value', '$iva', '$receipt_value', '$comment');";
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