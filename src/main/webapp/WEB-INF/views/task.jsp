<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        <c:set var="readonly" value="${task.status eq 'DELETED' or task.status eq 'ARCHIVED'}"/>

        <div class="container" style="padding-top: 10pt">
            <div class="row col-sm-12 justify-content-center">
                <h2 class="text-dark"><fmt:message key="label.task"/></h2>
            </div>

            <div class="row form-group">
                <div class="col-sm-3 text-right">
                    <label for="title"><strong><fmt:message key="label.title"/>:</strong></label>
                </div>
                <div class="col-sm-6">
                    <c:choose>
                        <c:when test="${not readonly}">
                            <form:input path="title" maxlength="40" cssClass="form-control"/><br/>
                            <form:errors path="title" cssClass="text-danger"/>
                        </c:when>
                        <c:otherwise>
                            <c:out value="${task.title}"/>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="row form-group">
                <div class="col-sm-3 text-right">
                    <label for="dueDate"><strong><fmt:message key="label.due.date"/>:</strong></label>
                </div>
                <div class="col-sm-6">
                    <c:choose>
                        <c:when test="${not readonly}">
                            <form:input type="date" path="dueDate" cssClass="form-control"/><br/>
                            <form:errors path="dueDate" cssClass="text-danger"/>
                        </c:when>
                        <c:otherwise>
                            <fmt:formatDate value="${task.dueDate}" pattern="dd/MM/YYYY"/>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="row form-group">
                <div class="col-sm-3 text-right">
                    <label for="priority"><strong><fmt:message key="label.priority"/>:</strong></label>
                </div>
                <div class="col-sm-6">
                    <c:choose>
                        <c:when test="${not readonly}">
                            <form:select path="priority" cssClass="form-control">
                                <form:option value="" label="-- Please Select --"/>
                                <form:option value="HIGH" label="High" cssClass="text-danger"/>
                                <form:option value="MEDIUM" label="Medium" cssClass="text-warning"/>
                                <form:option value="LOW" label="Low" cssClass="text-success"/>
                            </form:select><br/>
                            <form:errors path="priority" cssClass="text-danger"/>
                        </c:when>
                        <c:otherwise>
                            <c:out value="${task.priority.naturalName}"/>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="row form-group">
                <div class="col-sm-3 text-right">
                    <label for="description"><strong><fmt:message key="label.description"/>:</strong></label>
                </div>

                <div class="col-sm-9">
                    <c:choose>
                        <c:when test="${not readonly}">
                            <form:textarea path="description" maxlength="1000" cssClass="form-control"/><br/>
                            <form:errors path="description" cssClass="text-danger"/>
                        </c:when>
                        <c:otherwise>
                            <c:out value="${task.description}"/>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <c:if test="${not readonly}">
                <div class="row justify-content-center">
                    <fmt:message key="${task.id eq 0 ? 'label.save' : 'label.update'}" var="saveButtonLbl"/>
                    <input type="submit" id="save" name="save" class="btn btn-success" value="${saveButtonLbl}"/>

                    <c:if test="${task.id ne 0}">
                        <fmt:message key="${task.status eq 'ACTIVE' ? 'label.mark.as.complete' : 'label.undo.completion'}" var="toggleCompletionLbl"/>
                        &nbsp;<input type="submit" id="toggleCompletion" name="toggleCompletion" class="btn btn-success" value="${toggleCompletionLbl}"/>

                        <fmt:message key="${task.status eq 'ACTIVE' ? 'label.delete' : 'label.archive'}" var="deleteLbl"/>
                        &nbsp;<input type="submit" id="delete" name="delete" class="btn btn-success" value="${deleteLbl}"/>
                    </c:if>
                </div>
            </c:if>
        </div>
    </form:form>
</body>
</html>
