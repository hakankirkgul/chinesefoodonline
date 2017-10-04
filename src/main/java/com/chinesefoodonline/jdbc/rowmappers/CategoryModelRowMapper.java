package com.chinesefoodonline.jdbc.rowmappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chinesefoodonline.models.CategoryModel;

public class CategoryModelRowMapper implements RowMapper<CategoryModel> {

	@Override
	public CategoryModel mapRow(ResultSet rset, int rowNo) throws SQLException {
		CategoryModel model = new CategoryModel();
		
		model.setCategoryId(rset.getInt(1));
		model.setName(rset.getString(2));
		
		return model;
	}

}
