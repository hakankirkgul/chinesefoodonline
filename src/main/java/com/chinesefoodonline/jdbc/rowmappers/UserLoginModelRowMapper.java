package com.chinesefoodonline.jdbc.rowmappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chinesefoodonline.models.UserLoginModel;

public class UserLoginModelRowMapper implements RowMapper<UserLoginModel> {

	@Override
	public UserLoginModel mapRow(ResultSet rset, int rowNo) throws SQLException {
		UserLoginModel model = new UserLoginModel();
		
		model.setUserId(rset.getInt(1));
		model.setEmail(rset.getString(2));
		model.setUserType(rset.getInt(3));
		
		return model;
	}

}
