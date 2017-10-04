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
    <cfo:header currentPage="order"/>
    <div class="container">
        <div class="row">
            <div class="col-md-5 col-md-offset-2">
                    <a href="/images/menu.jpg" target="_blank"  class="btn btn-default btn-lg btn-block" role="button"><b>Download Our Delivery Menu Here </b><span class="glyphicon glyphicon-download-alt"></span></a>
                </div>
            <div class="col-md-5">
                    <a href="/order" class="btn btn-default btn-lg" role="button"><b>Order Online Here</b></a>
                </div>
                  </div>
                  </div>
                <br>
        <div class="container">
            <div class="row">
            <div class="col-md-5 col-md-offset-2">
                <img src="/images/serve12.jpg" alt="food logo" class="img-rounded img-responsive">
                <h2>Chinese Food Catering!</h2>
                <p class="text-warning"><span class="text-warning">Call us at <span class="text-danger">0312-000-999</span> for your catering needs. 
                We will provide food and beverage supplies for your meetings.</span></p>
            </div>
            </div>
   </div>
    <cfo:footer/>
</body>
</html>

