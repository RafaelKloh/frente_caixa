<?php

class user_controller extends render_view
{

    public function show($id)
    {
        $id_user = $id[0];
        $user = new user_model();
        $this->load_view('users', ['user' => $user->fetch_by_id($id_user)]);
    }

    public function authentication()
    {
       $login = $_POST['login'];
       $password = $_POST['password'];
       $user = new user_model();
       $this->load_view('menu_view', ['user' => $user->fetch_user($login,$password)]);
       
    }

    public function user_register_load_view()
    {
        $item = new item_model();
        $this->load_view('user_register_view',[]);
    }
    public function user_register()
    {
        $name = $_POST['name'];
        $login = $_POST['login'];
        $password = $_POST['password'];
        $user = new user_model();
        $this->load_view('home_view', ['user' => $user->user_register($name,$login,$password)]);
    }
    public function render_register_user()
    {
        
        $this->load_view('register_user_view',[]);
    }
    public function register_user()
    {
        $name = $_POST['name'];
        $login = $_POST['login'];
        $password = $_POST['password'];
        $group = $_POST['user_group'];
        $user = new user_model();
       $this->load_view('menu_view', ['user' => $user->register_user($name,$login,$password,$group,$user)]);
    }
    
}