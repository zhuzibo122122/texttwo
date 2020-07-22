package com.zzb.pojo;

public class User {
	private int user_id;
	private String user_name;
	private int user_departement;
	private int user_salary;
	private String user_address;
	
	private String department_name;
	
	private Department department;
	
	
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getUser_departement() {
		return user_departement;
	}
	public void setUser_departement(int user_departement) {
		this.user_departement = user_departement;
	}
	public int getUser_salary() {
		return user_salary;
	}
	public void setUser_salary(int user_salary) {
		this.user_salary = user_salary;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	
}
