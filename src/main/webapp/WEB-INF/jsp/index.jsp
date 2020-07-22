<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>首頁展示</title> 
    <link rel="stylesheet" href="static/layui/css/layui.css" media="all">
    <link href="static/css/bootstrap.min.css" rel="stylesheet" />
	<script src="static/js/jquery-1.8.2.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
	<script type="text/javascript" th:src="@{https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js}"></script>
	<link th:href="@{https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css}" rel="stylesheet" />
	<link th:href="@{/css/default.css}" rel="stylesheet" />
	<style type="text/css">
		#user_name{
			position: relative;
  			left: -200px;
  			top: 19px;
		}
		
		#user_departement{
			position: relative;
  			top: -19px;
		}
	</style>
</head>

<body>
	<div>
		<input type="button" value="新增" class="btn btn-success" style="margin-left:320px;" onclick="jump();"/>
		<input type="button" value="首页" class="btn btn-success" style="margin-left:760px;" onclick="jumpindex();"/>
	</div>
	<div id="parent" align="center">
	<br/>
	<c:forEach var="department" items="${departmentlist }">
		<table class="table table-bordered" style="text-align: center;width: 50%;">
			<tr style="text-align: center;">
				<td style="width: 20px">部门名称</td>
				<td style="width: 20px">部门负责人</td>
				<td style="width: 20px">部门创建时间</td>
				<td style="width: 20px">员工</td>
			</tr>
			
				<tr>
					<td style="vertical-align: middle; width: 20px">${department.department_name }</td>
					<td style="vertical-align: middle; width: 20px">${department.department_user }</td>
					<td style="vertical-align: middle; width: 20px"><fmt:formatDate value="${department.department_time }" pattern="yyyy年MM月dd日"/></td>
					<td style="vertical-align: middle; width: 20px">
						<c:forEach var="user" items="${department.userList }">
								<p><a href="javascript:;" onclick="jumpechoUser(${user.user_id})">${user.user_name }</a></p>
						</c:forEach>
					</td>
				</tr>
		</table>
		</c:forEach>
	</div>
	<script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript">
		//跳转添加
		function jump(){
			location.href="jumpaddUser";
		}
		
		//跳转回显
		function jumpechoUser(user_id){
			location.href="jumpechoUser?user_id=" + user_id;
		}
		
		//跳转首页
		function jumpindex(){
			location.href="index";
		}
		
		//模糊查询
		function Fuzzyquery(){
			var user_name = $("#user_name").val();
			var user_departement = $("#user_departement").val();
			location.href="Fuzzyquery?user_name=" + user_name + "&user_departement=" + user_departement;
		}
	</script>
</body>
</html>
