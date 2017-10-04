package com.chinesefoodonline.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.chinesefoodonline.jdbc.services.ICommentService;
import com.chinesefoodonline.models.CommentModel;

public class ManageCommentsController extends BaseController {
	
	private ICommentService commentService;
	
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView(getPageName());
		
		String commentIdTxt = request.getParameter("commentId");
		int commentId = commentIdTxt == null ? 0 : Integer.parseInt(commentIdTxt);
		String message = request.getParameter("message");
		
		if(commentId != 0 && message != null){
			commentService.replyComment(commentId, message);
		}
		
		List<CommentModel> comments = commentService.getComments(0);
		mv.getModelMap().put("comments", comments);
		
		return mv;
	}

	public ICommentService getCommentService() {
		return commentService;
	}

	public void setCommentService(ICommentService commentService) {
		this.commentService = commentService;
	}

}
