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

// Accept form-data or JSON
$input = $_POST;
if (empty($input)) {
    $raw = file_get_contents('php://input');
    $json = json_decode($raw, true);
    if (is_array($json)) $input = $json;
}

$product_id   = isset($input['product_id']) ? intval($input['product_id']) : null;
$product_name = array_key_exists('product_name', $input) ? trim($input['product_name']) : null;
$price        = array_key_exists('price', $input) ? (is_numeric($input['price']) ? intval($input['price']) : null) : null;
$stock        = array_key_exists('stock', $input) ? (is_numeric($input['stock']) ? intval($input['stock']) : null) : null;
$category     = array_key_exists('category', $input) ? trim($input['category']) : null;
$description  = array_key_exists('description', $input) ? trim($input['description']) : null;
$image        = array_key_exists('image', $input) ? trim($input['image']) : null;

if (!$product_id) {
    http_response_code(400);
    echo json_encode(['success' => false, 'error' => 'product_id wajib dikirim']);
    exit;
}

if ($product_name === null && $price === null && $stock === null && $category === null && $description === null && $image === null) {
    http_response_code(400);
    echo json_encode(['success' => false, 'error' => 'Minimal satu field harus dikirim (product_name, price, stock, category, description, image)']);
    exit;
}

$fields = [];
$types = '';
$values = [];

if ($product_name !== null) { $fields[] = 'product_name = ?'; $types .= 's'; $values[] = $product_name; }
if ($price !== null)        { $fields[] = 'price = ?';        $types .= 'i'; $values[] = $price; }
if ($stock !== null)        { $fields[] = 'stock = ?';        $types .= 'i'; $values[] = $stock; }
if ($category !== null)     { $fields[] = 'category = ?';     $types .= 's'; $values[] = $category; }
if ($description !== null)  { $fields[] = 'description = ?';  $types .= 's'; $values[] = $description; }
if ($image !== null)        { $fields[] = 'image = ?';        $types .= 's'; $values[] = $image; }

$sql = 'UPDATE products SET ' . implode(', ', $fields) . ' WHERE product_id = ?';
$types .= 'i';
$values[] = $product_id;

$stmt = mysqli_prepare($conn, $sql);
if (!$stmt) {
    log_error('update_product prepare failed: ' . mysqli_error($conn));
    http_response_code(500);
    echo json_encode(['success' => false, 'error' => 'Internal server error']);
    exit;
}

// Bind params dynamically
$bind_names = [];
$bind_names[] = $types;
for ($i = 0; $i < count($values); $i++) {
    $bind_name = 'bind' . $i;
    $$bind_name = $values[$i];
    $bind_names[] = &$$bind_name;
}
call_user_func_array(array($stmt, 'bind_param'), $bind_names);

$exec = mysqli_stmt_execute($stmt);
if ($exec) {
    echo json_encode(['success' => true]);
} else {
    log_error('update_product execute failed: ' . mysqli_stmt_error($stmt));
    http_response_code(500);
    echo json_encode(['success' => false, 'error' => 'Internal server error']);
}

mysqli_stmt_close($stmt);

?>
