package com.chinesefoodonline.jdbc.implementation;

import java.sql.Types;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.InitializingBean;

import com.chinesefoodonline.jdbc.proc.ProcedureDefinition;
import com.chinesefoodonline.jdbc.rowmappers.CommentModelRowMapper;
import com.chinesefoodonline.jdbc.services.ICommentService;
import com.chinesefoodonline.models.CommentModel;

public class CommentService implements InitializingBean, ICommentService {

	private ProcedureDefinition procgetComments;
	private ProcedureDefinition procaddComment;
	private ProcedureDefinition procreplyComment;
	private DataSource dataSource;
	
	@Override
	public void afterPropertiesSet() throws Exception {
		procgetComments = new ProcedureDefinition(getDataSource(), "GET_COMMENTS", new CommentModelRowMapper(),Types.NUMERIC);
		procaddComment = new ProcedureDefinition(getDataSource(), "ADD_COMMENT", false, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR
			, Types.VARCHAR, Types.NUMERIC);
		procreplyComment = new ProcedureDefinition(getDataSource(), "REPLY_COMMENT", false, Types.NUMERIC, Types.VARCHAR);
	}

	@Override
	public List<CommentModel> getComments(int userId) {
		List<CommentModel> comments = (List<CommentModel>)procgetComments.executeProcedure(userId);
		return comments;
	}

	@Override
	public void addComment(String name, String surname, String subject, String message, int userId) {
		procaddComment.executeProcedureNoReturn(name, surname, subject, message, userId);
	}

	@Override
	public void replyComment(int commentId, String replyMessage) {
		procreplyComment.executeProcedureNoReturn(commentId, replyMessage);
	}
	
	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
}
