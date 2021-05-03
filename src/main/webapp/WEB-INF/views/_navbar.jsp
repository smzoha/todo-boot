<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
    @author Shamah M Zoha
    @since 5/3/2021
--%>
<nav class="navbar navbar-expand-sm navbar-fixed-top navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Todo</a>
    <ul class="navbar-nav">
        <li class="nav-item pr-1">
            <a class="nav-link" href="task">
                <i class="fas fa-plus"></i>&nbsp;<c:out value="Add Task"/>
            </a>
        </li>
        <li class="nav-item pr-1">
            <a class="nav-link" href="task/list">
                <i class="fas fa-clipboard-list"></i>&nbsp;<c:out value="Task List"/>
            </a>
        </li>
        <li class="nav-item pr-1">
            <a class="nav-link" href="user/list">
                <i class="fas fa-user-friends"></i>&nbsp;<c:out value="User List"/>
            </a>
        </li>
    </ul>
</nav>