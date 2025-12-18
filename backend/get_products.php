<?php
include 'koneksi.php';
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: http://localhost');
header('Access-Control-Allow-Methods: GET, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

function log_error($msg) {
    file_put_contents(__DIR__ . '/error.log', date('[Y-m-d H:i:s] ') . $msg . PHP_EOL, FILE_APPEND);
}

$query = "SELECT * FROM products";
$result = mysqli_query($conn, $query);

if (!$result) {
    log_error('get_products query failed: ' . mysqli_error($conn));
    http_response_code(500);
    echo json_encode(['success' => false, 'error' => 'Internal server error']);
    exit;
}

$data = [];
while ($row = mysqli_fetch_assoc($result)) {
    // Map DB fields to frontend expected keys
    $data[] = [
        'id' => (string)$row['product_id'],
        'name' => $row['product_name'],
        'category' => isset($row['category']) ? $row['category'] : 'lainnya',
        'price' => (int)$row['price'],
        'stock' => isset($row['stock']) ? (int)$row['stock'] : 0,
        'description' => isset($row['description']) ? $row['description'] : '',
        'image' => isset($row['image']) ? $row['image'] : ''
    ];
}

echo json_encode(['success' => true, 'data' => $data]);
?>
