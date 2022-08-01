<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 06.06.2022
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ДодатиАвто</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>
<body>
<div class = "brand">
    <a onclick="window.location.href = '/'"><img  src = "../../resources/Image/Brand.png"/></a>
</div>
<div class="editCar">
    <form:form method = "POST" modelAttribute="carsForm" >
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
        <button class="regbtn" type="submit">Додати авто</button>
    </form:form>
</div>

</body>
</html>
