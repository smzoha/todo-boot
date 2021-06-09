<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
        <div class="row" style="padding-bottom: 10pt">
            <h1><fmt:message key="msg.welcome"/></h1>
        </div>

        <c:if test="${not empty param.registerSuccess}">
            <div class="row col-sm-12 alert alert-success justify-content-center">
                <fmt:message key="prompt.user.register.success"/>
            </div>
        </c:if>

        <sc:authorize access="isAuthenticated()">
            <form:form action="/todo/task/list" method="post">
                <input type="hidden" name="taskId"/>
                <input type="hidden" name="dashboardAction" value="true"/>

                <div class="row">
                    <jsp:include page="_taskTable.jsp">
                        <jsp:param name="taskList" value="pendingTasks"/>
                        <jsp:param name="tableId" value="pendingTasksTable"/>
                        <jsp:param name="sectionId" value="pendingTasksSection"/>
                        <jsp:param name="showCollapseBtn" value="false"/>
                        <jsp:param name="sectionTitleKey" value="label.section.pending.tasks"/>
                        <jsp:param name="showActionsColumn" value="true"/>
                        <jsp:param name="includeCompleted" value="false"/>
                        <jsp:param name="includeStatusAction" value="true"/>
                        <jsp:param name="includeDeleteAction" value="false"/>
                    </jsp:include>
                </div>
            </form:form>
        </sc:authorize>
    </div>
</body>
<script type="text/javascript">
    function setTaskId(taskId) {
        $('input[name="taskId"]').val(taskId);
    }
</script>
</html>
