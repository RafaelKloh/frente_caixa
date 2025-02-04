<?php 

class item_controller extends render_view
{
    public function render_register_item()
    {
        $item = new item_model();
        $this->load_view('register_item',['item' => $item->get_category()]);
    }
    public function register_item()
    {
        $name = $_POST['name'];
        $price = $_POST['price'];
        $code = $_POST['code'];
        $code_bar = $_POST['code_bar'];
        $unit = $_POST['unit'];
        $stock = $_POST['stock'];
        $category = $_POST['category'];
        $commission = $_POST['commission'];
        $item = new item_model();
        $this->load_view('menu_view',['item' => $item->register_item($name,$price,$code,$code_bar,$unit,$stock,$category,$commission)]);
    }

    public function render_list_promotion()
    {
        $item = new item_model();
        $this->load_view('list_promotion_view',['list' => $item->fetch_promotion()]);
    }
}