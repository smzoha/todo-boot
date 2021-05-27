<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sc" uri="http://www.springframework.org/security/tags" %>
<!--
    @author Shamah M Zoha
    @since 5/27/2021
-->
<html>
<head>
    <title>To-Do | User List</title>

    <link type="text/css" rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="../css/fontawesome.min.css"/>
    <link type="text/css" rel="stylesheet" href="../css/solid.min.css"/>

    <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
</head>
<body>
    <jsp:include page="_navbar.jsp"/>

    <form:form action="/todo/user" method="post">
        <div class="container" style="padding-top: 10pt">
            <div class="row col-sm-12 justify-content-center">
                <h2 class="text-dark"><fmt:message key="label.user.list"/></h2>
            </div>

            <c:if test="${not empty param.toggleStatusSuccess or not empty param.updateSuccess}">
                <div class="row col-sm-12 alert alert-success justify-content-center">
                    <fmt:message key="${not empty param.toggleStatusSuccess
                                        ? (param.toggleStatusSuccess ? 'prompt.user.status.deactivated' : 'prompt.user.status.activated')
                                        : 'prompt.user.updated.success'}"/>
                </div>
            </c:if>

            <input type="hidden" name="userId"/>

            <div class="row">
                <table class="table table-striped table-bordered" style="width: 100%">
                    <thead class="table-dark">
                        <tr>
                            <th><fmt:message key="label.username"/></th>
                            <th><fmt:message key="label.first.name"/></th>
                            <th><fmt:message key="label.last.name"/></th>
                            <th><fmt:message key="label.status"/></th>
                            <th><fmt:message key="label.roles"/></th>
                            <th><fmt:message key="label.actions"/></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${userList}" var="user">
                            <tr>
                                <td class="align-middle"><c:out value="${user.username}"/></td>
                                <td class="align-middle"><c:out value="${user.firstName}"/></td>
                                <td class="align-middle"><c:out value="${user.lastName}"/></td>
                                <td class="align-middle">
                                    <fmt:message key="${user.active ? 'label.status.active' : 'label.status.deactivated'}"/>
                                </td>
                                <td class="align-middle"><c:out value="${user.privilegesString}"/></td>
                                <td>
                                    <c:url value="../user" var="editUrl">
                                        <c:param name="userId" value="${user.id}"/>
                                    </c:url>

                                    <a href="${editUrl}" class="btn btn-warning btn-block">
                                        <i class="fas fa-pencil-alt"></i>&nbsp;<fmt:message key="label.edit"/>
                                    </a>

                                    <sc:authentication property="principal.username" var="username"/>

                                    <c:if test="${username ne user.username}">
                                        <button type="submit" name="toggleStatusById"
                                                value="Toggle Status"
                                                class="btn btn-warning btn-block"
                                                onclick="setUserId(${user.id});">
                                            <c:choose>
                                                <c:when test="${user.active}">
                                                    <i class="fas fa-times"></i>&nbsp;<fmt:message key="label.deactivate"/>
                                                </c:when>
                                                <c:otherwise>
                                                    <i class="fas fa-undo-alt"></i>&nbsp;<fmt:message key="label.activate"/>
                                                </c:otherwise>
                                            </c:choose>
                                        </button>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </form:form>
</body>

<script type="text/javascript">
    function setUserId(userId) {
        $('input[name="userId"]').val(userId);
    }
</script>
</html>
