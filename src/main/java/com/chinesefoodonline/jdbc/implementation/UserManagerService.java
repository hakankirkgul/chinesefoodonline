package com.chinesefoodonline.jdbc.implementation;

import java.sql.Types;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.InitializingBean;

import com.chinesefoodonline.jdbc.proc.ProcedureDefinition;
import com.chinesefoodonline.jdbc.rowmappers.UserLoginModelRowMapper;
import com.chinesefoodonline.jdbc.rowmappers.UserModelRowMapper;
import com.chinesefoodonline.jdbc.services.IUserManagerService;
import com.chinesefoodonline.models.UserLoginModel;
import com.chinesefoodonline.models.UserModel;

public class UserManagerService implements InitializingBean, IUserManagerService {

	private ProcedureDefinition proccheckUser;
	private ProcedureDefinition procgetUsers;
	private ProcedureDefinition procaddUser;
	private ProcedureDefinition procdeleteUser;
	private DataSource dataSource;
	
	@Override
	public void afterPropertiesSet() throws Exception {
		proccheckUser = new ProcedureDefinition(getDataSource(), "CHECK_USER", new UserLoginModelRowMapper(),Types.VARCHAR,Types.VARCHAR);
		procgetUsers = new ProcedureDefinition(getDataSource(), "GET_USERS", new UserModelRowMapper());
		procaddUser = new ProcedureDefinition(getDataSource(), "ADD_USER", false, Types.VARCHAR, Types.VARCHAR, Types.NUMERIC);
		procdeleteUser = new ProcedureDefinition(getDataSource(), "DELETE_USER", false, Types.NUMERIC);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public UserLoginModel checkUser(String email, String password) {
		UserLoginModel user = (UserLoginModel)proccheckUser.executeProcedureSingle(email,password);
		return user;
	}

	@Override
	public List<UserModel> getUsers() {
		List<UserModel> users = (List<UserModel>)procgetUsers.executeProcedure();
		return users;
	}

	@Override
	public void addUser(String email, String password, int userType) {
		procaddUser.executeProcedureNoReturn(email,password,userType);
	}

	@Override
	public void deleteUser(int userId) {
		procdeleteUser.executeProcedureNoReturn(userId);
	}

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

}
