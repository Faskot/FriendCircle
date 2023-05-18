<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Повна інформація</title>
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
    <h1>Профіль</h1>
    <c:choose>
        <c:when test="${not empty avatarshow}">
            <img class="avatar" src="data:image/png;base64,${avatarshow}" alt="User avatar">
        </c:when>
        <c:otherwise>
            <img class="cardImage" src="${pageContext.request.contextPath}/resources/Image/img.png" alt="Default Avatar"/>
        </c:otherwise>
    </c:choose>
    <p>Ім'я: ${userAbout.firstName}</p>
    <p>Прізвище: ${userAbout.lastName}</p>
    <p>Email: ${userAbout.email}</p>
    <p>Номер телефону: ${userAbout.phoneNumber}</p>
    <p>Вік: ${userAbout.age}</p>
    <p>Місто: ${userAbout.city}</p>
    <p>Про себе: ${userAbout.about}</p>
    <p>Побажання: ${userAbout.want}</p>
    <p>Телеграм або інший спосіб зв'язку: ${userAbout.teleg}</p>
</div>
<div class = "bottom"></div>
</body>
</html>
