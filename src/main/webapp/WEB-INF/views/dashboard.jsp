<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sc" uri="http://www.springframework.org/security/tags" %>

<%--
    @author Shamah M Zoha
    @since 5/3/2021
--%>
<html>
<head>
    <title>To-Do</title>

    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/fontawesome.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/solid.min.css"/>

    <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
    <jsp:include page="_navbar.jsp"/>

    <div class="container" style="padding-top: 10pt">
        <c:if test="${not empty param.registerSuccess}">
            <div class="row col-sm-12 alert alert-success justify-content-center">
                <fmt:message key="prompt.user.register.success"/>
            </div>
        </c:if>

        <div class="row">
            <h1><fmt:message key="msg.welcome"/></h1>
        </div>
    </div>
</body>
</html>
