<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="formid">
<div id="bidsDiv">
<input type="hidden" name="id" value="${user.id }"/>
		<table align="center" id="areaForm">
				<tr>
					<td>名称</td>
					<td><input class="easyui-textbox" id="idsss" name="name" style="width:150px" value="${user.name }"></td>
					<td>年龄</td>
					<td><input class="easyui-textbox" id="idsss" name="sex" style="width:150px" value="${user.sex }"></td>
					<td>别名</td>
					<td><input class="easyui-textbox" id="idsss" name="iname" style="width:150px" value="${user.iname }"></td>
			    </tr>
					
				
				
		</table>
		</div>
</form>

</body>
</html>