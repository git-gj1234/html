<?PHP
// form handler
if($_POST && isset($_POST['name'],$_POST['password'])) {   
    
    $host = "localhost";
    $user = "root";
    $pass = "";
    $database = "STORE";
    $conn = mysqli_connect($host,$user,$pass,$database);
    if(!$conn){
        die('Could not connect: '.mysqli_connect_error());
    }
    echo 'Connected successfully<br>';    
    
    $name = $_POST['name'];
    $password = $_POST['password'];
    
    $sql2 = "SELECT UID from users WHERE user_name = '$name' and password = '$password'";
    $retval0 = mysqli_query($conn,$sql2);
    if(mysqli_num_rows($retval0)>0){
        $row0 = mysqli_fetch_assoc($retval0);    
        $uid = $row0['UID'];
        echo $uid;
        $_POST['UID'] = $uid;
        session_start();
        $_SESSION = $_POST;
        session_write_close();    
        header("Location: https://localhost/recent/html/home1.php");
    }
    else{
        echo'<script>alert("Incorrect username or password");</script>';
    }
    }
    
?>
<html>
    <head>
        <link rel="stylesheet" href="login.css">
    </head>
    <body>
        <div class="center">
            <h1>Login</h1>
            <form method="post">
                <div class="type1">
                    <input type="text" required name = "name" value = "<?php if(isset($_POST['name'])) echo htmlspecialchars($_POST['name'])?>">
                    <span></span>
                    <label>Username</label>
                </div>
                <div class="type1">
                    <input type="password" required name = "password" value = "<?php if(isset($_POST['password'])) echo htmlspecialchars($_POST['password'])?>">
                    <span></span>
                    <label>Password</label>
                </div>
                <div class="pass">Forgot Password?</div>
                <input type="submit" value="Login">
                <div class="signup">
                    Not a member? <a href="signup.php">Signup</a>
                </div>
            </form>
        </div>
    </body>
</html>
