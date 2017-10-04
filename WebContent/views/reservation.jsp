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
</head>
<body>
    <cfo:header currentPage="reservation"/>
    <div class="container">
        <div class="row">
            <!--<div class="col-md-3">
                <h1>DELIVERY INFO:</h1>
            </div>-->
            <!--<div class="col-md-8 col-md-offset-1 text-center">
                <h1>MENU SELECTION</h1>
            </div>-->
        </div>
        <!--<hr />-->
        <br />
        </div>
<div class="container">
        <div class="row">
            <div class="col-md-3">
                <address>
                    <br />
                    <strong>Dragon Foods Inc.</strong><br>
                    1355 Market Street, Suite 900<br>
                    San Francisco, CA 94103<br>
                    <abbr title="Phone">P:</abbr> (123) 456-7890
                </address><br />
                <address>
                    <strong>Full Name</strong><br>
                    <a href="mailto:#">first.last@example.com</a>
                </address>
            </div>
            <div class="col-md-9">
                <h1>Reservation Form</h1>
                <h3>
                    Please fill the form below accurately to enable us serve you better!
                </h3><br />
                <div class="col-centered">
                    <form class="form-horizontal" method="post">
                        <div class="form-group">
                            <label for="FName" class="col-md-2 control-label">Name</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" name="name" id="FLName" placeholder="First & Last Name" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Phone" class="col-md-2 control-label">Phone</label>
                            <div class="col-md-5">
                                <input type="tel" class="form-control" id="Phone" name="phone" placeholder="Phone" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="#ofGuests" class="col-md-2 control-label">Guests</label>
                            <div class="col-md-5">
                                <input type="number" min="1" max="12" class="form-control" name="peopleCount" id="number" placeholder="Number of Guests" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Date" class="col-md-2 control-label">Date</label>
                            <div class="col-md-5">
                                <input type="datetime-local" class="form-control" id="date" name="date" placeholder="Date" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="message" class="col-md-2 control-label">Any Special Request</label>
                            <div class="col-md-5">
                                <textarea class="form-control" id="request" name="notes" placeholder="Message" rows="4"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-4">
                                <button type="submit" class="btn btn-default">Submit</button>
                            </div>
                        </div>
                    </form><br />
                </div>
                </div>
            </div>
        </div>
     <c:if test="${not empty success}">
	<div class="container" id="success">
        <div class="row">
            <div class="col-md-4 col-md-offset-4 text-center">
                <h3>
                    Your reservation request is taken successfully.
                </h3>
                <p><a href="/reservations">&nbsp; Check reservation status here</a></p><br>
            </div>
        </div>
    </div>
</c:if>
    <cfo:footer/>
    <script src="/js/jq/jquery-2.2.3.min.js" type="text/javascript"></script>
    <script src="/js/jq/bootstrap.min.js" type="text/javascript"></script>
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

