<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $title ?></title>
</head>
<body>
    <ul>
        <?php foreach($users as $item){ ?>
        <li><?php echo $item['nome'];?></li>
        <li><?php echo $item['login'];?></li>
        <?php }?>    
    </ul>
</body>
</html>