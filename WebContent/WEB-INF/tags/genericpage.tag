<%@tag language="java" description="Generic Wrapper Tag" pageEncoding="UTF-8"%>
<%@attribute name="title" required="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>${title}</title>
	
	<spring:url value="/resources/bootstrap/css/bootstrap.min.css" var="bootstrapCSS" />


    <link href="${bootstrapCSS}" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>

<body style="background: #343434;">
    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation" >
        <div class="container topnav " >
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span> 
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand topnav" href="${pageContext.request.contextPath}/index">QuestionRepo</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="${pageContext.request.contextPath}/form">Question Form</a>
                    </li>
                    <li>
                       <a href="${pageContext.request.contextPath}/settings">Question Settings</a>
                    </li>		
                </ul>
            </div>
        </div>
    </nav>


<!-- The page content goes here -->\
<div style="padding-top:30px">
<jsp:doBody/>
</div>


<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/jquery.js"></script>
<!-- JSON Serializer-->
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/jquery.serializejson.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>


</body>

</html>