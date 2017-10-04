package com.chinesefoodonline.jdbc.services;

import java.util.List;

import com.chinesefoodonline.models.CommentModel;

public interface ICommentService {

	List<CommentModel> getComments(int userId);
	
	void addComment(String name, String surname, String subject, String message, int userId);
	
	void replyComment(int commentId, String replyMessage);
	
}
