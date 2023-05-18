<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>
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

<div class ="editblock">

    <form:form method="POST" modelAttribute="user" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${user.id}"/>
        <h2>Аватар</h2>
        <input class="editavatar" type="file" name="file" accept=".jpg, .jpeg, .png"/>
        <table class="edittable">
            <tr>
                <td class="tbName">Ім'я:</td>
                <td><form:input class = "editin" path="firstName" /></td>
            </tr>
            <tr>
                <td>Прізвище:</td>
                <td><form:input  class = "editin" path="lastName" /></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><form:input class = "editin" path="email" /></td>
            </tr>
            <tr>
                <td>Номер телефону:</td>
                <td><form:input class = "editin" path="phoneNumber" /></td>
            </tr>
            <tr>
                <td>Вік:</td>
                <td><form:input  class = "editin" path="age" /></td>
            </tr>
            <tr>
                <td>Область:</td>
                <td><form:input class = "editin" path="region"/></td>
            </tr>
            <tr>
                <td>Місто:</td>
                <td><form:input class = "editin" path="city"/></td>
            </tr>
            <tr>
                <td>Телеграм або інший спосіб зв'язку:</td>
                <td><form:input class = "editin" path="teleg" /></td>
            </tr>
            <tr>
                <h1>Про себе:</h1>
            </tr>
            <tr>
                <td colspan="2" class = "aboutTd"><form:textarea class="about" path="about"/></td>
            </tr>

            <tr>
                <td>Побажання:</td>
                <td><form:select name="list" path="want">
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
                    <option value="Похід у музей">Похід у музей</option>
            </form:select></td>
            </tr>

            <tr>
                <td colspan="2"><input class="editbtn" type="submit" value="Оновити данні" /></td>
            </tr>
        </table>
    </form:form>
</div>
<div class = "bottom"></div>
</body>
</html>