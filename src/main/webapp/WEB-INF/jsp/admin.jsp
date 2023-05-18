<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Користувачі</title>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>

<body>

<div class = "brand">
  <a class="brandimage" onclick="window.location.href = '../..'"><img src = "../../resources/Image/brand.png"/></a>
</div>
<div>
  <table>
    <thead>
    <th>ID</th>
    <th>UserName</th>
    <th>Password</th>
    <th>Ім'я</th>
    <th>Прізвище</th>
    <th>Вік</th>
    <th>Місто</th>
    <th>Телеграм або інший спосіб зв'язку:</th>
    <th>Roles</th>

    </thead>
    <c:forEach items="${allUsers}" var="user">
      <tr>
        <td>${user.id}</td>
        <td>${user.username}</td>
        <td>${user.password}</td>
        <td>${user.firstName}</td>
        <td>${user.lastName}</td>
        <td>${user.age}</td>
        <td>${user.city}</td>
        <td>${user.teleg}</td>
        <td>
          <c:forEach items="${user.roles}" var="role">${role.name}; </c:forEach>
        </td>
        <td>
          <form action="${pageContext.request.contextPath}/admin" method="post">
            <input type="hidden" name="userId" value="${user.id}"/>
            <input type="hidden" name="action" value="delete"/>
            <button class="btn" type="submit">Delete</button>
          </form>
        </td>
      </tr>
    </c:forEach>
  </table>
  <button class= "btn" onclick=" window.location.href = '../..'">Головна</button>
</div>
</body>
</html>