package com.chinesefoodonline.jdbc.rowmappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chinesefoodonline.models.MealModel;

public class MealModelRowMapper implements RowMapper<MealModel> {

	@Override
	public MealModel mapRow(ResultSet rset, int rowNo) throws SQLException {
		MealModel model = new MealModel();
		
		model.setMealId(rset.getInt(1));
		model.setCategoryId(rset.getInt(2));
		model.setCategory(rset.getString(3));
		model.setName(rset.getString(4));
		model.setDescription(rset.getString(5));
		model.setUnitPrice(rset.getDouble(6));
		
		return model;
	}

}
