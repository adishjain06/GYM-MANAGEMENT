<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error</title>
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
         background-image: url("/images/gymReport.jpg");
    	background-repeat: no-repeat;
  		background-attachment: fixed; 
  		background-size: 100% 100%;
    }
    .container {
        background: rgba(255, 255, 255, 0.9);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 80%;
        max-width: 800px;
        text-align: center;
    }
    h1 {
        font-size: 24px;
        margin-bottom: 20px;
    }
    a {
        text-decoration: none;
        color: #007BFF;
        font-size: 16px;
    }
    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
  <div class="container">
    <h1><u><i>Error</i></u></h1>
    <p>${message}</p>
    <a href="/index">Return to Home</a>
  </div>
</body>
</html>
