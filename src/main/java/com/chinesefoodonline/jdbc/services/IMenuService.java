package com.chinesefoodonline.jdbc.services;

import java.util.List;

import com.chinesefoodonline.models.CategoryModel;
import com.chinesefoodonline.models.MealModel;

public interface IMenuService {

	List<MealModel> getCategoryMeals(int categoryId);
	
	List<CategoryModel> getCategories();
	
	void addCategory(String name);
	
	void deleteCategory(int categoryId);
	
	void addMeal(int categoryId, String name, String description, double unitPrice);
	
	void deleteMeal(int mealId);
	
}
