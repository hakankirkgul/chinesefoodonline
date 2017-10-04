<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<ul class="dropdown-menu">
	<c:forEach items="${categories}" var="category">
    	<li><a href="/menu?categoryId=${category.categoryId}">${category.name}</a></li>
	</c:forEach>
</ul>