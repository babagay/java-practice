<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: babagay
  Date: 18.05.16
  Time: 0:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>Input credentials</h2>
    <c:if test="${invalid }">
        <h5 style="color:red;">Please input correct value!!!</h5>
    </c:if>
    ${message } ${name }
    <form action="/register" method="post">
        <label for="username" > Username <input id="username" name="username" /></label>
        <label for="password" > password<input id="password" name="password" /> </label>
        <input type="submit" value="Register" />
    </form>
</body>
</html>
