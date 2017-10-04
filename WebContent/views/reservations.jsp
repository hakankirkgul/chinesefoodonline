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
    <cfo:header currentPage="reservations"/>
    <div class="container">
        <form id="reservationsForm" method="post">
        <input type="hidden" name="reservationId" id="reservationId" value=""/>
        <input type="hidden" name="status" id="reservationStatus" value=""/>
        <table style="width:100%;">
           	<tr>
           		<th>#</th>
           		<th>Email</th>
           		<th>Full Name</th>
           		<th>Phone</th>
           		<th>Date</th>
           		<th>Seat Count</th>
           		<th>Notes</th>
           		<th>Status</th>
           		<th></th>
           		<th></th>
           		<th></th>
           	</tr>
           	<c:forEach items="${reservations}" var="reservation"><tr>
           		<td style="padding:5px;">${reservation.reservationId}</td>
           		<td style="padding:5px;">${reservation.email}</td>
           		<td style="padding:5px;">${reservation.name}</td>
           		<td style="padding:5px;">${reservation.phone}</td>
           		<td style="padding:5px;"><fmt:formatDate value="${reservation.date}" pattern="dd.MM.yyyy HH:mm"/></td>
           		<td style="padding:5px;">${reservation.peopleCount}</td>
           		<td style="padding:5px;">${reservation.notes}</td>
           		<td style="padding:5px;"><c:choose>
           			<c:when test="${reservation.status == 0}">Waiting</c:when>
           			<c:when test="${reservation.status == 1}">Reserved (${reservation.tableName})</c:when>
           			<c:when test="${reservation.status == 2}">Cancelled</c:when>
           		</c:choose></td>
           		<c:if test="${not empty sessionScope.LOGGEDIN_USER && sessionScope.LOGGEDIN_USER.userType == 4 && reservation.status == 0}">
           		<td style="padding:5px;"><input class="form-control" type="text" name="tableName${reservation.reservationId}" value="${reservation.tableName}" placeholder="Table Name"/></td>
           		<td><button type="button" class="btn btn-default" onclick="$('#reservationId').val(${reservation.reservationId});$('#reservationStatus').val(1);$('#reservationsForm').submit();">Reserve</button></td>
           		</c:if>
           		<c:if test="${not empty sessionScope.LOGGEDIN_USER && (sessionScope.LOGGEDIN_USER.userType == 1 || sessionScope.LOGGEDIN_USER.userType == 4) && reservation.status == 0}"><td>
           			<button type="button" class="btn btn-default" onclick="$('#reservationId').val(${reservation.reservationId});$('#reservationStatus').val(2);$('#reservationsForm').submit();">Cancel</button>
           		</td></c:if>
           	</tr></c:forEach>
        </table></form>
    </div>
    <cfo:footer/>
</body>
</html>

