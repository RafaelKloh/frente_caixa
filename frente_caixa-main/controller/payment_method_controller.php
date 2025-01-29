<?php
class payment_method_controller extends render_view 
{
    public function render_register_payment_method(){
        $this->load_view('render_paymetn_method',[]);
    }

    public function register_payment_method(){
        $name = $_POST['name']
        $payment_method = new payment_method_model();
    }
}