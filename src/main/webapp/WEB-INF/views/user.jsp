<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sc" uri="http://www.springframework.org/security/tags" %>
<!--
    @author Shamah M Zoha
    @since 5/22/2021
-->
<html>
<head>
    <c:choose>
        <c:when test="${user.isNew()}">
            <title>To-Do | Registration</title>
        </c:when>
        <c:otherwise>
            <title>To-Do | User Details</title>
        </c:otherwise>
    </c:choose>

    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/fontawesome.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/solid.min.css"/>

    <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
    <form:form modelAttribute="user" method="POST">
        <jsp:include page="_navbar.jsp"/>

        <div class="container" style="padding-top: 10pt">
            <sc:authorize access="isAuthenticated()">
                <sc:authentication property="principal.username" var="username"/>
            </sc:authorize>

            <div class="row col-sm-12 justify-content-center">
                <fmt:message key="${user.isNew() ? 'label.registration' : 'label.user.details'}" var="pageTitle"/>
                <h2 class="text-dark"><c:out value="${pageTitle}"/></h2>
            </div>

            <div class="row form-group">
                <div class="col-sm-3 text-right">
                    <label for="username"><strong><fmt:message key="label.username"/>:</strong></label>
                </div>
                <c:choose>
                    <c:when test="${user.isNew()}">
                        <div class="col-sm-6">
                            <form:input path="username" maxlength="30" cssClass="form-control"/><br/>
                            <form:errors path="username" cssClass="text-danger"/>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="col-sm-9">
                            <c:out value="${user.username}"/>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="row form-group">
                <div class="col-sm-3 text-right">
                    <label for="inputPassword1"><strong><fmt:message key="label.password"/>:</strong></label>
                </div>
                <div class="col-sm-6">
                    <form:input type="password" path="inputPassword1" maxlength="32" cssClass="form-control"
                                disabled="${not empty username and username eq user.username}"/><br/>

                    <c:if test="${not user.isNew()}">
                        <small id="passwordGuide" class="form-text text-muted">
                            <fmt:message key="hint.password.update"/>
                        </small>
                    </c:if>

                    <form:errors path="inputPassword1" cssClass="text-danger"/>
                </div>
            </div>

            <c:if test="${user.isNew()}">
                <div class="row form-group">
                    <div class="col-sm-3 text-right">
                        <label for="inputPassword2"><strong><fmt:message key="label.retype.password"/>:</strong></label>
                    </div>
                    <div class="col-sm-6">
                        <form:input type="password" path="inputPassword2" maxlength="32" cssClass="form-control"/><br/>
                        <form:errors path="inputPassword2" cssClass="text-danger"/>
                    </div>
                </div>
            </c:if>

            <div class="row form-group">
                <div class="col-sm-3 text-right">
                    <label for="firstName"><strong><fmt:message key="label.first.name"/>:</strong></label>
                </div>
                <div class="col-sm-6">
                    <form:input path="firstName" maxlength="32" cssClass="form-control"/><br/>
                    <form:errors path="firstName" cssClass="text-danger"/>
                </div>
            </div>

            <div class="row form-group">
                <div class="col-sm-3 text-right">
                    <label for="lastName"><strong><fmt:message key="label.last.name"/>:</strong></label>
                </div>
                <div class="col-sm-6">
                    <form:input path="lastName" maxlength="32" cssClass="form-control"/><br/>
                    <form:errors path="lastName" cssClass="text-danger"/>
                </div>
            </div>

            <div class="row col-sm-12 justify-content-center">
                <button type="submit" name="save" value="Save" class="btn btn-primary btn-lg">
                    <fmt:message key="${user.isNew() ? 'label.register' : 'label.update'}" var="saveButtonLbl"/>
                    <c:out value="${saveButtonLbl}"/>
                </button>

                <sc:authorize access="hasAuthority('ADMIN')">
                    &nbsp;<button type="submit" name="toggleStatus" value="Toggle Status" class="btn btn-primary btn-lg">
                        <fmt:message key="${user.active ? 'label.deactivate' : 'label.activate'}" var="toggleStatusButtonLbl"/>
                        <c:out value="${toggleStatusButtonLbl}"/>
                    </button>
                </sc:authorize>
            </div>
        </div>
    </form:form>
</body>
</html>
