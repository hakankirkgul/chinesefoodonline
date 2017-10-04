package com.chinesefoodonline.jdbc.proc;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.SqlReturnResultSet;
import org.springframework.jdbc.object.StoredProcedure;

public class ProcedureDefinition extends StoredProcedure {

	public ProcedureDefinition(DataSource dataSource, String name, int returnType, int ... inputTypes) {
		super(dataSource, name);
		setFunction(false);
		declareParameter(new SqlOutParameter("out", returnType));
		int index = 0;
		for (int paramType : inputTypes) {
			declareParameter(new SqlParameter("param"+index++,paramType));
		}
	}
	
	public ProcedureDefinition(DataSource dataSource, String name, boolean hasReturn, int ... inputTypes) {
		super(dataSource, name);
		setFunction(false);
		int index = 0;
		for (int paramType : inputTypes) {
			declareParameter(new SqlParameter("param"+index++,paramType));
		}
	}
	
	@SuppressWarnings("rawtypes")
	public ProcedureDefinition(DataSource dataSource, String name, RowMapper rowMapper, int ... inputTypes) {
		super(dataSource, name);
		setFunction(false);
		int index = 0;
		for (int paramType : inputTypes) {
			declareParameter(new SqlParameter("param"+index++,paramType));
		}
		declareParameter(new SqlReturnResultSet("out", rowMapper));
	}
	
	public ProcedureDefinition(DataSource dataSource, String name, int ... inputTypes) {
		super(dataSource, name);
		setFunction(false);
		int index = 0;
		for (int paramType : inputTypes) {
			declareParameter(new SqlParameter("param"+index++,paramType));
		}
	}
	
	public int executeProcedureInt(Object ... params){
		Object result = execute(params).get("out");
		if(result == null){
			return 0;
		} else {
			return (Integer)result;
		}
	}
	
	public double executeProcedureDouble(Object ... params){
		Object result = execute(params).get("out");
		if(result == null){
			return 0;
		} else {
			return (Double)result;
		}
	}
	
	public String executeProcedureString(Object ... params){
		return execute(params).get("out").toString();
	}
	
	public void executeProcedureNoReturn(Object ... params){
		execute(params);
	}
	
	@SuppressWarnings("rawtypes")
	public Object executeProcedureSingle(Object ... params){
		List result = (List)execute(params).get("out");
		if(result == null || result.size() == 0){
			return null;
		} else {
			return result.get(0);
		}
	}

	@SuppressWarnings("rawtypes")
	public List executeProcedure(Object ... params){
		List result = (List)execute(params).get("out");
		if(result == null || result.size() == 0){
			return null;
		} else {
			return result;
		}
	}
}
