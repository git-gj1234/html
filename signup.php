<?

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['name'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $l1 = $_POST['l1'];
    $l2 = $_POST['l2'];
    $l3 = $_POST['l3'];
    $phno = $_POST['phno'];

    $conn=new mysqli('localhost','root','','store');
    
  $stmt = $conn->prepare('SELECT MAX(UID) + 1 AS next_id FROM users');
  $stmt->execute();
  $row = $stmt->fetch();
  $nextId = $row['next_id'];

    
    if ($conn->connect_error){
        die('connection failed : '.$conn->connect_error);

    }
    else{
        $stmt = $conn->prepare('INSERT INTO users (UID, User_name, House_no, street_building, Locality,phone_number,email, password) VALUES (?, ?, ?, ?, ?, ?, ?, ? )');
        $stmt->bindParam($nextId,$username, $l1,$l2,$l3,$phno,$email,$password);
        $stmt->execute();
        echo "registration successful";
        $stmt->close();
        $conn->close();
    }

    header('Location: home.php');
    exit;

}
?
>
