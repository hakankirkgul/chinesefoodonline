<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cfo" tagdir="/WEB-INF/tags/" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
    <title>Chinese Food Online</title>
    <link href="/css/jq/united-bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="/css/jq/jumbotron.css" rel="stylesheet" type="text/css"/>
    <link href="/css/jq/sticky-footer.css" rel="stylesheet" type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Ubuntu:400,300" rel="stylesheet" type="text/css"/>
    <link href="/css/mystyle.css" rel="stylesheet" type="text/css"/>
    <script src="/js/jq/jquery-2.2.3.min.js" type="text/javascript"></script>
    <script src="/js/jq/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
    <cfo:header currentPage="menu"/>
    <div class="container">
        <div class="row">
            <div class="container">
                <div class="list-group col-md-3">
                	<c:forEach items="${categories}" var="category">
                    	<a href="/menu?categoryId=${category.categoryId}" class="list-group-item <c:if test="${category.categoryId == categoryId}">active</c:if>"> ${category.name}</a>
                	</c:forEach>
                </div>
                <div class="list-group col-md-6">
                	<c:forEach items="${meals}" var="meal">
	                    <a href="#" class="list-group-item">
	                        <h3 class="list-group-item-heading">${meal.name} ${meal.unitPrice} $</h3>
	                        <p class="list-group-item-text">${meal.description}</p>
	                    </a>
                	</c:forEach>
                </div>
                <div class="col-md-3">
                    <a class="btn btn-default btn-lg btn-block" href="/images/menu.jpg" target="_blank">Download COL menu here</a>
                </div>
            </div>
        </div>
        <hr />
    </div>
    <cfo:footer/>
</body>
</html>

