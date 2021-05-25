<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
            <h2 class="text-dark"><fmt:message key="label.login"/></h2>
        </div>

        <c:if test="${not empty param.error}">
            <div class="row col-sm-12 alert alert-danger justify-content-center">
                <fmt:message key="error.incorrect.credentials"/>
            </div>
        </c:if>

        <c:if test="${not empty param.logout}">
            <div class="row col-sm-12 alert alert-success justify-content-center">
                <fmt:message key="prompt.logout.success"/>
            </div>
        </c:if>

        <form:form method="POST">
            <div class="row form-group">
                <div class="col-sm-3 text-right">
                    <label for="username"><strong><fmt:message key="label.username"/>:</strong></label>
                </div>

                <div class="col-sm-6">
                    <input id="username" name="username" class="form-control"/>
                </div>
            </div>

            <div class="row form-group">
                <div class="col-sm-3 text-right">
                    <label for="password"><strong><fmt:message key="label.password"/>:</strong></label>
                </div>

                <div class="col-sm-6">
                    <input type="password" id="password" name="password" class="form-control"/>
                </div>
            </div>

            <div class="row form-group form-check-inline col-sm-12 justify-content-center">
                <div class="col-sm-2 text-right">
                    <label for="remember-me" class="form-check-label"><strong><fmt:message key="label.remember.me"/>:</strong></label>
                </div>
                <div class="col-sm-1">
                    <input type="checkbox" id="remember-me" name="remember-me" class="form-check-input"/>
                </div>
            </div>

            <div class="row col-sm-12 justify-content-center">
                <button type="submit" name="login" value="Login" class="btn btn-primary btn-lg">
                    <fmt:message key="label.login"/>
                </button>
            </div>
        </form:form>
    </div>
</body>
</html>
