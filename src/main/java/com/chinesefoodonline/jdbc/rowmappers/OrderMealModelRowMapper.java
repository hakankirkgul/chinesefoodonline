package com.chinesefoodonline.jdbc.rowmappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chinesefoodonline.models.OrderMealModel;

public class OrderMealModelRowMapper implements RowMapper<OrderMealModel> {

	@Override
	public OrderMealModel mapRow(ResultSet rset, int rowNo) throws SQLException {
		OrderMealModel model = new OrderMealModel();
		
		model.setOrderId(rset.getInt(1));
		model.setMealId(rset.getInt(2));
		model.setName(rset.getString(3));
		model.setQuantity(rset.getInt(4));
		model.setUnitPrice(rset.getDouble(5));
		
		return model;
	}

}
