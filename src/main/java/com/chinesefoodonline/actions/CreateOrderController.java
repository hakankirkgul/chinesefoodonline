package com.chinesefoodonline.actions;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.chinesefoodonline.jdbc.services.IMenuService;
import com.chinesefoodonline.jdbc.services.IOrderService;
import com.chinesefoodonline.models.CategoryModel;
import com.chinesefoodonline.models.MealModel;
import com.chinesefoodonline.models.UserLoginModel;

public class CreateOrderController extends BaseController{
	
	private IOrderService orderService;
	private IMenuService menuService;

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView(getPageName());
		
		List<CategoryModel> categories = menuService.getCategories();
		mv.getModel().put("categories", categories);
		
		if(categories != null){
			Map<Integer, List<MealModel>> mealMap = new HashMap<Integer, List<MealModel>>();
			for (CategoryModel category : categories) {
				List<MealModel> meals = menuService.getCategoryMeals(category.getCategoryId());
				mealMap.put(category.getCategoryId(), meals);
			}
			mv.getModelMap().put("meals", mealMap);
		}
		
		int userId = 0;
		UserLoginModel user = (UserLoginModel)request.getSession().getAttribute("LOGGEDIN_USER");
		if(user != null){
			userId = user.getUserId();
		}
		
		String address = request.getParameter("address");
		String surname = request.getParameter("surname");
		String meals = request.getParameter("meals");
		String phone = request.getParameter("phone");
		String name = request.getParameter("name");
		
		String priceTxt = request.getParameter("price");
		double price = priceTxt == null || priceTxt.isEmpty() ? 0 : Double.parseDouble(priceTxt);
		
		if(name != null && !name.isEmpty() && surname != null && !surname.isEmpty() 
		&& address != null && !address.isEmpty() && phone != null && !phone.isEmpty() 
		&& userId > 0 && meals != null && !meals.isEmpty() && price > 0){
			orderService.createOrder(name, surname, address, phone, userId, price, meals);
			mv.getModel().put("success", true);
		}
		
		return mv;
	}

	public IOrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(IOrderService orderService) {
		this.orderService = orderService;
	}

	public IMenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(IMenuService menuService) {
		this.menuService = menuService;
	}

}
