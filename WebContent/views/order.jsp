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
    <cfo:header currentPage="order"/>
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
              <form id="orderForm" method="post">
                    <div class="container">
                        <div class="col-md-3">
                            <h2>DELIVERY INFO</h2>
                            <div class="form-group">
                                <label for="firstname" class="sr-only">First Name</label>
                                <input type="text" class="form-control" id="fname" name="name" placeholder="First Name" required>
                            </div>
                            <div class="form-group">
                                <label for="lastname" class="sr-only">Last Name</label>
                                <input type="text" class="form-control" id="lastname" name="surname" placeholder="Last Name" required>
                            </div>
                            <div class="form-group">
                                <label for="address" class="sr-only">Address</label>
                                <input type="text" class="form-control" id="address" name="address" placeholder="Address" required>
                            </div>
                            <div class="form-group">
                                <label for="lastname" class="sr-only">Phone</label>
                                <input type="tel" class="form-control" id="phone" name="phone" placeholder="Phone" required>
                            </div>
                        </div>
                   		<div class="col-md-5 col-md-offset-1 text-center">
                          <h2>MENU SELECTION</h2>
                          
                     <c:forEach items="${categories}" var="category">
                     <div class="container">
                        <div class="col-md-3 col-md-offset-1">
                            <div class="form-group">
                                <select class="form-control meal" categoryId="${category.categoryId}" id="meal${category.categoryId}">
                                    <option value="0" unitPrice="0">${category.name}</option>
                                    <c:forEach items="${meals[category.categoryId]}" var="meal">
                                    	<option value="${meal.mealId}" unitPrice="${meal.unitPrice}">${meal.name} $<fmt:formatNumber value="${meal.unitPrice}" pattern="#,##0.00"/></option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <select class="form-control quantity" id="quantity${category.categoryId}" categoryId="${category.categoryId}">
                                    <option value="0">Quantity</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group">
                                <span class="input-group-addon">$</span>
                                <output type="text" class="form-control price" id="price${category.categoryId}">0.00</output>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <div class="container">
                    	<div class="col-md-3 col-md-offset-1">
                    	</div>
                        <div class="col-md-2">
                              <div class="form-group" id="myformgroup">
                                  <label for="foodtotal" class="control-label">Food Total:</label>
                                 </div>
                            </div>
                            <div class="col-md-2">
                                <div class="input-group">
                                    <span class="input-group-addon">$</span>
                                    <output type="text" class="form-control" id="foodtotal">0.00</output>
                                </div>
                            </div>
                  </div><br />
                      </div>
                        </div>
                    <div class="col-md-2 col-md-offset-9">
                        <button type="submit" class="btn btn-default" id="btnCreateOrder">Submit Order</button>
                    </div>
                    <input type="hidden" id="meals" name="meals" value=""/>
                    <input type="hidden" id="totalPrice" name="price" value=""/>
                   </form>
             </div>
     </div>
     <c:if test="${not empty success}">
	<div class="container" id="success">
        <div class="row">
            <div class="col-md-4 col-md-offset-4 text-center">
                <h3>
                    Your order is successfully completed.
                </h3>
                <p><a href="/orders">&nbsp; Check order status here</a></p><br>
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
    		$('select.meal').change(function(){
    			var unitPrice = parseFloat($(this).find('option:selected').attr('unitPrice'));
    			var categoryId = $(this).attr('categoryId');
    			var quantity = parseInt($('#quantity'+categoryId).val());
    			$('#price'+categoryId).val((unitPrice*quantity).toFixed(2));
    			var totalPrice = 0;
    			$('.price').each(function(idx,price){
					totalPrice += parseFloat($(price).val());
        		});
        		$('#foodtotal').val(totalPrice.toFixed(2));
        		$('#totalPrice').val(totalPrice);
            }).trigger('change');

    		$('select.quantity').change(function(){
    			var categoryId = $(this).attr('categoryId');
    			var quantity = parseInt($(this).val());
    			var unitPrice = parseFloat($('#meal'+categoryId).find('option:selected').attr('unitPrice'));
    			$('#price'+categoryId).val((unitPrice*quantity).toFixed(2));
    			var totalPrice = 0;
    			$('.price').each(function(idx,price){
					totalPrice += parseFloat($(price).val());
        		});
        		$('#foodtotal').val(totalPrice.toFixed(2));
            }).trigger('change');
        	
    		$("#btnCreateOrder").click(function () {
   		     	var meals = '<menu>';
   		     	var totalPrice = 0;
   		     	$('select.meal').each(function(idx,meal){
   	   		     	var mealId = $(meal).val();
   	   		     	var categoryId = $(meal).attr('categoryId');
   	   		     	var quantity = parseInt($('#quantity'+categoryId).val());
   	   		     	if(mealId > 0 && quantity > 0){
   	   	   		     	var unitPrice = parseFloat($(meal).find('option:selected').attr('unitPrice'));
   						meals += '<meal>'
   							  +  '<id>' + mealId + '</id>'
   							  +  '<quantity>' + quantity + '</quantity>'
   							  +  '<unitPrice>' + unitPrice + '</unitPrice>'
   							  +  '</meal>';
					    totalPrice += quantity * unitPrice;
   	   	   	   		}
   	   		    });
   	   		    meals += '</menu>';

   	   		    if(totalPrice > 0){
					$('#meals').val(meals);
	        		$('#totalPrice').val(totalPrice);
   	   	   		} else {
					alert('Please select meals to order.');
					return false;
   	   	   	   	}
   		    });
        });
    </script>
</body>
</html>

