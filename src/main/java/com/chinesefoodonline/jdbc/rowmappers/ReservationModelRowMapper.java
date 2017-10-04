package com.chinesefoodonline.jdbc.rowmappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chinesefoodonline.models.ReservationModel;

public class ReservationModelRowMapper implements RowMapper<ReservationModel> {

	@Override
	public ReservationModel mapRow(ResultSet rset, int rowNo) throws SQLException {
		ReservationModel model = new ReservationModel();
		
		model.setReservationId(rset.getInt(1));
		model.setName(rset.getString(2));
		model.setEmail(rset.getString(3));
		model.setPhone(rset.getString(4));
		model.setStatus(rset.getInt(5));
		model.setPeopleCount(rset.getInt(6));
		model.setDate(rset.getTimestamp(7));
		model.setNotes(rset.getString(8));
		model.setTableName(rset.getString(9));
		
		return model;
	}

}
