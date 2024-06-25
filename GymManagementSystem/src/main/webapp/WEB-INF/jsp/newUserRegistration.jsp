<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        font-family: Arial, sans-serif; 
        background-image: url("images/gymEntry.jpg");
        background-repeat: no-repeat;
        background-attachment: fixed; 
        background-size: 100% 100%;
    }
    .container {
        background: rgb(156 156 156 / 90%);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
        max-width: 400px;
        width: 100%;
    }
    .container h2 {
        margin-bottom: 20px;
    }
    .container input[type="text"],
    .container input[type="password"],
    .container input[type="email"],
    .container input[list] {
        width: 80%;
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .container button[type="submit"],
    .container button[type="reset"] {
        width: 40%;
        padding: 10px;
        display: inline-flex;
        background-color: #007BFF;
        border: none;
        border-radius: 5px;
        color: white;
        font-size: 16px;
        cursor: pointer;
    }
    .container button[type="reset"] {
        background-color: #dc3545;
    }
    .container button[type="submit"]:hover,
    .container button[type="reset"]:hover {
        opacity: 0.8;
    }
</style>
<script type="text/javascript">
  function passwordCheck(event) {
    event.preventDefault();
    var firstName = document.getElementById("firstName").value;
    var lastName = document.getElementById("lastName").value;
    var email = document.getElementById("email").value;
    var type = document.getElementById("type").value;
    var username = document.getElementById("username").value;
    var pass1 = document.getElementById("pass1").value;
    var pass2 = document.getElementById("pass2").value;
    var passwordPattern = /^(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{6,}$/;

    if (!firstName || !lastName || !email || !type || !username || !pass1 || !pass2) {
      alert("All fields are required.");
      return;
    }

    if (!passwordPattern.test(pass1)) {
      alert("Password must be at least 6 characters long, contain at least one capital letter, and one number.");
      return;
    }

    if (pass1 !== pass2) {
      alert("Passwords do not match.");
      return;
    }

    document.getElementById("registration-form").submit();
  }
</script>
</head>
<body >
<div class="container">
  <h2>New User Registration</h2>
  <form:form id="registration-form" method="post" action="/register" modelAttribute="userRecord">
    Enter first name: <form:input path="firstName" id="firstName"/>
    <br/><br/>
    Enter last name: <form:input path="lastName" id="lastName"/>
    <br/><br/>
    Enter email: <form:input path="email" id="email"/>
    <br/><br/>
    Select User's Type: <form:input list="types" name="type" path="type" id="type"/>
    <datalist id="types">
        <option value="Customer">
        <option value="Admin">
    </datalist>
    <br/><br/>
    Enter user Id: <form:input path="username" id="username"/>
    <br/><br/>
    Enter password: <form:input type="password" path="password" id="pass1"/>
    <br/><br/>
    Re-type password: <input type="password" id="pass2"/>
    <br/><br/>
    <button type="submit" onclick="passwordCheck(event)">Submit</button>
    <button type="reset">Reset</button>
  </form:form>
</div>    
</body>
</html>
