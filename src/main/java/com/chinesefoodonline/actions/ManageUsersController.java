package com.chinesefoodonline.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.chinesefoodonline.jdbc.services.IUserManagerService;
import com.chinesefoodonline.models.UserModel;

public class ManageUsersController extends BaseController {

	private IUserManagerService userManagerService;
	
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView(getPageName());
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String userTypeTxt = request.getParameter("userType");
		int userType = userTypeTxt == null || userTypeTxt.isEmpty() ? 0 : Integer.parseInt(userTypeTxt);
		
		if(email != null && !email.isEmpty() && password != null && !password.isEmpty() && userType != 0){
			userManagerService.addUser(email, password, userType);
		}
		
		String userIdTxt = request.getParameter("deleteUserId");
		int userId = userIdTxt == null || userIdTxt.isEmpty() ? 0 : Integer.parseInt(userIdTxt);
		
		if(userId != 0){
			userManagerService.deleteUser(userId);
		}
		
		List<UserModel> users = userManagerService.getUsers();
		mv.getModelMap().put("users", users);
		
		return mv;
	}

	public IUserManagerService getUserManagerService() {
		return userManagerService;
	}

	public void setUserManagerService(IUserManagerService userManagerService) {
		this.userManagerService = userManagerService;
	}

}
