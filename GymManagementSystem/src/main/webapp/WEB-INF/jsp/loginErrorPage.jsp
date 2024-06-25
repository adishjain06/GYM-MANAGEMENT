<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GYM Login Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .container {
        background: rgba(255, 255, 255, 0.9);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 80%;
        max-width: 400px;
        text-align: center;
    }
    h1 {
        font-size: 24px;
        color: red;
        margin-bottom: 20px;
    }
    .message {
        color: red;
        margin-bottom: 20px;
    }
</style>
</head>
<body>
  <div class="container">
    <h1>GYM Login Page</h1>
    <div class="message">Wrong credentials... please re-enter...</div>
    <jsp:include page="loginPage.jsp" flush="true"/>
  </div>
</body>
</html>
