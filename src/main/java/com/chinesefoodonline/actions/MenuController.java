package com.chinesefoodonline.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.chinesefoodonline.jdbc.services.IMenuService;
import com.chinesefoodonline.models.CategoryModel;
import com.chinesefoodonline.models.MealModel;

public class MenuController extends BaseController {
	
	private IMenuService menuService;
	
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView(getPageName());
		
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		mv.getModel().put("categoryId", categoryId);
		
		List<CategoryModel> categories = menuService.getCategories();
		mv.getModel().put("categories", categories);
		
		List<MealModel> meals = menuService.getCategoryMeals(categoryId);
		mv.getModel().put("meals", meals);
		
		return mv;
	}

	public IMenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(IMenuService menuService) {
		this.menuService = menuService;
	}

}
