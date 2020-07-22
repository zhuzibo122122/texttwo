package com.zzb.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzb.Dao.UserMapper;
import com.zzb.pojo.Department;
import com.zzb.pojo.User;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper usermapper;
	
	@Override
	//查询所有信息
	public List<Department> getDepartmentList() {
		// TODO Auto-generated method stub
		return usermapper.getDepartmentList();
	}

	@Override
	//增加信息
	public int addUser(User user) {
		// TODO Auto-generated method stub
		return usermapper.addUser(user);
	}

	@Override
	public User echoUser(Integer user_id) {
		// TODO Auto-generated method stub
		return usermapper.echoUser(user_id);
	}

	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return usermapper.updateUser(user);
	}

	@Override
	public int deleteUser(Integer user_id) {
		// TODO Auto-generated method stub
		return usermapper.deleteUser(user_id);
	}

}
