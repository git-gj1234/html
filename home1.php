<!DOCTYPE html>
<title>valmart</title>
<head class = "a1">
    <link rel="stylesheet" type="text/css" href = "home1.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

</head>
<body>
<div class = "a1">
        hello
    <img src="images/apple.jpg" class="im">
    hello this is the nav bar
    <div id="search-container">
    <form method="post">
      <input type="text" id="search-input" name = "search" value = "<?php if(isset($_POST['search'])) echo htmlspecialchars($_POST['search'])?>" >
      <button type="submit" name="btn" id="search-button">Search</button>
    </form>
  </div>
</div>


<?php 
session_start();
$P = $_SESSION;
// echo $P['UID'];
session_write_close();
?>

<?php
$r=0;
$host = "localhost";
$user = "root";
$pass = "";
$database = "STORE";
$conn = mysqli_connect($host,$user,$pass,$database);
if(!$conn){
    die('Could not connect: '.mysqli_connect_error());
}

function display($retval){
    echo "<div class=\"flex-container2\">";
    while($row = mysqli_fetch_assoc($retval)){
        echo "<div class=\"item\">";
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
        $price = $row['price'];
        echo "<p class=\"price\">$price</p>";
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
$sql0 = "SELECT distinct(category) from STORE_INV"; 
$retval0 = mysqli_query($conn,$sql0);


if(mysqli_num_rows($retval0)>0){
    echo "<div class=\"flex-container\">";
    while($row0 = mysqli_fetch_assoc($retval0)){
        echo "<div>";
        $v0 = $row0['category'];
        ?>
        <form method = "post">
        <input type = "submit" value = <?php echo"'$v0'"?> name = <?php echo "'$v0'"?> >
        </form>
        <?php
        echo "</div>";    
    }
    echo "</div>";
}

if($_POST && isset($_POST["canned"])){
} 

  if($_POST && isset($_POST['search']))
  {
        $value_filter= $_POST['search'];
        // echo $value_filter;

        $query = "Select * from store_inv where concat(Name) LIKE '%$value_filter%'";
        $retval = mysqli_query($conn,$query);

if(mysqli_num_rows($retval)>0){
    
    display($retval);
    echo "<div class=\"printend\">";
        echo "<p>END OF SEARCH RESULTS<p>";
        echo" </div>";
}
else{
    echo "<img src = \"images/no_res.png\" align = \"center\">";
    echo "<br><p align = \"center\">we dont seem to offer $value_filter at the moment</p>";
}
$sql = "SELECT * from STORE_INV";
            $retval = mysqli_query($conn,$sql);
        
        if(mysqli_num_rows($retval)>0){
            
            display($retval);
        }
        
}
else{

    $sql0 = "SELECT distinct(category) from STORE_INV"; 
    $retval0 = mysqli_query($conn,$sql0); 
    $r = 0;   
    while($row0 = mysqli_fetch_assoc($retval0)){
        $v1 = $row0['category'];
        // echo "$v1";
        if(isset($_POST["$v1"])){
            // echo"ye boiiiiiiii";
            $r = 1;
            $sql = "SELECT * from STORE_INV where category = '$v1'";
$retval = mysqli_query($conn,$sql);
if(mysqli_num_rows($retval)>0){
    
    display($retval);
    echo "<div class=\"printend\">";
        echo "<p>END OF SEARCH RESULTS<p>";
        echo" </div>";

}
}
        }

        //if(!$r){
            $sql = "SELECT * from STORE_INV";
            $retval = mysqli_query($conn,$sql);
        
        if(mysqli_num_rows($retval)>0){
            
            display($retval);
        }
        }



    







mysqli_close($conn);
?>

<br>
<footer id="footer">

<div id="nav-container">
    <button class="contact" id="nav-button">Contact Us</button>
    <div id="nav-content">
        <table style="width:100%;">
            <tr>
                <th style="width: 40%; ">
                    Terms & Conditions
                </th>
                <th colspan="3" style="width: 60%;">
                    Contact for any Queries
                </th>
            </tr>

            <tr>
                <td style="width:40%; ">
                    <ul>
                        <li>
                            No Return policy is followed here.
                        </li>
                        <li>
                            Only Amal, Chetna and GJ hold the rights to change anything here.
                        </li>
                        <li>
                            Sir give full maks plzzzz. You are not welcome to use our website.
                        </li>
                    </ul>
                </td>
                <td style="width:20%;">
                    <p>
                        <p style="font-size:14px"><b>Customer Service : </b></p>
                        <br>
                        <span class="material-symbols-outlined">
                            mail
                            </span> :  amal.ai21@bmsce.ac.in
                        <br>
                        <span class="material-symbols-outlined">
                            support_agent
                            </span> : 8582852825
                    </p>
                </td>
                <td style="width:20%;">
                    <p>
                        <p style="font-size:14px"><b>Delivery Service : </b></p>
                        <br>
                        <span class="material-symbols-outlined">
                            mail
                            </span> : adityagy.ai21@bmsce.ac.in
                        <br>
                        <span class="material-symbols-outlined">
                            support_agent
                            </span> : 8582852825
                    </p>
                </td>
                <td style="width:20%;">
                    <p>
                        <p style="font-size:14px"><b>Helpline : </b></p>
                        <br>
                        <span class="material-symbols-outlined">
                            mail
                            </span> : chetna.ai21@bmsce.ac.in
                        <br>
                        <span class="material-symbols-outlined">
                            support_agent
                            </span> : 7004936699
                    </p>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                      
                      <div class="flex-center">
                        <i class="fa fa-twitter fa-4x icon-3d"></i>
                        <i class="fa fa-facebook fa-4x icon-3d"></i>
                        <i class="fa fa-instagram fa-4x icon-3d"></i>
                        <i class="fa fa-whatsapp fa-4x icon-3d"></i>
                      </div>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center;">
                    <p id="copy">
                        Copyright© 2022, THG PUBLISHING PVT LTD. All Rights Reserved
                    </p>

                </td>
            </tr>
        </table>
        
    </div>
  </div>
</footer>
  <script>
  const button = document.querySelector("#nav-button");
const content = document.querySelector("#nav-content");
const footer = document.getElementById("footer");

window.onscroll = function() {
  if (window.pageYOffset > 50) {
    footer.style.bottom = "0";
  } else {
    footer.style.bottom = "-50px";
  }
};

button.addEventListener("click", function () {
  if (content.style.maxHeight) {
    content.style.maxHeight = null;
  } else {
    content.style.maxHeight = content.scrollHeight + "px";
  }
});
</script>

</body>
