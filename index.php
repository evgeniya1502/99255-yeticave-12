<?php

include $_SERVER['DOCUMENT_ROOT']."/helpers.php";

$is_auth = rand( 0, 1 );

$user_name = 'Evgeniya';

$con = mysqli_connect("localhost", "root", "", "yeticave");
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
mysqli_set_charset($con, "utf8mb4");
$sql = "SELECT category FROM categories";
$result = mysqli_query($con, $sql);
$categories = mysqli_fetch_all($result, MYSQLI_ASSOC);

//$categories = ["Доски и лыжи", "Крепления", "Ботинки", "Одежда", "Инструменты", "Разное"];

$slots = [
    [
        'title' => '2014 Rossignol District Snowboard',
        'category' => 'Доски и лыжи',
        'price' => '10999',
        'url' => 'img/lot-1.jpg',
        'fin_date' => '2022-07-08',
    ],

    [
        'title' => 'DC Ply Mens 2016/2017 Snowboard',
        'category' => 'Доски и лыжи',
        'price' => '159999',
        'url' => 'img/lot-2.jpg',
        'fin_date' => '2022-07-10',
    ],

    [
        'title' => 'Крепления Union Contact Pro 2015 года размер L/XL',
        'category' => 'Крепления',
        'price' => '8000',
        'url' => 'img/lot-3.jpg',
        'fin_date' => '2022-07-20',
    ],
    [
        'title' => 'Ботинки для сноуборда DC Mutiny Charocal',
        'category' => 'Ботинки',
        'price' => '10999',
        'url' => 'img/lot-4.jpg',
        'fin_date' => '2022-09-12'
    ],
    [
        'title' => 'Куртка для сноуборда DC Mutiny Charocal',
        'category' => 'Одежда',
        'price' => '7500',
        'url' => 'img/lot-5.jpg',
        'fin_date' => '2022-07-15',
    ],
    [
        'title' => 'Маска Oakley Canopy',
        'category' => 'Разное',
        'price' => '5400',
        'url' => 'img/lot-6.jpg',
        'fin_date' => '2022-07-09',
    ],
];

$data = [
    'categories' => $categories,
    'slots' => $slots,
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
