package com.chinesefoodonline.jdbc.rowmappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chinesefoodonline.models.CommentModel;

public class CommentModelRowMapper implements RowMapper<CommentModel> {

	@Override
	public CommentModel mapRow(ResultSet rset, int rowNo) throws SQLException {
		CommentModel model = new CommentModel();
		
		model.setCommentId(rset.getInt(1));
		model.setName(rset.getString(2));
		model.setSurname(rset.getString(3));
		model.setSubject(rset.getString(4));
		model.setMessage(rset.getString(5));
		model.setUserId(rset.getInt(6));
		model.setEmail(rset.getString(7));
		model.setCommentDate(rset.getTimestamp(8));
		model.setReplyMessage(rset.getString(9));
		model.setReplyDate(rset.getTimestamp(10));
		
		return model;
	}

}
