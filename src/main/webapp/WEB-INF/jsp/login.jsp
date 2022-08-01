<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
<head>
  <meta charset="utf-8">
  <title>Вхід</title>
</head>

<body>
<div class = "brand">
  <a onclick="window.location.href = '/'"><img  src = "../../resources/Image/Brand.png"/></a>
</div>
<sec:authorize access="isAuthenticated()">
  <% response.sendRedirect("/"); %>
</sec:authorize>
<div class="logblock">
  <form method="POST" action="/login">
    <h2>Вхід в систему</h2>
    <div>
      <input name="username" type="text" placeholder="Username"
             autofocus="true"/></br>
      <input name="password" type="password" placeholder="Password"/>
      <button class= "minbtn" type="submit">Ввійти</button>
      <button class= "minbtn" onclick=" window.location.href = '/registration' ">Реєстрація</button>
    </div>
  </form>
</div>

</body>
</html>
