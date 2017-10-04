package com.chinesefoodonline.jdbc.rowmappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chinesefoodonline.models.UserModel;

public class UserModelRowMapper implements RowMapper<UserModel> {

	@Override
	public UserModel mapRow(ResultSet rset, int rowNo) throws SQLException {
		UserModel model = new UserModel();
		
		model.setUserId(rset.getInt(1));
		model.setEmail(rset.getString(2));
		model.setPassword(rset.getString(3));
		model.setUserType(rset.getInt(4));
		model.setCreationDate(rset.getTimestamp(5));
		
		return model;
	}

}
