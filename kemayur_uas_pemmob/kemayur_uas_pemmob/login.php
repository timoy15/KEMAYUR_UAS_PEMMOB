<?php
header('Content-Type: application/json');
$data = json_decode(file_get_contents('php://input'), true);

$email = $data['email'];
$password = $data['password'];

// Database configuration
$host = 'localhost'; // Sesuaikan dengan host database Anda
$user = 'root';      // Sesuaikan dengan username database Anda
$pass = '';          // Sesuaikan dengan password database Anda
$dbname = 'kemayur'; // Sesuaikan dengan nama database Anda

// Connect to MySQL database
$conn = new mysqli($host, $user, $pass, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Prepare and bind SQL statement
$stmt = $conn->prepare("SELECT * FROM users WHERE email=?");
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    if (password_verify($password, $row['password'])) {
        $response = array("status" => true, "message" => "Login successful");
    } else {
        $response = array("status" => false, "message" => "Incorrect password");
    }
} else {
    $response = array("status" => false, "message" => "User not found");
}

// Close connections
$stmt->close();
$conn->close();

echo json_encode($response);
?>
