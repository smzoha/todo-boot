<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sc" uri="http://www.springframework.org/security/tags" %>
<!--
    @author Shamah M Zoha
    @since 6/4/2021
-->
<html>
<head>
    <title>To-Do | Task List</title>

    <link type="text/css" rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="../css/fontawesome.min.css"/>
    <link type="text/css" rel="stylesheet" href="../css/solid.min.css"/>

    <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
</head>
<body>
    <jsp:include page="_navbar.jsp"/>

    <form:form action="/todo/task/list" method="post">
        <div class="container" style="padding-top: 10pt">
            <div class="row col-sm-12 justify-content-center">
                <h2 class="text-dark"><fmt:message key="label.task.list"/></h2>
            </div>

            <input type="hidden" name="taskId"/>

            <div class="row">
                <jsp:include page="_taskTable.jsp">
                    <jsp:param name="taskList" value="pendingTasks"/>
                    <jsp:param name="tableId" value="pendingTasksTable"/>
                    <jsp:param name="sectionId" value="pendingTasksSection"/>
                    <jsp:param name="showCollapseBtn" value="true"/>
                    <jsp:param name="sectionTitleKey" value="label.section.pending.tasks"/>
                    <jsp:param name="showActionsColumn" value="true"/>
                    <jsp:param name="includeCompleted" value="false"/>
                    <jsp:param name="includeStatusAction" value="true"/>
                    <jsp:param name="includeDeleteAction" value="true"/>
                </jsp:include>
            </div>

            <div class="row">
                <jsp:include page="_taskTable.jsp">
                    <jsp:param name="taskList" value="completedTasks"/>
                    <jsp:param name="tableId" value="completedTasksTable"/>
                    <jsp:param name="sectionId" value="completedTasksSection"/>
                    <jsp:param name="showCollapseBtn" value="true"/>
                    <jsp:param name="sectionTitleKey" value="label.section.completed.tasks"/>
                    <jsp:param name="showActionsColumn" value="true"/>
                    <jsp:param name="includeCompleted" value="true"/>
                    <jsp:param name="includeStatusAction" value="true"/>
                    <jsp:param name="includeDeleteAction" value="true"/>
                </jsp:include>
            </div>

            <div class="row">
                <jsp:include page="_taskTable.jsp">
                    <jsp:param name="taskList" value="archivedTasks"/>
                    <jsp:param name="tableId" value="archivedTasksTable"/>
                    <jsp:param name="sectionId" value="archivedTasksSection"/>
                    <jsp:param name="showCollapseBtn" value="true"/>
                    <jsp:param name="sectionTitleKey" value="label.section.archived.tasks"/>
                    <jsp:param name="showActionsColumn" value="false"/>
                    <jsp:param name="includeCompleted" value="true"/>
                    <jsp:param name="includeStatusAction" value="false"/>
                    <jsp:param name="includeDeleteAction" value="false"/>
                </jsp:include>
            </div>
        </div>
    </form:form>
</body>
<script type="text/javascript">
    function setTaskId(taskId) {
        $('input[name="taskId"]').val(taskId);
    }
</script>
</html>
