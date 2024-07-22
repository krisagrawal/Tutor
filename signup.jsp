<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        h2 {
            margin-top: 0;
        }
        input[type="text"], input[type="password"], input[type="email"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error {
            color: red;
            font-size: 14px;
        }
        .radio-group {
            text-align: left;
            margin-bottom: 15px;
        }
        .radio-group label {
            display: inline-block;
            margin-right: 20px;
        }
    </style>
</head>
<body>	
    <div class="container">
        <h2>Sign Up</h2>
        <form action="SignupServlet" method="post">
            <input type="text" name="username" placeholder="Username" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <input type="email" name="email" placeholder="Email" required><br>
            
            <div class="radio-group">
                <label><input type="radio" name="role" value="1" required>Admin</label>
                <label><input type="radio" name="role" value="2"> Student</label>
            </div>
            
            <input type="submit" value="Sign Up">
        </form>
        <p class="error">${error}</p>
    </div>
</body>
</html>
