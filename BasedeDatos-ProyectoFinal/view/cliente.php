
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">    
    <title>Login Cliente</title>
</head>
<style>
    form{
    color: black;
    margin-left: 480px;
    margin-top: 50px;
    border: 3px solid #f1f1f1;
    background-image: linear-gradient(to right top, #0E59B2, #0E7EB2, #0EABB2, #0EB262, #0EB23E);
    border-radius: 10px;

}
p{
    font-size: 30px;
    text-align: center;
}
#btnentrar{
    background-color: #27D544;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    border-radius: 10px;
}
#btnentrar:hover {
    background-color: #00FF87;
}
a{
    position: relative;
    margin-left: 530px;
}
#logo{
    width: 200px;
    height: 180px;
    margin-left: 470px;
    border: 3px solid black;
    border-radius: 50%;
    border-top-left-radius: 50% 50%;
    border-top-right-radius: 50% 50%;
    border-bottom-right-radius: 50% 50%;
    border-bottom-left-radius: 50% 50%;
    background-color: #85929E;
}
.m-3 {
    color: #17202A;
}

.m-3:hover {
    color: #17202A;
}
</style>
<body>
<?php

    $message="";
    $class="";
    session_start();

    if(!empty($_SESSION['active']))
    {
        header('location: cliente.php');
    }else{
        if(!empty($_POST)){
            if(empty($_POST['correo_electronico']) || empty($_POST['contrase??a']))
            {
                $message='ingrese su usuario y su clave';
                $class="alert alert-danger";
                echo "<meta http-equiv='refresh' content='2;url=./cliente.php'/>";

            }
            else{
                $conexion = mysqli_connect(
                    'localhost',
                    'root',
                    'realmadridpes123') or die ("problemas en la conexion");
                mysqli_select_db($conexion,'tienda_bicicleta') or die ("no se pudo conectar a la base de datos o no existe");
                $correo_electronico="";
                $cons="";
                
            
                    $contrase??a= $_POST['contrase??a'];
                    $correo_electronico= $_POST['correo_electronico'];
                    $consulta= "call verificar_cliente('".$correo_electronico."','".$contrase??a."')";
                    $resultado = mysqli_query($conexion,$consulta) or die("no se pudo hacer la consulta");
                    $result= mysqli_num_rows($resultado);
                    if($result>0)
                    {
                        $row = mysqli_fetch_array($resultado);
                        print_r($row);
                        $_SESSION['active']=True;
                        $_SESSION['DNI']=$row['DNI'];
                        $_SESSION['nombres']=$row['nombres'];
                        $_SESSION['primero_apellido']=$row['primero_apellido'];
                        $_SESSION['segundo_apellido']=$row['segundo_apellido'];
                        $_SESSION['telefono']=$row['telefono'];

                        $_SESSION['correo_electronico']=$row['correo_electronico'];
                        $_SESSION['contrase??a']=$row['contrase??a'];

                        header('location: cliente/indexcliente.php');

                    }
                    else{
                        $message='Usuario y clase incorrectos';
                        $class="alert alert-danger";
                        echo "<meta http-equiv='refresh' content='2;url=./cliente.php'/>";
                        session_destroy();
                        
                    }
                    
                    /* if($row['correo_electronico']==$correo_electronico && $row['contrase??a']==$contrase??a)
                    { 
                        $dni=$row['DNI'];
                        $resultado=True;
                    }
                    if($resultado)
                    {
                        $message= "Datos correctos";
                            $class="alert alert-success";
                            echo "<meta http-equiv='refresh' content='2;url=./cliente/indexcliente.php'/>";
            
                    }
                    else{
                        $message="Usuario y contrase??a incorrectos";
                            $class="alert alert-danger";
                            echo "<meta http-equiv='refresh' content='2;url=./cliente.php'/>";
                    } */
            
                
            }
        }
    }
    
?>
<div class="<?php echo $class?>">
              <?php echo $message;?>
            </div>

    <header>
    <div>
        <a href="./index.php"><button class="btn btn-   success">Regresar</button></a>
    </div>
    <form method="POST" class="container">
        <img id="logo"src="./img/loginusuario.png" alt="">
        <p>Login</p>
        <div class="form-group" >
            <div class="form-group">
            <label for="inputEmail4" >Email</label>
            <input type="email" class="form-control m-3" id="correo_electronico" name="correo_electronico">
            </div>
            <div class="form-group">
            <label for="inputPassword4">Password</label>
            <input type="password" class="form-control m-3" id="contrase??a" name="contrase??a">
            </div>
        </div>
        <button class="btn btn-primary" id="btnentrar">Sign in</button>
    
        <div class="form-group">
            <a href="./registrarcliente.php" class="m-3">Registrarse</a>
        </div>
    </form>
    </header>
</body>
</html>