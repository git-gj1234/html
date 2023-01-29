<!DOCTYPE html>
<title>valmart</title>
<head class = "a1">
    <link rel="stylesheet" type="text/css" href = "home.css">

</head>
<body>
  
<?php
$host = "localhost";
$user = "root";
$pass = "";
$database = "STORE";
$conn = mysqli_connect($host,$user,$pass,$database);
if(!$conn){
    die('Could not connect: '.mysqli_connect_error());
}
echo 'Connected successfully<br>';


//mysqli_close($conn);
/*
$sql = "CREATE DATABASE t";
if(mysqli_query($conn,$sql)){
    echo "Database Created successfully";
}
else echo "Failed".mysqli_error($conn);
mysqli_close($conn);
*/

/*
$sql = "CREATE TABLE t1(slno int primary key,fruit varchar(20),link varchar(100));";
mysqli_query($conn,$sql);
*/


$sql = "SELECT * from STORE_INV";
$retval = mysqli_query($conn,$sql);
// echo"<table border = 1><tr><th>\"items\"</td><td>\"img\"</td></tr>";

if(mysqli_num_rows($retval)>0){
    echo "<div class=\"flex-container2\">";
    while($row = mysqli_fetch_assoc($retval)){
        echo "<div>";
        echo"<p class = \"para\">{$row['Name']}</p><br>";
        echo"<hr>";
        $link = $row['link'];
        echo"<img src=$link class = \"app\">";
        echo"<br>";
        echo"<hr>";
        $supporting_info = $row['info'];
        echo"$supporting_info";
        // echo "<div>{$row['Name']}";
        
        // echo "<img src= $link height =\"100px\"></div>";
        echo "</div>";
    
    }
    echo "</div>";
}
mysqli_close($conn);
?>

</body>
