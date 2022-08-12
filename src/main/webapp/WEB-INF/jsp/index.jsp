<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
<head>
  <title>Головна</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/Card.css">
</head>
<body>

<div class = "brand">
  <a onclick="window.location.href = '/'"><img  src = "../../resources/Image/Brand.png"/></a>
</div>
<h3 class="usrname">${pageContext.request.userPrincipal.name}</h3>
<div class="menu">
  <sec:authorize access="!isAuthenticated()">
    <button class= "btn" onclick=" window.location.href = '/login' ">Ввійти</button>
    <button class= "btn" onclick=" window.location.href = '/registration' ">Реєстрація</button>
  </sec:authorize>

  <sec:authorize access="isAuthenticated()" >
    <button class= "btn"onclick=" window.location.href = '/logout' ">Вийти</button>
  <button class= "btn" onclick=" window.location.href = '/forum' ">Форум</button>
  </sec:authorize>
  <sec:authorize access="hasRole('ADMIN')" >
  <button class= "adminbtn" onclick=" window.location.href = '/admin' ">Користувачі</button>
  <button class= "adminbtn" onclick=" window.location.href = '/edit' ">ДодатиАвто</button>
  <button class= "adminbtn" onclick=" window.location.href = '/carlist' ">СписокАвто</button>
  </sec:authorize>
</div>

<div class="searchblock">
  <form:form method = "POST" modelAttribute="keyword" >
  <div>
    <form:input type="text" path="brand" placeholder="Brand"
                autofocus="true"></form:input>
  </div>
  <div>
    <form:input type="text" path="model" placeholder="Model"
                autofocus="true"></form:input>
  </div>
  <div>
    <form:input type="text" path="year" placeholder="Year"
                autofocus="true"></form:input>
  </div>
  <div>
    <form:input type="text" path="color" placeholder="Color"
                autofocus="true"></form:input>
  </div>
  <div>
    <form:input type="text" path="cost" placeholder="Cost"
                autofocus="true"></form:input>
  </div>
  <button class="regbtn" type="submit">Пошук</button>
  </form:form>
</div>


<div class="mainbox">

  <c:forEach items="${allCars}" var="cars">
  <div class="card">
<div >
<img class = "cardImage" src =../../resources/Image/img.png>
</div>
<div class = "cardInfo">
  <h2>${cars.brand}</h2>
  <h2>${cars.model}</h2>
  <h3>${cars.year}</h3>
  <p>${cars.color}</p>
  <h2 class="carcost">${cars.cost}</h2>
</div>
  </div>
      </c:forEach>
</div>



</body>
</html>