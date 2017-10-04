package com.chinesefoodonline.jdbc.rowmappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chinesefoodonline.models.OrderModel;

public class OrderModelRowMapper implements RowMapper<OrderModel> {

	@Override
	public OrderModel mapRow(ResultSet rset, int rowNo) throws SQLException {
		OrderModel model = new OrderModel();
		
		model.setOrderId(rset.getInt(1));
		model.setUserId(rset.getInt(2));
		model.setEmail(rset.getString(3));
		model.setName(rset.getString(4));
		model.setSurname(rset.getString(5));
		model.setAddress(rset.getString(6));
		model.setPhone(rset.getString(7));
		model.setStatus(rset.getInt(8));
		model.setPrice(rset.getDouble(9));
		model.setCreationDate(rset.getTimestamp(10));
		
		return model;
	}

}
