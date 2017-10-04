<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="currentPage" description="currentPage" required="true" type="java.lang.String" %>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Chinese Foods Online</a>
          </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse pull-right" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li <c:if test="${currentPage == \"index\"}">class="active"</c:if>><a href="/">About <span class="sr-only">(current)</span></a></li>
                <li class="dropdown<c:if test="${currentPage == \"menu\"}"> active</c:if>">
                    <a href="/menu?categoryId=1" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Menu<span class="caret"></span></a>
                    <c:import url="/categoryMenu"></c:import>
                </li>
                <c:choose>
                	<c:when test="${not empty sessionScope.LOGGEDIN_USER}">
                		<c:choose>
                			<c:when test="${sessionScope.LOGGEDIN_USER.userType == 1}">
		                		<li <c:if test="${currentPage == \"order\"}">class="active"</c:if>><a href="/delivery">Order Online</a></li>
		                		<li <c:if test="${currentPage == \"reservation\"}">class="active"</c:if>><a href="/reservation">Reserve Table</a></li>
		                		<li <c:if test="${currentPage == \"contact\"}">class="active"</c:if>><a href="/contact">Contact us <span class="glyphicon glyphicon-pencil"></span></a></li>
		                		<li <c:if test="${currentPage == \"reservations\"}">class="active"</c:if>><a href="/reservations">Reservations</a></li>
                			</c:when>
                			<c:when test="${sessionScope.LOGGEDIN_USER.userType == 2}">
		                		<li <c:if test="${currentPage == \"users\"}">class="active"</c:if>><a href="/users">Manage Users</a></li>
		                		<li <c:if test="${currentPage == \"manageMenu\"}">class="active"</c:if>><a href="/manageMenu">Manage Menu</a></li>
		                		<li <c:if test="${currentPage == \"comments\"}">class="active"</c:if>><a href="/comments">Reply Comments <span class="glyphicon glyphicon-pencil"></span></a></li>
                			</c:when>
                			<c:when test="${sessionScope.LOGGEDIN_USER.userType == 4}">
		                		<li <c:if test="${currentPage == \"reservations\"}">class="active"</c:if>><a href="/reservations">Reservations</a></li>
                			</c:when>
                		</c:choose>
                		<li <c:if test="${currentPage == \"orders\"}">class="active"</c:if>><a href="/orders">Orders</a></li>
                		<li><a href="/logout">Logout <span class="glyphicon glyphicon-log-out"></span></a></li>
                	</c:when>
                	<c:otherwise>
                		<li <c:if test="${currentPage == \"login\"}">class="active"</c:if>><a href="/login">Login <span class="glyphicon glyphicon-log-in"></span></a></li>
                	</c:otherwise>
                </c:choose>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="jumbotron">
    <div class="container">
        <h1>Chinese Food<small> is our business!</small></h1>
        <p>
            Do you rather enjoy your meal at the comfort of your home?<br>
            We will deliver your order
        </p>
        <p><a class="btn btn-primary btn-lg" href="/signup" role="button">Sign up &raquo;</a></p>
        <!-- </div> -->
    </div>
</div>
