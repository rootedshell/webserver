<?php

// Database connection details
$servername = "localhost";
$username = "demouser";
$password = "Test@4312#&";
$dbname = "webserver";
$db_port = 3306;

// Create a database connection
$conn = new mysqli($servername, $username, $password, $dbname, $db_port);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get user input from the form (this is the vulnerable part)
$user = $_POST['username'];
$pass = $_POST['password'];

// Construct the insecure SQL query
$sql = "SELECT * FROM users WHERE username = '$user' AND password = '$pass'";

// Execute the query
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // A match was found; log the user in
    echo "<h3 style='color: green;'>Login successful! Welcome, $user.</h3>";
} else {
    // No match was found
    echo "<h3 style='color: red;''>Login failed. Invalid username or password.</h3>";
}

$conn->close();

?>



<!DOCTYPE html>
<html>
<head>
    <title>Webserver</title>
</head>
<body>
    <h2>Login</h2><br>
    <form action="" method="post">
        Username: <input type="text" name="username"><br><br>
        Password: <input type="password" name="password"><br><br>
        <input type="submit" value="Login">
    </form>
</body>
</html>
