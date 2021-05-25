<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sc" uri="http://www.springframework.org/security/tags" %>

<%--
    @author Shamah M Zoha
    @since 5/3/2021
--%>
<nav class="navbar navbar-expand-sm navbar-fixed-top navbar-dark bg-dark">
    <a class="navbar-brand" href="/todo"><fmt:message key="title.todo"/></a>
    <ul class="navbar-nav mr-auto">
        <sc:authorize access="isAuthenticated()">
            <li class="nav-item pr-1">
                <a class="nav-link" href="task">
                    <i class="fas fa-plus"></i>&nbsp;<fmt:message key="label.add.task"/>
                </a>
            </li>
            <li class="nav-item pr-1">
                <a class="nav-link" href="task/list">
                    <i class="fas fa-clipboard-list"></i>&nbsp;<fmt:message key="label.task.list"/>
                </a>
            </li>

            <sc:authorize access="hasAuthority('ADMIN')">
                <li class="nav-item pr-1">
                    <a class="nav-link" href="user/list">
                        <i class="fas fa-user-friends"></i>&nbsp;<fmt:message key="label.user.list"/>
                    </a>
                </li>
            </sc:authorize>
        </sc:authorize>
    </ul>

    <ul class="navbar-nav">
        <sc:authorize access="!isAuthenticated()">
            <li class="nav-item pr-1">
                <a href="login" class="btn btn-success">
                    <i class="fas fa-sign-in-alt"></i>&nbsp;<fmt:message key="label.login"/>
                </a>
            </li>
            <li class="nav-item pr-1">
                <a href="register" class="btn btn-primary">
                    <i class="fas fa-signature"></i>&nbsp;<fmt:message key="label.register"/>
                </a>
            </li>
        </sc:authorize>
        <sc:authorize access="isAuthenticated()">
            <li class="nav-item pr-1">
                <sc:authentication property="principal.username" var="username"/>

                <div class="nav-link text-white">
                    <fmt:message key="label.user.greet" var="greeting">
                        <fmt:param value="${username}"/>
                    </fmt:message>

                    <c:out value="${greeting}"/>
                </div>
            </li>
            <li class="nav-item pr-1">
                <a class="btn btn-danger" href="perform_logout">
                    <i class="fas fa-sign-out-alt"></i>&nbsp;<fmt:message key="label.logout"/>
                </a>
            </li>
        </sc:authorize>
    </ul>
</nav>