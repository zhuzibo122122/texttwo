package com.zzb.pojo;

import java.util.Date;
import java.util.List;

public class Department {
	private int department_id;
	private String department_name;
	private String department_user;
	private Date department_time;
	
	private List<User> UserList;
	
	
	public List<User> getUserList() {
		return UserList;
	}
	public void setUserList(List<User> userList) {
		UserList = userList;
	}
	public int getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public String getDepartment_user() {
		return department_user;
	}
	public void setDepartment_user(String department_user) {
		this.department_user = department_user;
	}
	public Date getDepartment_time() {
		return department_time;
	}
	public void setDepartment_time(Date department_time) {
		this.department_time = department_time;
	}
	
	
}
