<!DOCTYPE html>
<title>valmart</title>
<head class = "a1">
    <link rel="stylesheet" type="text/css" href = "home.css">

</head>
<body>
<div class = "a1">
        hello
    <img src="images/apple.jpg" class="im">
    hello this is the nav bar
    </div>

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

$sql0 = "SELECT distinct(category) from STORE_INV"; 
$retval0 = mysqli_query($conn,$sql0);


if(mysqli_num_rows($retval0)>0){
    echo "<div class=\"flex-container\">";
    while($row0 = mysqli_fetch_assoc($retval0)){
        echo "<div>";
        $v0 = $row0['category'];
        echo"<input type = \"submit\" value = \"$v0\" fdprocessedid=\"3skxvl\">";
        echo "</div>";    
    }
    echo "</div>";
}
$sql = "SELECT * from STORE_INV";
$retval = mysqli_query($conn,$sql);

if(mysqli_num_rows($retval)>0){
    echo "<div class=\"flex-container2\">";
    while($row = mysqli_fetch_assoc($retval)){
        echo "<div class=\"item\">";
        // echo"<p class = \"para\">{$row['Name']}</p><br>";
        // echo"<hr>";
        // $link = $row['link'];
        // echo"<img src=$link class = \"app\">";
        // echo"<br>";
        // echo"<hr>";
        // $supporting_info = $row['info'];
        // echo"$supporting_info";


        echo "<table class = \"gallery\">";
        echo "<tr class = \"tr\" style=\"height:250px;\" >";
        echo "<td colspan=\"2\" class=\"tr\">";
        $link = $row['link'];
        echo "<img src=$link >";
        echo "</td>";
        echo "</tr>";
        echo "<tr class=\"tr\">";
        echo "<td colspan=\"2\" class=\"tr\">";
        echo "<p class = \"elementname\">{$row['Name']}</p>";
        echo "</td>";
        echo "</tr>";
        echo "<tr class=\"tr\">";
        echo "<td class=\"tr\">";
        echo "<p class=\"price\">&#x20B9 36</p>";
        echo "</td>";
        echo "<td class=\"tr\" >";
        echo "<input type=\"add\" value=\"+\">";
        /*echo "<input type=\"add\" value=\"-\">";*/
        echo "</td>";
        echo "</tr>";
        echo "<tr class=\"tr\">";
        echo "<td colspan=\"2\" class=\"tr\">";
        $supporting_info = $row['info'];
        echo "<p class=\"content\">$supporting_info</p>";
        echo "</td>";
        echo "</tr>";
        echo "</table>";
        echo "</div>";
    
    }
    echo "</div>";
}

mysqli_close($conn);
?>

</body>
