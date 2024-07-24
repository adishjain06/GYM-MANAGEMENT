<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Gym Item</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to right, #00c6ff, #0072ff);
        margin: 0;
        padding: 50px 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        color: #333;
         background-image: url("/images/gymReport.jpg");
    	background-repeat: no-repeat;
  		background-attachment: fixed; 
  		background-size: 100% 100%;
    }
    .container {
        background: rgba(255, 255, 255, 0.9);
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        width: 80%;
        max-width: 400px;
        text-align: center;
    }
    h2 {
        margin-bottom: 20px;
        color: #0072ff;
    }
    form {
        display: flex;
        flex-direction: column;
        gap: 15px;
    }
    form label {
        font-size: 1.1em;
        color: #333;
    }
    form input {
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 1em;
    }
    button {
        padding: 10px 20px;
        background-color: #28a745;
        border: none;
        border-radius: 5px;
        color: white;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    button:hover {
        background-color: #218838;
    }
    .reset-button {
        background-color: #dc3545;
    }
    .reset-button:hover {
        background-color: #c82333;
    }
    .return {
        padding: 10px 20px;
        background-color: #0072ff;
        border: none;
        border-radius: 5px;
        color: white;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        text-decoration: none;
        display: inline-block;
        margin-top: 10px;
    }
    .return:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<div class="container">
    <h2>Update Slot</h2>
<form:form modelAttribute="slot" method="post" action="/update-slot">
    <form:hidden path="slotId"/>
    <form:label path="slotTime">Slot Time:</form:label>
    <form:input path="slotTime"/>
    <form:label path="pricing">Pricing:</form:label>
    <form:input path="pricing"/>
    <button type="submit">Update</button>
    <button type="reset" class="reset-button">Reset</button>
        <a href="/index" class="return">Return</a>
</form:form>
</div>
</body>
</html>



