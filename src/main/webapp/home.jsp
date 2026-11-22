
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String email = (String) session.getAttribute("userEmail");

    if (email == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <link rel="stylesheet" href="home.css">
</head>

<body>

<div class="navbar">
    <h2>MyWebsite</h2>
    <a href="login.jsp" class="logout-btn">Logout</a>
</div>

<div class="welcome-container">

    <div class="welcome-card">

        <div class="welcome-icon">👋</div>

        <h1>Welcome Back!</h1>

        <p class="subtitle">
            You have successfully logged in.
        </p>

        <div class="user-info">
            <p>Logged in as</p>
            <h3><%= email %></h3>
        </div>

        <p class="description">
            We're glad to have you here.
            Explore your dashboard and enjoy your experience!
        </p>

        <button onclick="alert('Welcome to your dashboard!')">
            Get Started
        </button>

    </div>

</div>

</body>
</html>
