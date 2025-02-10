<?php 
$routs = [
    '/' => 'home_controller@index',
    '/users/{id}' => 'user_controller@show',
    '/authentication' => 'user_controller@authentication',
    '/user_register_load_view' => 'user_controller@user_register_load_view',
    '/user_register' => 'user_controller@user_register',
    '/render_register_item' => 'item_controller@render_register_item',
    '/register_item' => 'item_controller@register_item',
    '/render_register_user' => 'user_controller@render_register_user',
    '/register_user' => 'user_controller@register_user',
    '/render_register_payment_method' => 'payment_method_controller@render_register_payment_method',
    '/register_payment_method' => 'payment_method_controller@register_payment_method',
    '/render_register_client' => 'client_controller@render_register_client',
    '/register_client' => 'client_controller@register_client',
    '/render_register_promotion' => 'client_controller@render_register_promotion',
    '/register_promotion' => 'client_controller@register_promotion',
    '/menu_view' => 'home_controller@render_menu_view',
    '/render_list_promotion' => 'item_controller@render_list_promotion'
    
];
