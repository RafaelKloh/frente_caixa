<?php 
$routs = [
    '/' => 'home_controller@index',
    '/users/{id}' => 'user_controller@show',
    '/authentication' => 'user_controller@authentication',
    '/user_register_load_view' => 'user_controller@user_register_load_view',
    '/user_register' => 'user_controller@user_register',
    '/render_register_item' => 'item_controller@render_register_item'
    
];
