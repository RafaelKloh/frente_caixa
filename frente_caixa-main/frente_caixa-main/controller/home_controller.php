<?php

class home_controller extends render_view
{
    public function index(){
        $users = new user_model();
        $this->load_view('home_view',[
            'title' => 'Home Page',
            'users' => $users->fetch()
        ]);
    }

    public function render_menu_view(){
        $this->load_view('menu_view',[]); 
    }
}