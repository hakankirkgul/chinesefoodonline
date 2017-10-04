package com.chinesefoodonline.actions;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.chinesefoodonline.jdbc.services.IReservationService;
import com.chinesefoodonline.models.UserLoginModel;

public class CreateReservationController extends BaseController{
	
	private IReservationService reservationService;

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView(getPageName());
		
		int userId = 0;
		UserLoginModel user = (UserLoginModel)request.getSession().getAttribute("LOGGEDIN_USER");
		if(user != null){
			userId = user.getUserId();
		}
		
		String notes = request.getParameter("notes");
		String phone = request.getParameter("phone");
		String name = request.getParameter("name");
		String peopleCountTxt = request.getParameter("peopleCount");
		int peopleCount = peopleCountTxt == null || peopleCountTxt.isEmpty() ? 0 : Integer.parseInt(peopleCountTxt);
		String dateTxt = request.getParameter("date");
		Date date = dateTxt == null || dateTxt.isEmpty() ? null : new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").parse(dateTxt) ;
		
		if(name != null && !name.isEmpty() && phone != null && !phone.isEmpty() && userId > 0 && peopleCount > 0 && date != null){
			reservationService.createReservation(userId,name,phone,notes,date,peopleCount);
			mv.getModel().put("success", true);
		}
		
		return mv;
	}

	public IReservationService getReservationService() {
		return reservationService;
	}

	public void setReservationService(IReservationService reservationService) {
		this.reservationService = reservationService;
	}

}
