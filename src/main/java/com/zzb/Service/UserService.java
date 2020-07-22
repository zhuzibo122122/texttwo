package com.zzb.Service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zzb.pojo.Department;
import com.zzb.pojo.User;

public interface UserService {
	List<Department> getDepartmentList();//查询全部信息
	
	int addUser(User user);//添加员工信息
	
	User echoUser(@Param("user_id")Integer user_id);
	
	int updateUser(User user);
	
	int deleteUser(@Param("user_id")Integer user_id);
}
