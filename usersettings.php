<!DOCTYPE html>
<html>
  <head>
    <style>
      .form-group {
        margin: 10px;
      }
      label, input[type="submit"] {
        display: block;
      }
    </style>
  </head>
  <body>
    <?php
      // Connect to the database
      $conn = new mysqli("localhost", "root", "", "store");
      if(!$conn){
        die('Could not connect: '.mysqli_connect_error());
    }
    echo 'Connected successfully<br>';  
      
      // Get the user's information
      $id = 1; // replace with the actual user ID
      $query = "SELECT user_name, password, email, house_no,street_building,locality, phone_number FROM users WHERE uid = $id";
      $result = $conn->query($query);
      $user = $result->fetch_assoc();
    ?>
    <form action="update-user.php" method="post">
      <input type="hidden" name="uid" value="<?php echo $id; ?>">
      <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" id="name" name="User_name" value="<?php echo $user['user_name']; ?>">
        <input type="submit" name="submit" value="Update Name">
      </div>
      <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" value="<?php echo $user['password']; ?>">
        <input type="submit" name="submit" value="Update Password">
      </div>
      <div class="form-group">
        <label for="password">Confirm Password:</label>
        <input type="password" id="password" name="password" value="<?php echo $user['password']; ?>">
        <input type="submit" name="submit" value="Update Password">
      </div>
      <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<?php echo $user['email']; ?>">
        <input type="submit" name="submit" value="Update Email">
      </div>
      <div class="form-group">
        <label for="address">Address line 1:</label>
        <input type="text" id="address" name="house_no" value="<?php echo $user['house_no']; ?>">
        <input type="submit" name="submit" value="Update Address">
      </div>
      <div class="form-group">
        <label for="address">Address line 2:</label>
        <input type="text" id="address" name="street_building" value="<?php echo $user['street_building']; ?>">
        <input type="submit" name="submit" value="Update Address">
      </div>
      <div class="form-group">
        <label for="address">Address line 3:</label>
        <input type="text" id="address" name="locality" value="<?php echo $user['locality']; ?>">
        <input type="submit" name="submit" value="Update Address">
      </div>
      <div class="form-group">
        <label for="phone">Phone:</label>
        <input type="tel" id="phone" name="phone_number" value="<?php echo $user['phone_number']; ?>">
        <input type="submit" name="submit" value="Update Phone">
      </div>
    </form>
    <?php

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $field = key($_POST);
  $value = $_POST[$field];
  $id = $_POST['id'];
 // Connect to the database
 $conn = new mysqli("localhost", "root", "", "store");
 if(!$conn){
  die('Could not connect: '.mysqli_connect_error());
}
echo 'Connected successfully<br>';  

 // Update the user's information
 $query = "UPDATE users SET $field = '$value' WHERE uid = $id";
 $conn->query($query);

 // Redirect back to the form
 header("Location: index.php");
 exit;
}
?>

<script>
            /*const form = document.querySelector('#signup-form');

form.addEventListener('submit', (e) => {
  e.preventDefault();

  const password = form.querySelector('#password').value;
  const confirmPassword = form.querySelector('#confirm-password').value;


  if (password !== confirmPassword) {
    alert('Passwords do not match');
    return;
  }

  // send data to the server (using ajax or fetch)
});*/
        </script>
  </body>
</html>  