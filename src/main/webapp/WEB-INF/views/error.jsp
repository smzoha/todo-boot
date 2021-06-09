<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
    @author Shamah M Zoha
    @since 6/10/2021
--%>
<html>
<head>
    <title>To-Do | Error</title>

    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/fontawesome.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/solid.min.css"/>

    <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-12 text-center">
                <h1><c:out value="Oops, something must have gone wrong!"/></h1>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 text-center">
                <h6><c:out value="There's no telling what went wrong - it might have been us, you probably are not authorized to see this, the moon isn't bright enough today, etc."/></h6>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 text-center" style="padding-bottom: 10pt">
                <h6><c:out value="Let us take you back to our original programming."/></h6>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 text-center">
                <a href="/todo" class="btn btn-primary"><c:out value="Back to Dashboard"/></a>
            </div>
        </div>
    </div>
</body>
</html>
