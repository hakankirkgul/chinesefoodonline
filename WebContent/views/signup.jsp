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
    <cfo:header currentPage="signup"/>
   <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4 text-center">
                <h3>
                    Signup to become a member at Chinese Foods Online!  
                </h3>
                <p>Already registered to Chinese food Online? <a href="/login">&nbsp; Login here</a></p><br>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
        <div class="container col-md-4 col-md-offset-4">
                <form method="post">
                    <div class="form-group">
                        <label for="email">E-Mail address</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="E-Mail" required/>
                        </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password"  placeholder="Password" required />
                        </div><br>
                        <div class="text-center">
                   <button type="submit" class="btn btn-default btn-block">Create My Account</button>
                   </div>
                  </form>
    </div>
        </div>
    </div>
             <c:if test="${not empty success}">
             	<div class="container" id="success">
        <div class="row">
            <div class="col-md-4 col-md-offset-4 text-center">
                <h3>
                    Your registration is successfully completed.
                </h3>
                <p><a href="/login">&nbsp; Login here</a></p><br>
            </div>
        </div>
    </div>
             </c:if>
    <cfo:footer/>
    <script type="text/javascript">

	$(document).ready(function(){
		if($('#success').length > 0){
			$('html, body').animate({
                scrollTop: $("#success").offset().top
            }, 100);
		}
	});
    </script>
</body>
</html>