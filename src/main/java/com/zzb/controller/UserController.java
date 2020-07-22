package com.zzb.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.zzb.Service.UserService;
import com.zzb.pojo.Department;
import com.zzb.pojo.User;
import com.zzb.utils.ReturnResult;


@Controller
public class UserController {
	
	@Autowired
	private UserService userservice;
	
	@RequestMapping("/index")//显示主页面
	public String index(Model model) {
		List<Department> departmentlist=userservice.getDepartmentList();
		model.addAttribute("departmentlist",departmentlist);
		return "index";
	}
	
	/**
	 * 跳转到增加员工信息页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/jumpaddUser")
	public String JumpUser(Model model) {
		List<Department> departmentlist = userservice.getDepartmentList();
		model.addAttribute("departmentlist", departmentlist);
		return "addUser";
	}
	
	@RequestMapping("/addUser")
	public void addUser(HttpServletResponse response,User user) {
		ReturnResult result = new ReturnResult();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int row = userservice.addUser(user);
		String json = null;
		if(row >0) {
			json = JSONObject.toJSONString(result.getSuccess("添加成功!"));
		}else {
			json = JSONObject.toJSONString(result.getFail("添加失败!"));
		}
		out.print(json);
		out.flush();
		out.close();
	}
	
	/**
	 * 	信息回显
	 *	@param model
	 * 	@param user_id
	 * 	@return
	 */
	@RequestMapping("/jumpechoUser")
	public String echoUser(Model model,Integer user_id) {
		User user = userservice.echoUser(user_id);
		model.addAttribute("user", user);
		return "echo";
	}
	
	/**
	 *   跳转到修改员工信息页面
	 * @param model
	 * @param user_id
	 * @return
	 */
	@RequestMapping("/jumpupdateUser")
	public String JumpUser2(Model model,Integer user_id) {
		User user = userservice.echoUser(user_id);
		model.addAttribute("user", user);
		List<Department> departmentlist = userservice.getDepartmentList();
		model.addAttribute("departmentlist", departmentlist);
		return "updateUser";
	}
	
	/**
	 * 修改员工信息
	 * @param user
	 * @param response
	 */
	@RequestMapping("/updateUser")
	public void updateUser(User user,HttpServletResponse response) {
		ReturnResult result = new ReturnResult();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int row = userservice.updateUser(user);
		String json = null;
		if(row >0) {
			json = JSONObject.toJSONString(result.getSuccess("修改成功!"));
		}else {
			json = JSONObject.toJSONString(result.getFail("修改失败!"));
		}
		out.print(json);
		out.flush();
		out.close();
	}
	
	/**
	 * 删除员工信息
	 * @param user_id
	 * @param response
	 */
	@RequestMapping("/deleteUser")
	public void deleteUser(Integer user_id,HttpServletResponse response) {
		ReturnResult result = new ReturnResult();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int row = userservice.deleteUser(user_id);
		String json = null;
		if(row >0) {
			json = JSONObject.toJSONString(result.getSuccess("删除成功!"));
		}else {
			json = JSONObject.toJSONString(result.getFail("删除失败!"));
		}
		out.print(json);
		out.flush();
		out.close();
	}
}
