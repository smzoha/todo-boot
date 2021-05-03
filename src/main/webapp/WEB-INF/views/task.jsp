<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!--
    @author Shamah M Zoha
    @since 5/1/2021
-->
<html>
<head>
    <title>To-Do | Task</title>

    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/fontawesome.min.css"/>
    <link rel="stylesheet" href="css/solid.min.css"/>

    <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
    <form:form modelAttribute="task" action="task" method="POST">
        <jsp:include page="_navbar.jsp"/>

        <div class="container" style="padding-top: 10pt">
            <div class="row form-group">
                <div class="col-sm-3 text-right">
                    <label for="title"><strong>Title:</strong></label>
                </div>
                <div class="col-sm-6">
                    <form:input path="title" maxlength="40" cssClass="form-control"/><br/>
                    <form:errors path="title" cssClass="text-danger"/>
                </div>
            </div>

            <div class="row form-group">
                <div class="col-sm-3 text-right">
                    <label for="dueDate"><strong>Due Date:</strong></label>
                </div>
                <div class="col-sm-6">
                    <form:input type="date" path="dueDate" cssClass="form-control"/><br/>
                    <form:errors path="dueDate" cssClass="text-danger"/>
                </div>
            </div>

            <div class="row form-group">
                <div class="col-sm-3 text-right">
                    <label for="priority"><strong>Priority:</strong></label>
                </div>
                <div class="col-sm-6">
                    <form:select path="priority" cssClass="form-control">
                        <form:option value="" label="-- Please Select --"/>
                        <form:option value="HIGH" label="High" cssClass="text-danger"/>
                        <form:option value="MEDIUM" label="Medium" cssClass="text-warning"/>
                        <form:option value="LOW" label="Low" cssClass="text-success"/>
                    </form:select><br/>
                    <form:errors path="priority" cssClass="text-danger"/>
                </div>
            </div>

            <div class="row form-group">
                <div class="col-sm-3 text-right">
                    <label for="description"><strong>Description:</strong></label>
                </div>
                <div class="col-sm-9">
                    <form:textarea path="description" maxlength="1000" cssClass="form-control"/><br/>
                    <form:errors path="description" cssClass="text-danger"/>
                </div>
            </div>

            <div class="row justify-content-center">
                <input type="submit" id="saveTask" name="saveTask" class="btn btn-success" value="${task.id eq 0 ? 'Save' : 'Update'}"/>

                <c:if test="${task.id ne 0}">
                    &nbsp;<input type="submit" id="markAsComplete" name="markAsComplete" class="btn btn-success" value="Mark as Complete"/>
                </c:if>
            </div>
        </div>
    </form:form>
</body>
</html>
