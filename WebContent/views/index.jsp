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
    <cfo:header currentPage="index"/>
    <div class="container">
        <header>
            <h1>
                We've launched our website!
            </h1><br />
            <p>Our continous efforts paid off.  We have finally launced our web site and online services are now available. 
                </p><br />
        </header>
        <section class="row">
            <div class="container">
                <blockquote><p>
              "Is it not delightful to have friends coming from distant quarters?" 
</p><footer>Confucius</footer>
                </blockquote><br />
             <a href="/menu?categoryId=1" class="btn btn-default btn-lg" role="button">View Our <b>Menu</b></a>
            </div>
        </section><br /><br />

		  <div class="row">
            <div class="col-md-4">
                <img src="/images/serve1.jpg" alt="food plate" class="img-rounded img-responsive">
                <h2>Chinese Medicinal Herbs</h2>
                <p class="bg-warning"><span class="text-warning">DONEC ID ELIT NON MI PORTA GRAVIDA at eget metus.</span> Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
            </div>
            <div class="col-md-4">
                <img src="/images/serve2.jpg" alt="food plate" class="img-rounded img-responsive">
                <h2>Sichuan Hotpot</h2>
                <p class="bg-warning"><span class="text-warning">DONEC ID ELIT NON MI PORTA GRAVIDA at eget metus.</span> Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
            </div>
            <div class="col-md-4">
                <img src="/images/serve3.jpg" alt="food plate" class="img-rounded img-responsive">
                <h2>Hunan Steamed Fish</h2>
                <p class="bg-warning"><span class="text-warning">DONEC SED ODIO DUI. CRAS JUSTO ODIO, dapibus ac.</span> Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
            </div>
        </div>
       </div>
    <cfo:footer/>
</body>
</html>

