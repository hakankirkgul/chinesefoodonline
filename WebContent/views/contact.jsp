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
    <cfo:header currentPage="contact"/>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <address>
                <br />
                    <strong>Chinese Foods Inc.</strong><br>
                    1355 Market Street, Suite 900<br>
                    San Francisco, CA 94103<br>
                    <abbr title="Phone">P:</abbr> (123) 456-7890
                </address><br />
                <address>
                    <strong>Full Name</strong><br>
                    <a href="mailto:#">first.last@example.com</a>
                </address>
            </div>
                                <div class="col-md-5 col-centered">
                        <h3>Questions? Comments? Please contact us.<br />
                  We look forward to hearing from you
                        </h3><br />
                        <form id="commentForm" method="post">
                            <div class="form-group">
                                <label for="firstname">First Name</label>
                                <input type="text" class="form-control" id="firstname" name="name"
                                       placeholder="First Name" required/>
                            </div>
                            <div class="form-group">
                                <label for="firstname">Last Name</label>
                                <input type="text" class="form-control" name="surname" id="lastname" placeholder="Last Name" required/>
                            </div>
                            <div class="form-group">
                                <label for="firstname">Subject</label>
                                <input type="text" class="form-control" id="subject" name="subject" placeholder="Subject" required />
                            </div>
                            <div class="form-group">
                                <label for="message">Message</label>
                                <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox">Remember me
                                </label>
                            </div>
                            <button type="submit" class="btn btn-default">Submit</button>
                        </form>
                    </div> 
                </div>
                <div class="row">
                <div class="col-md-8">
                        <c:if test="${not empty comments}"><table id="comments" style="width:100%;">
                        	<tr>
                        		<th>Date</th>
                        		<th>Subject</th>
                        		<th>Message</th>
                        		<th>Reply Message</th>
                        		<th>Reply Date</th>
                        	</tr>
                        	<c:forEach items="${comments}" var="comment"><tr>
                        		<td><fmt:formatDate value="${comment.commentDate}" pattern="dd.MM.yyyy HH:mm:ss"/></td>
                        		<td>${comment.subject}</td>
                        		<td>${comment.message}</td>
                        		<td>${comment.replyMessage}</td>
                        		<td>${comment.replyDate}</td>
                        	</tr></c:forEach>
                        </table></c:if>
                        </div>
                </div>
            </div>
    <cfo:footer/>
    <script type="text/javascript">

	$(document).ready(function(){
		if($('#comments').length > 0){
			$('html, body').animate({
                scrollTop: $("#comments").offset().top
            }, 100);
		}
	});
    </script>
</body>
</html>

