<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <cfo:header currentPage="orders"/>
    <div class="container">
        <form id="ordersForm" method="post">
        <input type="hidden" name="orderId" id="orderId" value=""/>
        <input type="hidden" name="status" id="orderStatus" value=""/>
        <table style="width:100%;">
           	<tr>
           		<th>#</th>
           		<th>Email</th>
           		<th>Full Name</th>
           		<th>Address</th>
           		<th>Phone</th>
           		<th>Creation Date</th>
           		<th>Status</th>
           		<th>Meals</th>
           		<th>Price</th>
           	</tr>
           	<c:forEach items="${orders}" var="order"><tr>
           		<td style="padding:5px;">${order.orderId}</td>
           		<td style="padding:5px;">${order.email}</td>
           		<td style="padding:5px;">${order.name}&nbsp;${order.surname}</td>
           		<td style="padding:5px;">${order.address}</td>
           		<td style="padding:5px;">${order.phone}</td>
           		<td style="padding:5px;"><fmt:formatDate value="${order.creationDate}" pattern="dd.MM.yyyy HH:mm:ss"/></td>
           		<td style="padding:5px;"><c:choose>
           			<c:when test="${order.status == 1}">Waiting</c:when>
           			<c:when test="${order.status == 2}">Preparing</c:when>
           			<c:when test="${order.status == 3}">On the way</c:when>
           			<c:when test="${order.status == 4}">Delivered</c:when>
           		</c:choose></td>
           		<td style="padding:5px;"><c:forEach items="${meals[order.orderId]}" var="meal">
           			<p>${meal.quantity}&nbsp;x&nbsp;${meal.name} = $<fmt:formatNumber value="${meal.unitPrice * meal.quantity}" pattern="#,##0.00"/></p>
           		</c:forEach></td>
           		<td style="padding:5px;">$<fmt:formatNumber value="${order.price}" pattern="#,##0.00"/></td>
           		<c:if test="${not empty sessionScope.LOGGEDIN_USER && sessionScope.LOGGEDIN_USER.userType != 1 && order.status != 4}"><td>
           			<button type="button" class="btn btn-default" onclick="$('#orderId').val(${order.orderId});$('#orderStatus').val(${order.status});$('#ordersForm').submit();">Approve</button>
           		</td></c:if>
           	</tr></c:forEach>
        </table></form>
    </div>
    <cfo:footer/>
</body>
</html>

