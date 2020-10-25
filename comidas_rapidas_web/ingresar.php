<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="keywords" content="">
    <link rel="stylesheet" href="./assets/css/ingresar.css">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" rel="stylesheet">
    <title>Iniciar Sesion</title>
</head>

<body>
    <header>
        <nav>
            <div class="logo-navegador">
                    <img class="logo" src="" alt="">
            </div>
            <ul>
                <li><a href="./index.html">Inicio</a></li>
                <li><a href="./registrarse.html">Registrarse</a></li>
            </ul>
        </nav>
    </header>
    <main class="main">
        <section>
                <form action="php/ingresar.php" method="post">
                    <h2>Iniciar Sesion</h2>
                    <div class="login-form-input"> 
                        <input type="text" name="usu_usuario" class="input" placeholder="Usuario">
                        <input type="password" name="usu_contrasena" class="input" placeholder="Contraseña">
                        <input type="submit" class="btn" value="Ingresar">
                    </div>
                </form>
        </section>
         
    </main>
    <script src="./assets/js/ingresar.js"></script>
</body>

</html>
