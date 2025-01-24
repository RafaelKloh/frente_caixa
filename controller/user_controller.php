<?php

class user_controller extends render_view
{
    public function index(){

    }

    public function show($id)
    {
        $id_user = $id[0];
        $user = new user_model();
        $this->load_view('users', ['user' => $user->fetch_by_id($id_user)]);
    }
}