package com.chinesefoodonline.jdbc.implementation;

import java.sql.Types;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.InitializingBean;

import com.chinesefoodonline.jdbc.proc.ProcedureDefinition;
import com.chinesefoodonline.jdbc.rowmappers.CategoryModelRowMapper;
import com.chinesefoodonline.jdbc.rowmappers.MealModelRowMapper;
import com.chinesefoodonline.jdbc.services.IMenuService;
import com.chinesefoodonline.models.CategoryModel;
import com.chinesefoodonline.models.MealModel;

public class MenuService implements InitializingBean, IMenuService {

	private ProcedureDefinition procgetCategoryMeals;
	private ProcedureDefinition procgetCategories;
	private ProcedureDefinition procaddCategory;
	private ProcedureDefinition procdeleteCategory;
	private ProcedureDefinition procaddMeal;
	private ProcedureDefinition procdeleteMeal;
	private DataSource dataSource;
	
	@Override
	public void afterPropertiesSet() throws Exception {
		procgetCategoryMeals = new ProcedureDefinition(getDataSource(), "GET_CATEGORY_MEALS", new MealModelRowMapper(),Types.NUMERIC);
		procgetCategories = new ProcedureDefinition(getDataSource(), "GET_CATEGORIES", new CategoryModelRowMapper());
		procaddCategory = new ProcedureDefinition(getDataSource(), "ADD_CATEGORY", false, Types.VARCHAR);
		procdeleteCategory = new ProcedureDefinition(getDataSource(), "DELETE_CATEGORY", false, Types.NUMERIC);
		procaddMeal = new ProcedureDefinition(getDataSource(), "ADD_MEAL", false, Types.NUMERIC, Types.VARCHAR, Types.VARCHAR, Types.NUMERIC);
		procdeleteMeal = new ProcedureDefinition(getDataSource(), "DELETE_MEAL", false, Types.NUMERIC);
	}
	
	@Override
	public List<MealModel> getCategoryMeals(int categoryId) {
		List<MealModel> meals = (List<MealModel>)procgetCategoryMeals.executeProcedure(categoryId);
		return meals;
	}

	@Override
	public List<CategoryModel> getCategories() {
		List<CategoryModel> categories = (List<CategoryModel>)procgetCategories.executeProcedure();
		return categories;
	}

	@Override
	public void addCategory(String name) {
		procaddCategory.executeProcedureNoReturn(name);
	}

	@Override
	public void deleteCategory(int categoryId) {
		procdeleteCategory.executeProcedureNoReturn(categoryId);
	}

	@Override
	public void addMeal(int categoryId, String name, String description, double unitPrice) {
		procaddMeal.executeProcedureNoReturn(categoryId, name, description, unitPrice);
	}

	@Override
	public void deleteMeal(int mealId) {
		procdeleteMeal.executeProcedureNoReturn(mealId);
	}
	
	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
}
