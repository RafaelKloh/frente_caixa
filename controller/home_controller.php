<?php

class home_controller extends render_view
{
    public function index(){
        $this->load_view('home',[
            'title' => 'Home Page',
            'user' => 'TOMARA QUE ISSO FUNCIONE PQ N QUERO OUVIR CHORO DA SOFIA NO MEU OUVIDO'
        ]);
    }
}