package com.chinesefoodonline.jdbc.services;

import java.util.List;

import com.chinesefoodonline.models.UserLoginModel;
import com.chinesefoodonline.models.UserModel;

public interface IUserManagerService {

	UserLoginModel checkUser(String email, String password);
	
	List<UserModel> getUsers();
	
	void addUser(String email, String password, int userType);
	
	void deleteUser(int userId);
	
}
