package com.chinesefoodonline.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.chinesefoodonline.jdbc.services.IReservationService;
import com.chinesefoodonline.models.ReservationModel;
import com.chinesefoodonline.models.UserLoginModel;

public class ReservationsController extends BaseController{
	
	private IReservationService reservationService;

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView(getPageName());
		
		String reservationIdTxt = request.getParameter("reservationId");
		int reservationId = reservationIdTxt == null || reservationIdTxt.isEmpty() ? 0 : Integer.parseInt(reservationIdTxt);
		if(reservationId != 0){
			String statusTxt = request.getParameter("status");
			int status = statusTxt == null || statusTxt.isEmpty() ? 0 : Integer.parseInt(statusTxt);
			String tableName = request.getParameter("tableName"+reservationId);
			if(status > 0){
				reservationService.setReservationStatus(reservationId, status, tableName);
			}
		}
		
		UserLoginModel user = (UserLoginModel)request.getSession().getAttribute("LOGGEDIN_USER");
		if(user != null){
			List<ReservationModel> reservations = null;
			if(user.getUserType() == 1){
				reservations = reservationService.getReservations(user.getUserId());
			} else if (user.getUserType() == 4){
				reservations = reservationService.getReservations(0);
			}
			mv.getModelMap().put("reservations", reservations);
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
