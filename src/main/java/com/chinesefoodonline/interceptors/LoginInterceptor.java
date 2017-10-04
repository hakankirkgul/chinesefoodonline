package com.chinesefoodonline.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.chinesefoodonline.models.UserLoginModel;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private String loginPage;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		String uri = request.getRequestURI();
		if(!uri.endsWith("login") && !uri.endsWith("logout")){
			UserLoginModel user = (UserLoginModel)request.getSession().getAttribute("LOGGEDIN_USER");
			if(user == null){
				response.sendRedirect(loginPage);
			    return false;
			}
		}
		
		return true;
				
	}

	public String getLoginPage() {
		return loginPage;
	}

	public void setLoginPage(String loginPage) {
		this.loginPage = loginPage;
	}

}
