<?php

include $_SERVER['DOCUMENT_ROOT']."/helpers.php";

$is_auth = rand( 0, 1 );

$user_name = 'Evgeniya';

$con = mysqli_connect("localhost", "root", "", "yeticave");
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
mysqli_set_charset($con, "utf8mb4");
$sql = "SELECT category, symbol_code FROM categories";
$result = mysqli_query($con, $sql);
$categories = mysqli_fetch_all($result, MYSQLI_ASSOC);


$sql_slots = "SELECT name, price_start, image, date_fin, IFNULL(MAX(rates.price), lots.price_start) AS price, categories.category FROM lots
LEFT JOIN rates ON lots.id = rates.lot_id
JOIN categories ON lots.category_id = categories.id
WHERE winner_id = 0 AND date_fin > CURRENT_DATE
GROUP BY lots.id
ORDER BY lots.date_create DESC";
$result_slots = mysqli_query($con, $sql_slots);
$slots = mysqli_fetch_all($result_slots, MYSQLI_ASSOC);


$data = [
    'slots' => $slots,
    'categories' => $categories,
];
$main_content = include_template('main.php', $data);

$layout_content = include_template('layout.php', [
    'is_auth' => $is_auth,
    'user_name' => $user_name,
    'title' => 'Главная',
    'main_content' => $main_content,
    'categories' => $categories,
]);
echo $layout_content;

?>
