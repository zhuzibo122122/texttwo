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
    <link href="static/css/bootstrap.min.css" rel="stylesheet" />
	<script src="static/js/jquery-1.8.2.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
	<script type="text/javascript" th:src="@{https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js}"></script>
	<link th:href="@{https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css}" rel="stylesheet" />
	<link th:href="@{/css/default.css}" rel="stylesheet" />
	<style type="text/css">
		
	</style>
</head>

<body>
	<div>
		<input type="button" value="新增" class="btn btn-success" style="margin-left:320px;" onclick="jump();"/>
	</div>
	<div id="parent" align="center" style="margin-top:100px;">
	<br/>
		<table class="table table-bordered" style="text-align: center;width: 50%;">
			<tr style="text-align: center;">
				<td style="width: 20px">姓名</td>
				<td style="width: 20px">部门</td>
				<td style="width: 20px">工资</td>
				<td style="width: 20px">地址</td>
			</tr>
			<tr>
				<td style="vertical-align: middle; width: 20px">${user.user_name }</td>
				<td style="vertical-align: middle; width: 20px">${user.department_name }</td>
				<td style="vertical-align: middle; width: 20px">${user.user_salary }</td>
				<td style="vertical-align: middle; width: 20px">${user.user_address }</td>
				</tr>
		</table>
	</div>
	<div style="text-align: center;">
		<input type="button" value="修改"  class="btn btn-success" onclick="jumpupdateUser(${user.user_id})">
		<input type="button" value="删除"  class="btn btn-success" onclick="dele(${user.user_id})">
		<input type="button" onclick="javascript:history.go(-1);" value="回退" class="btn btn-success" >
	</div>
	<script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript">
		function jump(){
			location.href="jumpaddUser";
		}
		
		
		function jumpupdateUser(user_id){
			location.href="jumpupdateUser?user_id=" + user_id;
		}
		
		function dele(user_id){
			var dele = confirm("确定删除所选用户?");
			if (dele == true) {
				$.ajax({
					url : "deleteUser",
					type : "post",
					data : {
						"user_id" : user_id
					},
					success : function callBack(data) {
						var json = eval('(' + data + ')');
						if (json.status == 1) {
							alert(json.message);
							location.href = "index";
						}
					},
					error : function(data) {
						alert("删除失败！");
						window.location.reload();
					}
				});
			}
		}
		
		
	</script>
</body>
</html>
