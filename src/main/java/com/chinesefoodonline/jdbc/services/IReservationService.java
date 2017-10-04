package com.chinesefoodonline.jdbc.services;

import java.util.Date;
import java.util.List;

import com.chinesefoodonline.models.ReservationModel;

public interface IReservationService {
	
	List<ReservationModel> getReservations(int userId);
	
	void setReservationStatus(int reservationId, int status, String tableName);
	
	void createReservation(int userId, String name, String phone, String notes, Date date, int peopleCount);

}
