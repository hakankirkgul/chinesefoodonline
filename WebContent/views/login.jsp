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
    <cfo:header currentPage="login"/>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4 text-center">
                <h2>
                    Login with your Chinese Food Online account
                </h2><br />
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
<div class="col-md-4 col-md-offset-4">
<form method="post">
  <div class="form-group">
    <label for="username">Email</label>
    <input type="text" class="form-control" id="email" name="email" placeholder="E-Mail" required>
  </div>
  <div class="form-group">
    <label for="password">Password</label>
    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
  </div>
  <div class="checkbox">
    <label>
      <input type="checkbox"> Remember me
    </label>
  </div>
  <button type="submit" class="btn btn-default">Login</button>
</form> 
</div>

            </div>
        </div>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4 text-center">
                <p><a href="/signup">Create an Account</a>&bull;<a href="#">Can't Sign in?</a></p>
            </div>
        </div>
    </div>
    <cfo:footer/>
</body>
</html>