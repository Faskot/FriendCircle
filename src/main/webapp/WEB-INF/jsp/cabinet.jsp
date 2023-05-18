<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Особистий кабінет</title>
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

    <sec:authorize access="isAuthenticated()" >
        <button class= "btn"onclick=" window.location.href = '/logout' ">Вийти</button>
        <button class= "btn" onclick=" window.location.href = '../..'">Головна</button>
    </sec:authorize>
    <sec:authorize access="hasRole('ADMIN')" >
        <button class= "adminbtn" onclick=" window.location.href = '/admin' ">Користувачі</button>
    </sec:authorize>
</div>

<div class = "usercabinetinf">
    <h1>Особисті дані</h1>
    <c:if test="${not empty avatarshow}">
        <img class="avatar" src="data:image/png;base64,${avatarshow}" alt="User avatar">
    </c:if>
    <c:if test="${empty avatarshow}">
        <img src="${pageContext.request.contextPath}/resources/Image/img.png" alt="Default Avatar"/>
    </c:if>
    <p>Логін: ${user.username}</p>
    <p>Ім'я: ${user.firstName}</p>
    <p>Прізвище: ${user.lastName}</p>
    <p>Email: ${user.email}</p>
    <p>Номер телефону: ${user.phoneNumber}</p>
    <p>Вік: ${user.age}</p>
    <p>Область: ${user.region}</p>
    <p>Місто: ${user.city}</p>
    <p>Про себе: ${user.about}</p>
    <p>Побажання: ${user.want}</p>
    <p>Телеграм або інший спосіб зв'язку: ${user.teleg}</p>
    <button class= "btn" onclick=" window.location.href = '/editProfile' ">Змінити данні</button>
    </div>
<div class = "bottom"></div>
</body>
</html>
