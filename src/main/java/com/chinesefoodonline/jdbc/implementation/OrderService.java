package com.chinesefoodonline.jdbc.implementation;

import java.sql.Types;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.InitializingBean;

import com.chinesefoodonline.jdbc.proc.ProcedureDefinition;
import com.chinesefoodonline.jdbc.rowmappers.OrderMealModelRowMapper;
import com.chinesefoodonline.jdbc.rowmappers.OrderModelRowMapper;
import com.chinesefoodonline.jdbc.services.IOrderService;
import com.chinesefoodonline.models.OrderMealModel;
import com.chinesefoodonline.models.OrderModel;

public class OrderService implements InitializingBean, IOrderService {

	private ProcedureDefinition procgetOrders;
	private ProcedureDefinition procgetOrderMeals;
	private ProcedureDefinition procsetOrderStatus;
	private ProcedureDefinition proccreateOrder;
	private DataSource dataSource;
	
	@Override
	public void afterPropertiesSet() throws Exception {
		procgetOrders = new ProcedureDefinition(getDataSource(), "GET_ORDERS", new OrderModelRowMapper(),Types.NUMERIC, Types.NUMERIC);
		procgetOrderMeals = new ProcedureDefinition(getDataSource(), "GET_ORDER_MEALS", new OrderMealModelRowMapper(), Types.NUMERIC);
		procsetOrderStatus = new ProcedureDefinition(getDataSource(), "SET_ORDER_STATUS", false, Types.NUMERIC, Types.NUMERIC);
		proccreateOrder = new ProcedureDefinition(getDataSource(), "CREATE_ORDER", false, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, 
			Types.VARCHAR, Types.NUMERIC, Types.NUMERIC, Types.VARCHAR);
	}

	@Override
	public List<OrderModel> getOrders(int userId, int status) {
		List<OrderModel> orders = (List<OrderModel>)procgetOrders.executeProcedure(userId, status);
		return orders;
	}

	@Override
	public List<OrderMealModel> getOrderMeals(int orderId) {
		List<OrderMealModel> meals = (List<OrderMealModel>)procgetOrderMeals.executeProcedure(orderId);
		return meals;
	}

	@Override
	public void setOrderStatus(int orderId, int status) {
		procsetOrderStatus.executeProcedureNoReturn(orderId, status);
	}

	@Override
	public void createOrder(String name, String surname, String address, String phone, int userId, 
		double price, String meals) {
		proccreateOrder.executeProcedureNoReturn(name,surname,address,phone,userId,price,meals);
	}
	
	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
}
