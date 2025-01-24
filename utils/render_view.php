<?php

class render_view{
    public function load_view($view,$args){
        extract($args);
        require_once __DIR__."/../view/.$view.php";
    }
}