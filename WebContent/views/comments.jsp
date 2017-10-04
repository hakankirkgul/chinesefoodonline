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
    <cfo:header currentPage="comments"/>
    <div class="container">
            <c:if test="${not empty comments}"><table style="width:100%;">
                        	<tr>
                        		<th>Date</th>
                        		<th>Customer</th>
                        		<th>Subject</th>
                        		<th>Message</th>
                        		<th>Reply Message</th>
                        	</tr>
                        	<c:forEach items="${comments}" var="comment"><tr style="vertical-align: top;">
                        		<td><fmt:formatDate value="${comment.commentDate}" pattern="dd.MM.yyyy HH:mm:ss"/></td>
                        		<td>${comment.email}</td>
                        		<td>${comment.subject}</td>
                        		<td>${comment.message}</td>
                        		<td><form method="post">
                        			<textarea name="message" class="form-control">${comment.replyMessage}</textarea>
                        			<input type="hidden" name="commentId" value="${comment.commentId}"/>
                        			<button type="submit" class="btn btn-default">Submit</button>
                        		</form></td>
                        	</tr></c:forEach>
                        </table></c:if>
            </div>
    <cfo:footer/>
</body>
</html>

