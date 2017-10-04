package com.chinesefoodonline.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.chinesefoodonline.jdbc.services.IUserManagerService;
import com.chinesefoodonline.models.UserLoginModel;

public class LoginController extends BaseController{
	
	private IUserManagerService userManagerService;

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView(getPageName());
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserLoginModel user = userManagerService.checkUser(email, password);
		if(user != null){
			request.getSession().setAttribute("LOGGEDIN_USER", user);
			mv.setViewName("/index");
		}
		
		return mv;
	}

	public IUserManagerService getUserManagerService() {
		return userManagerService;
	}

	public void setUserManagerService(IUserManagerService userManagerService) {
		this.userManagerService = userManagerService;
	}

}
