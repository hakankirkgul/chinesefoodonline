package com.chinesefoodonline.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public class LogoutController extends BaseController{

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView(getPageName());
		
		request.getSession().removeAttribute("LOGGEDIN_USER");
		
		return mv;
	}

}
