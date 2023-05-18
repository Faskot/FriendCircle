<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
  <a class="brandimage" onclick="window.location.href = '../..'"><img src = "../../resources/Image/brand.png"/></a>
</div>
<h3 class="usrname">${pageContext.request.userPrincipal.name}</h3>
<div class="menu">
  <sec:authorize access="!isAuthenticated()">
    <button class= "btn" onclick=" window.location.href = '/login' ">Ввійти</button>
    <button class= "btn" onclick=" window.location.href = '/registration' ">Реєстрація</button>
  </sec:authorize>

  <sec:authorize access="isAuthenticated()">
    <button class= "btn"onclick=" window.location.href = '/logout' ">Вийти</button>
    <button class= "btn" onclick=" window.location.href = '/cabinet' ">Кабінет</button>
  </sec:authorize>
  <sec:authorize access="hasRole('ADMIN')" >
  <button class= "adminbtn" onclick=" window.location.href = '/admin' ">Користувачі</button>
  </sec:authorize>
</div>

<div class="searchblock">
  <form:form modelAttribute="filterForm" method="GET" action="/">
    <div class="form-group">
      <label for="age">Вік</label>
      <form:input class = "filterin" path="age" id="age" />
    </div>
    <div class="form-group">
      <label for="region">Область</label>
      <form:input class = "filterin" path="region" id="region" />
    </div>
    <div class="form-group">
      <label for="city">Місто</label>
      <form:input class = "filterin" path="city" id="city" />
    </div>
    <div class="form-group">
      <label for="want">Побажання</label>
     <form:select class = "selectind" id="want" path="want">
       <option value="">Пусто</option>
       <option value="Кінопоказ">Кінопоказ</option>
       <option value="Музичний фестиваль">Музичний фестиваль</option>
       <option value="Прогулянка в парку">Прогулянка в парку</option>
       <option value="Вечірня прогулянка">Вечірня прогулянка</option>
       <option value="Пікнік на природі">Пікнік на природі</option>
       <option value="Театральний спектакль">Театральний спектакль</option>
       <option value="Арт-виставка">Арт-виставка</option>
       <option value="Фотосесія">Фотосесія</option>
       <option value="Пляжний фестиваль">Пляжний фестиваль</option>
       <option value="Ретро-вечірка">Ретро-вечірка</option>
       <option value="Екскурсія містом">Екскурсія містом</option>
       <option value="Фітнес-захід">Фітнес-захід</option>
       <option value="Квести кімнати">Квести кімнати</option>
       <option value="Похід у музей">Похід у музей</option>і
      </form:select></td>
    </div>
    <button class="searchbtn" type="submit">Фільтрувати</button>
  </form:form>
  <button class= "searchbtn" onclick=" window.location.href = '../..'">Зкинути</button>
</div>

<div class="mainbox">
  <c:forEach var="user" items="${allUsers}">
    <div class="card">
      <c:choose>
        <c:when test="${not empty avatars[user.id]}">
          <img class="cardImage" src="data:image/png;base64,${avatars[user.id]}" alt="User avatar">
        </c:when>
        <c:otherwise>
          <img class="cardImage" src="${pageContext.request.contextPath}/resources/Image/img.png" alt="Default Avatar"/>
        </c:otherwise>
      </c:choose>
      <div class="cardInfo">
        <h2 class="lastName">${user.firstName}</h2>
        <h2 class="lastName">${user.lastName}</h2>
        <h3>${user.phoneNumber}</h3>
        <h3>Вік:${user.age}</h3>
        <h3>Обл.${user.region}</h3>
        <h3>Місто:${user.city}</h3>
        <h3>Має побажання для:</h3>
        <h3>${user.want}</h3>
        <a class = "aboutIn" href="/about/${user.id}">Детальніше</a>
      </div>
    </div>
  </c:forEach>
</div>

</body>
</html>