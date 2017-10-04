package com.chinesefoodonline.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.chinesefoodonline.jdbc.services.ICommentService;
import com.chinesefoodonline.models.CommentModel;
import com.chinesefoodonline.models.UserLoginModel;

public class CommentController extends BaseController {
	
	private ICommentService commentService;
	
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView(getPageName());
		
		int userId = 0;
		UserLoginModel user = (UserLoginModel)request.getSession().getAttribute("LOGGEDIN_USER");
		if(user != null){
			userId = user.getUserId();
		}
		
		String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		
		if(name != null && surname != null && subject != null && message != null){
			commentService.addComment(name, surname, subject, message, userId);
		}
		
		if(userId != 0){
			List<CommentModel> comments = commentService.getComments(userId);
			mv.getModelMap().put("comments", comments);
		}
		
		return mv;
	}

	public ICommentService getCommentService() {
		return commentService;
	}

	public void setCommentService(ICommentService commentService) {
		this.commentService = commentService;
	}

}
