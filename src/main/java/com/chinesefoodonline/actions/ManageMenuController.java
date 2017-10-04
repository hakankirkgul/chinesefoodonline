package com.chinesefoodonline.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.chinesefoodonline.jdbc.services.IMenuService;
import com.chinesefoodonline.models.CategoryModel;
import com.chinesefoodonline.models.MealModel;

public class ManageMenuController extends BaseController {
	
	private IMenuService menuService;
	
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView(getPageName());
		
		String categoryName = request.getParameter("categoryName");
		if(categoryName != null && !categoryName.isEmpty()){
			menuService.addCategory(categoryName);
		}
		
		String deleteCategoryIdTxt = request.getParameter("deleteCategoryId");
		int deleteCategoryId = deleteCategoryIdTxt == null || deleteCategoryIdTxt.isEmpty() ? 0 : Integer.parseInt(deleteCategoryIdTxt);
		if(deleteCategoryId != 0){
			menuService.deleteCategory(deleteCategoryId);
		}
		
		String categoryIdTxt = request.getParameter("categoryId");
		int categoryId = categoryIdTxt == null || categoryIdTxt.isEmpty() ? 0 : Integer.parseInt(categoryIdTxt);
		String mealName = request.getParameter("mealName");
		String description = request.getParameter("description");
		String unitPriceTxt = request.getParameter("unitPrice");
		double unitPrice = unitPriceTxt == null || unitPriceTxt.isEmpty() ? 0 : Double.parseDouble(unitPriceTxt);
		if(mealName != null && !mealName.isEmpty() && description != null && !description.isEmpty() && unitPrice > 0){
			menuService.addMeal(categoryId, mealName, description, unitPrice);
		}
		
		String mealIdTxt = request.getParameter("mealId");
		int mealId = mealIdTxt == null || mealIdTxt.isEmpty() ? 0 : Integer.parseInt(mealIdTxt);
		if(mealId != 0){
			menuService.deleteMeal(mealId);
		}
		
		List<CategoryModel> categories = menuService.getCategories();
		mv.getModel().put("categories", categories);
		
		List<MealModel> meals = menuService.getCategoryMeals(0);
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
