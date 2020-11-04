<%--
  Created by IntelliJ IDEA.
  User: arail
  Date: 10/20/2020
  Time: 9:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="form-wrap">
    <form action="enter"  method="post">
        <h1>Registration Form</h1>
        <input type="text" name="name" placeholder="Name"><br>
        <input type="text" name="lastname" placeholder="Surname"><br>
        <input type="text" name="email" placeholder="Email"><br>
        <input type="password" name="pass" placeholder="Password">
        <input type="submit" name="" value="Register" id="btn">
    </form>
</div>
</body>
</html>
