<%--
  Created by IntelliJ IDEA.
  User: Олександр
  Date: 17.05.2021
  Time: 23:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SignUp</title>
</head>
<body>
<h1>SignUp</h1>
<form action="<%=request.getContextPath()%>/signup" method="post">
    <table style="width: 80%">
        <tr>
            <td>First Name</td>
            <td><input type="text" name="firstName"></td>
        </tr>
        <tr>
            <td>Last Name</td>
            <td><input type="text" name="lastName"></td>
        </tr>
        <tr>
            <td>Login</td>
            <td><input type="text" name="login"></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="text" name="password"></td>
        </tr>
    </table>
    <input type="submit" value="Submit">
</form>
</body>
</html>
