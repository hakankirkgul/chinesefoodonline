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
    <cfo:header currentPage="users"/>
    <div class="container">
        <form id="usersForm" method="post"><table style="width:100%;">
           	<tr>
           		<th>#</th>
           		<th>Email</th>
           		<th>Password</th>
           		<th>User Type</th>
           		<th>Creation Date</th>
           		<th></th>
           	</tr>
           	<tr>
           		<td></td>
           		<td><input type="text" name="email" class="form-control" placeholder="E-Mail" required/></td>
           		<td><input type="text" name="password" class="form-control" placeholder="Password" required/></td>
           		<td><select name="userType" class="form-control">
           			<option value="1">Customer</option>
           			<option value="2">Kitchen Chef</option>
           			<option value="3">Delivery Staff</option>
           			<option value="4">Sales Coordinator</option>
           		</select></td>
           		<td><input type="hidden" id="deleteUserId" name="deleteUserId" value=""/></td>
           		<td><button type="submit" class="btn btn-default">Add</button></td>
           	</tr>
           	<c:forEach items="${users}" var="user"><tr>
           		<td>${user.userId}</td>
           		<td>${user.email}</td>
           		<td>${user.password}</td>
           		<td><c:choose>
           			<c:when test="${user.userType == 1}">Customer</c:when>
           			<c:when test="${user.userType == 2}">Kitchen Chef</c:when>
           			<c:when test="${user.userType == 3}">Delivery Staff</c:when>
           			<c:when test="${user.userType == 4}">Sales Coordinator</c:when>
           		</c:choose></td>
           		<td><fmt:formatDate value="${user.creationDate}" pattern="dd.MM.yyyy HH:mm:ss"/></td>
           		<td><button type="button" class="btn btn-default" onclick="$('#deleteUserId').val(${user.userId});$('#usersForm').submit();">Delete</button></td>
           	</tr></c:forEach>
        </table></form>
    </div>
    <cfo:footer/>
</body>
</html>

