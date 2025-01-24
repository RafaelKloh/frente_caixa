<?php
class Core {
    public function run($routes) {
        $url = '/';
        isset($_GET['url']) ? $url .= $_GET['url'] : '';
        ($url != '/') ? $url = rtrim($url,'/') : $url;
        $router_found = false;

        if (is_array($routes)) {
            foreach ($routes as $path => $controller) {
                $pattern = '#^' . preg_replace('/{id}/', '(\w+)', $path) . '$#';
                if (preg_match($pattern, $url, $matches)) {
                    $router_found = true;
                    array_shift($matches);
                    [$current_controller, $action] = explode('@', $controller);
                    $controller_path = __DIR__ . "/../controller/$current_controller.php";

                    if (file_exists($controller_path)) {
                        require_once $controller_path;

                        if (class_exists($current_controller)) {
                            $new_controller = new $current_controller();

                            if (method_exists($new_controller, $action)) {
                                $new_controller->$action($matches);
                                return;
                            } else {
                                echo "Erro: Método '$action' não encontrado no controller '$current_controller'.";
                                return;
                            }
                        } else {
                            echo "Erro: Classe '$current_controller' não encontrada.";
                            return;
                        }
                    } else {
                        echo "Erro: Arquivo do controller '$current_controller.php' não encontrado.";
                        return;
                    }
                }
            }
        }

        if (!$router_found) {
            require_once __DIR__ . "/../controller/not_found_controller.php";
            $controller = new not_found_controller();
            $controller->index();
        }
    }
}
