<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <div class="row">
            <h1>Welcome to To-Do!</h1>
        </div>

        <div class="row justify-content-center">
            <a href="login" class="btn btn-primary btn-lg">
                <i class="fas fa-sign-in-alt"></i>&nbsp;<c:out value="Login"/>
            </a>
            &nbsp;&nbsp;
            <a href="register" class="btn btn-primary btn-lg">
                <i class="fas fa-signature"></i>&nbsp;<c:out value="Register"/>
            </a>
        </div>
    </div>
</body>
</html>
