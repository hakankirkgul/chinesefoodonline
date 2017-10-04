package com.chinesefoodonline.jdbc.implementation;

import java.sql.Types;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.InitializingBean;

import com.chinesefoodonline.jdbc.proc.ProcedureDefinition;
import com.chinesefoodonline.jdbc.rowmappers.ReservationModelRowMapper;
import com.chinesefoodonline.jdbc.services.IReservationService;
import com.chinesefoodonline.models.ReservationModel;

public class ReservationService implements InitializingBean, IReservationService {

	private ProcedureDefinition procgetReservations;
	private ProcedureDefinition procsetReservationStatus;
	private ProcedureDefinition proccreateReservation;
	private DataSource dataSource;
	
	@Override
	public void afterPropertiesSet() throws Exception {
		procgetReservations = new ProcedureDefinition(getDataSource(), "GET_RESERVATIONS", new ReservationModelRowMapper(),Types.NUMERIC);
		procsetReservationStatus = new ProcedureDefinition(getDataSource(), "SET_RESERVATION_STATUS", false, Types.NUMERIC, Types.NUMERIC, Types.VARCHAR);
		proccreateReservation = new ProcedureDefinition(getDataSource(), "CREATE_RESERVATION", false, Types.NUMERIC, Types.VARCHAR, Types.VARCHAR, 
			Types.VARCHAR, Types.TIMESTAMP, Types.NUMERIC);
	}

	@Override
	public List<ReservationModel> getReservations(int userId) {
		List<ReservationModel> reservations = (List<ReservationModel>)procgetReservations.executeProcedure(userId);
		return reservations;
	}

	@Override
	public void setReservationStatus(int reservationId, int status, String tableName) {
		procsetReservationStatus.executeProcedureNoReturn(reservationId, status, tableName);
	}

	@Override
	public void createReservation(int userId, String name, String phone, String notes, Date date, int peopleCount) {
		proccreateReservation.executeProcedureNoReturn(userId,name,phone,notes,date,peopleCount);
	}
	
	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
}
