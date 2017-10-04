package com.chinesefoodonline.actions;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.chinesefoodonline.jdbc.services.IOrderService;
import com.chinesefoodonline.models.OrderMealModel;
import com.chinesefoodonline.models.OrderModel;
import com.chinesefoodonline.models.UserLoginModel;

public class OrdersController extends BaseController{
	
	private IOrderService orderService;

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView(getPageName());
		
		String orderIdTxt = request.getParameter("orderId");
		int orderId = orderIdTxt == null || orderIdTxt.isEmpty() ? 0 : Integer.parseInt(orderIdTxt);
		if(orderId != 0){
			String statusTxt = request.getParameter("status");
			int status = statusTxt == null || statusTxt.isEmpty() ? 0 : Integer.parseInt(statusTxt);
			if(status > 0 && status < 4){
				orderService.setOrderStatus(orderId, ++status);
			}
		}
		
		UserLoginModel user = (UserLoginModel)request.getSession().getAttribute("LOGGEDIN_USER");
		if(user != null){
			List<OrderModel> orders = null;
			if(user.getUserType() == 1){
				orders = orderService.getOrders(user.getUserId(), 0);
			} else if (user.getUserType() == 2){
				orders = orderService.getOrders(0, 0);
			} else if (user.getUserType() == 3){
				orders = orderService.getOrders(0, 3);
			} else if (user.getUserType() == 4){
				orders = orderService.getOrders(0, 1);
			}
			if(orders != null){
				Map<Integer,List<OrderMealModel>> meals = new HashMap<Integer,List<OrderMealModel>>();
				for (OrderModel order : orders) {
					List<OrderMealModel> orderMeals = orderService.getOrderMeals(order.getOrderId());
					meals.put(order.getOrderId(), orderMeals);
				}
				mv.getModelMap().put("meals", meals);
			}
			mv.getModelMap().put("orders", orders);
		}
		
		return mv;
	}

	public IOrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(IOrderService orderService) {
		this.orderService = orderService;
	}

}
