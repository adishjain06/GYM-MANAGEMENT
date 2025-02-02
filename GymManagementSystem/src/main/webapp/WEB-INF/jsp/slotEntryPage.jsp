  
  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gym Item Entry</title>
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
        background-image: url("images/gymEntry.jpg");
    	background-repeat: no-repeat;
  		background-attachment: fixed; 
  		background-size: 100% 100%;
    }
    .container {
        background:rgb(117 117 117 / 90%);
        
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 80%;
        max-width: 400px;
        text-align: center;
    }
    h1 {
        font-size: 24px;
        margin-bottom: 20px;
    }
    .container input[type="text"],
    .container input[type="number"] {
        width: 80%;
        padding: 10px;
        margin: 10px 0;
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
    
        .return {
    padding: 0px 8px;
    background-color: #00b4ff;
    border: none;
    border-radius: 5px;
    color: white;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    //<a href="/index" class="return">Return</a>
}
    }
    .return:hover{
    background-color: #2f8db4;
    }
</style>
</head>
<body>
  <div class="container">
    <h1>Enter Slot</h1>
    <form:form action="/slot" method="post" modelAttribute="slotRecord">
      <form:hidden path="slotId"/>
      <div>
        <label for="slotTime">Enter Slot Timing:</label>
        <form:input path="slotTime" id="slotTime"/>
      </div>
      <br/>
      <div>
        <label for="pricing">Enter Price:</label>
        <form:input path="pricing" id="pricing"/>
      </div>
      <br/>
      <div>
        <button type="submit">Submit</button>
        <button type="reset">Reset</button><br/>
        <a href="/index" class="return">HOME</a>
      </div>
    </form:form>
  </div>
</body>
</html>
  