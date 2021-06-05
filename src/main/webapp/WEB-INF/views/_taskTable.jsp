<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
    @author Shamah M Zoha
    @since 6/4/2021
--%>
<c:choose>
    <c:when test="${param.taskList eq 'pendingTasks'}">
        <c:set var="taskList" value="${pendingTasks}"/>
    </c:when>
    <c:when test="${param.taskList eq 'completedTasks'}">
        <c:set var="taskList" value="${completedTasks}"/>
    </c:when>
    <c:when test="${param.taskList eq 'archivedTasks'}">
        <c:set var="taskList" value="${archivedTasks}"/>
    </c:when>
</c:choose>

<div class="col-sm-12" style="padding-bottom: 10pt">
    <div class="card">
        <div class="card-header bg-dark">
            <div class="row">
                <div class="col-sm-9">
                    <strong class="text-white"><fmt:message key="${param.sectionTitleKey}"/></strong>
                </div>
                <c:if test="${param.showCollapseBtn}">
                    <div class="col-sm-3 text-right">
                        <a href="#" class="btn btn-primary" data-toggle="collapse" data-target="#${param.sectionId}">
                            <fmt:message key="label.show.hide"/>
                        </a>
                    </div>
                </c:if>
            </div>
        </div>
        <div id="${param.sectionId}" class="card-body collapse show">
            <table id="${param.tableId}" class="table table-striped table-bordered" style="width: 100%">
                <thead class="table-dark">
                    <tr>
                        <th><fmt:message key="label.title"/></th>
                        <th><fmt:message key="label.due.date"/></th>
                        <th><fmt:message key="label.status"/></th>
                        <th><fmt:message key="label.priority"/></th>
                        <th><fmt:message key="label.created"/></th>
                        <c:if test="${param.includeCompleted}">
                            <th><fmt:message key="label.completed"/></th>
                        </c:if>
                        <c:if test="${param.showActionsColumn}">
                            <th style="width: 15%;"><fmt:message key="label.actions"/></th>
                        </c:if>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${taskList}" var="task">
                        <tr>
                            <td class="align-middle"><c:out value="${task.title}"/></td>
                            <td class="align-middle"><fmt:formatDate value="${task.dueDate}" pattern="dd/MM/YYYY"/></td>
                            <td class="align-middle"><c:out value="${task.status.naturalName}"/></td>
                            <td class="align-middle"><c:out value="${task.priority.naturalName}"/></td>
                            <td class="align-middle">
                                <c:out value="${task.createdBy.firstName} ${task.createdBy.lastName} on " />
                                <fmt:formatDate value="${task.createdDate}" pattern="dd/MM/YYYY"/>
                            </td>
                            <c:if test="${param.includeCompleted}">
                                <td class="align-middle">
                                    <c:if test="${not empty task.completedBy}">
                                        <c:out value="${task.completedBy.firstName} ${task.completedBy.lastName} on " />
                                        <fmt:formatDate value="${task.completedDate}" pattern="dd/MM/YYYY"/>
                                    </c:if>
                                </td>
                            </c:if>
                            <c:if test="${param.showActionsColumn}">
                                <td class="align-middle">
                                    <c:url value="/task" var="editUrl">
                                        <c:param name="taskId" value="${task.id}"/>
                                    </c:url>

                                    <a href="${editUrl}" name="edit" value="Edit" class="btn btn-warning">
                                        <i class="fas fa-pencil-alt"></i>
                                    </a>

                                    <c:if test="${param.includeStatusAction}">
                                        <button type="submit" name="toggleCompletion" value="Mark Status"
                                                class="btn btn-warning" onclick="setTaskId(${task.id});">
                                            <c:choose>
                                                <c:when test="${param.taskList eq 'pendingTasks'}">
                                                    <i class="fas fa-check"></i>
                                                </c:when>
                                                <c:when test="${param.taskList eq 'completedTasks'}">
                                                    <i class="fas fa-undo"></i>
                                                </c:when>
                                            </c:choose>
                                        </button>
                                    </c:if>

                                    <c:if test="${param.includeStatusAction}">
                                        <button type="submit" name="delete" value="Mark Status"
                                                class="btn btn-warning" onclick="setTaskId(${task.id});">
                                            <c:choose>
                                                <c:when test="${param.taskList eq 'pendingTasks'}">
                                                    <i class="fas fa-trash"></i>
                                                </c:when>
                                                <c:when test="${param.taskList eq 'completedTasks'}">
                                                    <i class="fas fa-archive"></i>
                                                </c:when>
                                            </c:choose>
                                        </button>
                                    </c:if>
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


