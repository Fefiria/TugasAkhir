<?php
include 'koneksi.php';
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: http://localhost');
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

function log_error($msg) {
	file_put_contents(__DIR__ . '/error.log', date('[Y-m-d H:i:s] ') . $msg . PHP_EOL, FILE_APPEND);
}

$product_id = isset($_POST['product_id']) ? intval($_POST['product_id']) : null;
if (!$product_id) {
	http_response_code(400);
	echo json_encode(['success' => false, 'error' => 'product_id wajib dikirim']);
	exit;
}

$stmt = mysqli_prepare($conn, "DELETE FROM products WHERE product_id = ?");
if (!$stmt) {
	log_error('delete_product prepare failed: ' . mysqli_error($conn));
	http_response_code(500);
	echo json_encode(['success' => false, 'error' => 'Internal server error']);
	exit;
}

mysqli_stmt_bind_param($stmt, 'i', $product_id);
$exec = mysqli_stmt_execute($stmt);
if ($exec) {
	if (mysqli_stmt_affected_rows($stmt) > 0) {
		echo json_encode(['success' => true]);
	} else {
		http_response_code(404);
		echo json_encode(['success' => false, 'error' => 'Produk tidak ditemukan']);
	}
} else {
	log_error('delete_product execute failed: ' . mysqli_stmt_error($stmt));
	http_response_code(500);
	echo json_encode(['success' => false, 'error' => 'Internal server error']);
}

mysqli_stmt_close($stmt);

?>
