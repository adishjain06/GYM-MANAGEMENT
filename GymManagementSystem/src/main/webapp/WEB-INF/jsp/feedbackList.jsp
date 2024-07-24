<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback List</title>
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
    }
    .container {
        background: rgba(255, 255, 255, 0.9);
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        width: 80%;
        max-width: 800px;
        text-align: left;
    }
    h2 {
        margin-bottom: 20px;
        color: #0072ff;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    table, th, td {
        border: 1px solid #ddd;
    }
    th, td {
        padding: 12px;
        text-align: center;
    }
    th {
        background-color: #0072ff;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    tr:hover {
        background-color: #f1f1f1;
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
    
    }
    .return:hover{
    background-color: #2f8db4;
    }
</style>
</head>
<body>
<div class="container">
    <h2>Feedback List</h2>
    <table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Content</th>
        
    </tr>
    <c:forEach items="${feedbacks}" var="feedback">
        <tr>
            <td>${feedback.id}</td>
            <td>${feedback.name}</td>
            <td>${feedback.content}</td>
            
        </tr>
    </c:forEach>
</table><br/>
<a href="/index" class="return">HOME</a>
</div>
</body>
</html>

