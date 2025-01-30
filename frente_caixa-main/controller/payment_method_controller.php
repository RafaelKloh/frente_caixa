<?php
class payment_method_controller extends render_view 
{
    public function render_register_payment_method(){
        $payment_method = new payment_method_model();
       $this->load_view('payment_method_view', ['payment_method' => $payment_method->fetch()]);
    }

    public function register_payment_method(){
        $name = $_POST['name'];
        $receipt_type = $_POST['receipt_type'];
        $code = $_POST['code'];
        $qtd = $_POST['qtd'];
        $payment_method = new payment_method_model();
       $this->load_view('menu_view', ['payment_method' => $payment_method->register_payment_method($name,$receipt_type,$code,$qtd)]);

    }
}