package com.chinesefoodonline.jdbc.services;

import java.util.List;

import com.chinesefoodonline.models.OrderMealModel;
import com.chinesefoodonline.models.OrderModel;

public interface IOrderService {
	
	List<OrderModel> getOrders(int userId, int status);
	
	List<OrderMealModel> getOrderMeals(int orderId);
	
	void setOrderStatus(int orderId, int status);
	
	void createOrder(String name, String surname, String address, String phone, int userId, double price, String meals);

}
