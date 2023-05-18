<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Реєстрація</title>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>

<body>
<div class = "brand">
  <a onclick="window.location.href = '../..'"><img src = "../../resources/Image/brand.png"/></a>
</div>
<div class ="regblock">
  <form:form method="POST" action="/registration"  modelAttribute="userForm">
    <h2>Реєстрація</h2>
    <div>
      <form:input type="text" path="username" placeholder="Логін"
                  autofocus="true"></form:input>

      <form:errors path="username"></form:errors>
        ${usernameError}
    </div>
    <div>
      <form:input type="password" path="password" placeholder="Пароль"></form:input>
    </div>
    <div>
      <form:input type="password" path="passwordConfirm"
                  placeholder="Повторіть пароль"></form:input>
      <form:errors path="password"></form:errors>
        ${passwordError}
    </div>
    <button class="regbtn" type="submit">Зареєструватися</button>
  </form:form>
  <button class= "regbtn" onclick=" window.location.href = '/'">Головна</button>
</div>

</body>
</html>