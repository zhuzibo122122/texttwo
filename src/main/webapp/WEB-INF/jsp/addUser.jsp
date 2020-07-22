<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!--截取项目的名称  -->
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>增加</title>
	<link rel="stylesheet" type="text/css" href="static/layui/css/layui.css">
	<link href="static/css/bootstrap.min.css" rel="stylesheet" />
	<script src="static/js/jquery-1.8.2.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
	<script type="text/javascript" th:src="@{https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js}"></script>
	<link th:href="@{https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css}" rel="stylesheet" />
	<link th:href="@{/css/default.css}" rel="stylesheet" />
	<style type="text/css">
		.layui-form{
			width: 50%;
			margin-left: 10%;
			margin-top: 5%;
		}
		.layui-input-block{
			margin-top: 50px;
		}
		.blank{
			margin-left: 50%;
		}
	</style>
</head>
<body>
	<div align="center">
		<form class="layui-form">
	  <div class="layui-form-item">
			<label class="layui-form-label">姓名</label>
			<div class="layui-input-block">
				 <input type="text" id="user_name" name="user_name" required  lay-verify="required" value="" placeholder="请输入员工姓名" autocomplete="off" class="layui-input">
			</div>
		</div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">部门</label>
			<div class="layui-input-block">
				<select id="user_departement" name="user_departement">
					<option value="0">--请选择部门--</option>
					<c:forEach var="department" items="${departmentlist }">
						<option value="${department.department_id }">${department.department_name }</option>
					</c:forEach>
				</select>
			</div>
		</div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">工资</label>
	    <div class="layui-input-block">
	      <input type="text" id="user_salary" name="user_salary" required  lay-verify="required" value="" placeholder="请输入员工工资" autocomplete="off" class="layui-input">
	    </div>
	  </div>
		<div class="layui-form-item">
			<label class="layui-form-label">地址</label>
			<div class="layui-input-block">
				<input type="text" id="user_address" name="user_address" required  lay-verify="required" value="" placeholder="请输入员工地址" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div style="text-align: center;  font-size: 16px;" ><span id="spanId"></span></div>
		<div class="layui-form-item">
	    <div class="layui-input-block">
	      <input type="button" class="btn btn-success" lay-submit lay-filter="formDemo"  value="立即提交" onclick="check();">
	      <input type="button" class="btn btn-success" lay-submit lay-filter="formDemo" value="回退" onclick="javascript:history.go(-1);">
	      <input type="reset" class="btn btn-success" lay-submit lay-filter="formDemo" onclick="" value="重置">
	    </div>
	  </div>
	</form>
	</div>
<script type="text/javascript" src="static/layui/layui.js"></script>
<script>
//Demo
layui.use('form', function(){
  var form = layui.form;
});
</script>
<script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">	
	function check(){
		var user_name = $("#user_name").val();
		var user_departement = $("#user_departement").val();
		var user_salary = $("#user_salary").val();
		var user_address = $("#user_address").val();
		//ajax验证
			$.ajax({
				url : "addUser",
				type : "post",
				data : {
					"user_name" : user_name,
					"user_departement" : user_departement,
					"user_salary" : user_salary,
					"user_address" : user_address
				},
				success : function callBack(data) {
					var json = eval('(' + data + ')');
					if (json.status == 1) {
						alert(json.message);
						location.href = "index";
					}
				},
				error : function() {
					alert("添加出现异常!");
				}
			});
	}
</script>
</body>