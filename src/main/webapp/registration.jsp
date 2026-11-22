
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">

    <div class="form-card">

        <div class="form-heading">
            <%
                String message = (String) request.getAttribute("message");
                String msgType = (String) request.getAttribute("msgType");
                if (message != null) {
            %>
            <h3 style="color: <%= "success".equals(msgType) ? "green" : "red" %>; text-align: center; margin-bottom: 20px;">
                <%= message %>
            </h3>
            <%
                }
            %>
            <h2>Create Account</h2>
            <p>Register to get started!</p>
        </div>

        <form action="regForm" method="post">

            <div class="input-group">
                <label>Name</label>
                <input type="text" name="name1"
                       placeholder="Enter your full name" required>
            </div>

            <div class="input-group">
                <label>Email Address</label>
                <input type="email" name="email1"
                       placeholder="Enter your email" required>
            </div>

            <div class="input-group">
                <label>Password</label>
                <input type="password" name="pass1"
                       placeholder="Create a password" required>
            </div>

            <div class="input-group">
                <label>Gender</label>
                <div class="gender-options">
                    <label>
                        <input type="radio" name="gender1"
                               value="Male" required> Male
                    </label>

                    <label>
                        <input type="radio" name="gender1"
                               value="Female"> Female
                    </label>

                    <label>
                        <input type="radio" name="gender1"
                               value="Other"> Other
                    </label>
                </div>
            </div>

            <div class="input-group">
                <label>City</label>
                <select name="city1" required>
                    <option value="">Select your city</option>
                    <option value="Delhi">Delhi</option>
                    <option value="Mumbai">Mumbai</option>
                    <option value="Pune">Pune</option>
                    <option value="Bangalore">Bangalore</option>
                </select>
            </div>

            <button type="submit" class="register-btn">
                Create Account
            </button>

            <p class="login-text">
                Already have an account? <a href="login.jsp">Login</a>
            </p>

        </form>

    </div>

</div>

</body>
</html>
