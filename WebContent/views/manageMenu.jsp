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
    <cfo:header currentPage="manageMenu"/>
    <div class="container">
    	 <div class="row">
            <div class="col-md-3">
		        <form id="categoryForm" method="post">
		        	<input type="hidden" id="deleteCategoryId" name="deleteCategoryId" value=""/>
		        	<table style="width:100%;">
			           	<tr>
			           		<th>Category Name</th>
			           		<th></th>
			           	</tr>
			           	<tr>
			           		<td><input type="text" name="categoryName" class="form-control" placeholder="Category Name" required/></td>
			           		<td><button type="submit" class="btn btn-default">Add</button></td>
			           	</tr>
			           	<c:forEach items="${categories}" var="category"><tr>
			           		<td>${category.name}</td>
			           		<td><button type="button" class="btn btn-default" onclick="$('#deleteCategoryId').val(${category.categoryId});$('#categoryForm').submit();">Delete</button></td>
			           	</tr></c:forEach>
			        </table>
			       </form>
        	</div>
        	<div class="col-md-8">
		        <form id="mealForm" method="post">
		        	<input type="hidden" id="mealId" name="mealId" value=""/>
		        	<table>
			           	<tr>
			           		<th>Meal Name</th>
			           		<th>Category</th>
			           		<th>Description</th>
			           		<th>Unit Price</th>
			           		<th></th>
			           	</tr>
			           	<tr>
			           		<td><input type="text" name="mealName" class="form-control" style="width:125px;" required/></td>
			           		<td><select name="categoryId" class="form-control" style="width:125px;">
			           			<c:forEach items="${categories}" var="category">
			           				<option value="${category.categoryId}">${category.name}</option>
			           			</c:forEach>
			           		</select></td>
			           		<td><textarea name="description" class="form-control" required></textarea></td>
			           		<td><input type="text" name="unitPrice" class="form-control" required/></td>
			           		<td><button type="submit" class="btn btn-default">Add</button></td>
			           	</tr>
			           	<c:forEach items="${meals}" var="meal"><tr>
			           		<td>${meal.name}</td>
			           		<td>${meal.category}</td>
			           		<td>${meal.description}</td>
			           		<td>$<fmt:formatNumber value="${meal.unitPrice}" pattern="#,##0.00"/></td>
			           		<td><button type="button" class="btn btn-default" onclick="$('#mealId').val(${meal.mealId});$('#mealForm').submit();">Delete</button></td>
			           	</tr></c:forEach>
			        </table>
			       </form>
        	</div>
        </div>
    </div>
    <cfo:footer/>
</body>
</html>

