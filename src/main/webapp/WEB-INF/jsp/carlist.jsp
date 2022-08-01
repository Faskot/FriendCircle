<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 07.06.2022
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>СписокАвто</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>
<body>
<div class = "brand">
    <a onclick="window.location.href = '/'"><img  src = "../../resources/Image/Brand.png"/></a>
</div>
<div class="cartable">
    <table class = "table-car">
        <thead>
        <th>Brand</th>
        <th>Model</th>
        <th>Year</th>
        <th>Color</th>
        <th>Cost</th>
        </thead>
        <c:forEach items="${allCars}" var="cars">
            <tr>
                <td>${cars.brand}</td>
                <td>${cars.model}</td>
                <td>${cars.year}</td>
                <td>${cars.color}</td>
                <td>${cars.cost}</td>
                <td>
                    <form action="${pageContext.request.contextPath}/carlist" method="post">
                        <input type="hidden" name="carsId" value="${cars.id}"/>
                        <input type="hidden" name="action" value="delete"/>
                        <button class="btn" type="submit">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
