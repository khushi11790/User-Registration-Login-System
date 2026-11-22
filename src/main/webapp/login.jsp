
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Account</title>
    <link rel="stylesheet" href="login.css">
</head>

<body>

<div class="container">

    <div class="login-card">
        <%
            String message = (String) request.getAttribute("message");

            if (message != null) {
        %>
        <h4 style="color:red; text-align:center; margin-bottom:20px;">
            <%= message %>
        </h4>
        <%
            }
        %>
        <div class="login-heading">
            <h2>Welcome Back!</h2>
            <p>Login to continue your journey</p>
        </div>

        <form action="loginForm" method="post">

            <div class="input-group">
                <label>Email Address</label>
                <input type="email" name="email1"
                       placeholder="Enter your email" required>
            </div>

            <div class="input-group">
                <label>Password</label>
                <input type="password" name="pass1"
                       placeholder="Enter your password" required>
            </div>

            <div class="forgot-password">
                <a href="#">Forgot Password?</a>
            </div>

            <button type="submit" class="login-btn">
                Login
            </button>

            <p class="register-text">
                Don't have an account?
                <a href="registration.jsp">Create Account</a>
            </p>

        </form>

    </div>

</div>

</body>
</html>
