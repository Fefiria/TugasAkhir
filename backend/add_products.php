<?php
include 'koneksi.php';
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: http://localhost');
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

function log_error($msg) {
	file_put_contents(__DIR__ . '/error.log', date('[Y-m-d H:i:s] ') . $msg . PHP_EOL, FILE_APPEND);
}

// Handle preflight
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
	http_response_code(204);
	exit;
}

// Accept form-data (POST) or raw JSON
$input = $_POST;
if (empty($input)) {
	$raw = file_get_contents('php://input');
	$json = json_decode($raw, true);
	if (is_array($json)) $input = $json;
}

$name        = isset($input['product_name']) ? trim($input['product_name']) : null;
$price       = isset($input['price']) ? intval($input['price']) : null;
$stock       = isset($input['stock']) ? intval($input['stock']) : 0;
$category    = isset($input['category']) ? trim($input['category']) : 'lainnya';
$description = isset($input['description']) ? trim($input['description']) : '';
$image       = isset($input['image']) ? trim($input['image']) : '';

if (!$name || $price === null) {
	http_response_code(400);
	echo json_encode(['success' => false, 'error' => 'product_name dan price wajib diisi']);
	exit;
}

$sql = "INSERT INTO products (product_name, price, stock, category, description, image) VALUES (?, ?, ?, ?, ?, ?)";
$stmt = mysqli_prepare($conn, $sql);
if (!$stmt) {
	log_error('add_products prepare failed: ' . mysqli_error($conn));
	http_response_code(500);
	echo json_encode(['success' => false, 'error' => 'Internal server error']);
	exit;
}

// Bind params (by reference) and execute
if (!mysqli_stmt_bind_param($stmt, 'siisss', $name, $price, $stock, $category, $description, $image)) {
	log_error('add_products bind_param failed');
	http_response_code(500);
	echo json_encode(['success' => false, 'error' => 'Internal server error']);
	mysqli_stmt_close($stmt);
	exit;
}

$exec = mysqli_stmt_execute($stmt);
if ($exec) {
	$insert_id = mysqli_insert_id($conn);
	// Return product in frontend shape
	$product = [
		'id' => (string)$insert_id,
		'name' => $name,
		'category' => $category,
		'price' => (int)$price,
		'stock' => (int)$stock,
		'description' => $description,
		'image' => $image
	];
	echo json_encode(['success' => true, 'product' => $product]);
} else {
	log_error('add_products execute failed: ' . mysqli_stmt_error($stmt));
	http_response_code(500);
	echo json_encode(['success' => false, 'error' => 'Internal server error']);
}

mysqli_stmt_close($stmt);
exit;
?>
