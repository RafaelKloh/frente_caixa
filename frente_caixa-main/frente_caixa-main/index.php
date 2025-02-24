<?php
require_once __DIR__.'/core/core.php';
require_once __DIR__.'/router/routs.php';

spl_autoload_register(function($file){
    if(file_exists(__DIR__."/utils/$file.php")){
        require_once __DIR__."/utils/$file.php";
    } 
    else if (file_exists(__DIR__."/model/$file.php")){
        require_once __DIR__."/model/$file.php";
    } 
});
$core = new Core();
$core->run($routs);