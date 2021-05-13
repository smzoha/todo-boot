<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%--
    @author Shamah M Zoha
    @since 5/4/2021
--%>
<html>
<head>
    <title>To-Do | Login</title>

    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/fontawesome.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/solid.min.css"/>

    <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
    <jsp:include page="_navbar.jsp"/>

    <div class="container" style="padding-top: 10pt">
        <div class="row col-sm-12 justify-content-center">
            <h2 class="text-dark"><c:out value="Login"/></h2>
        </div>

        <c:if test="${not empty param.error}">
            <div class="row col-sm-12 alert alert-danger justify-content-center">
                <c:out value="Incorrect Username or Password"/>
            </div>
        </c:if>

        <form:form method="POST">
            <div class="row form-group">
                <div class="col-sm-3 text-right">
                    <label for="username"><strong>Username:</strong></label>
                </div>

                <div class="col-sm-6">
                    <input id="username" name="username" class="form-control"/>
                </div>
            </div>

            <div class="row form-group">
                <div class="col-sm-3 text-right">
                    <label for="password"><strong>Password:</strong></label>
                </div>

                <div class="col-sm-6">
                    <input type="password" id="password" name="password" class="form-control"/>
                </div>
            </div>

            <div class="row col-sm-12 justify-content-center">
                <button type="submit" name="login" value="Login" class="btn btn-primary btn-lg">
                    <c:out value="Login"/>
                </button>
            </div>
        </form:form>
    </div>
</body>
</html>
