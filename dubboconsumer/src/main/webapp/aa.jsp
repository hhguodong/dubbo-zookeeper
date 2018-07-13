<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="form_add">
<div id="bidsDiv">

		<table align="center" id="areaForm">
				<tr>
					<td>名称</td>
					<td><input class="easyui-textbox" id="idsss" name="userlist[0].name" style="width:150px"></td>
					<td>年龄</td>
					<td><input class="easyui-textbox" id="idsss" name="userlist[0].sex" style="width:150px"></td>
					<td>别名</td>
					<td><input class="easyui-textbox" id="idsss" name="userlist[0].iname" style="width:150px"></td>
			    </tr>
					
				<button type="button" onclick="sss()" class="btn btn-success">▼</button>
				
		</table>
		</div>
</form>
<script type="text/javascript">
var i=0;
function sss(){
   i++;
   $("#bidsDiv").append('<table id="areaForm'+ i +'" align="center">'+
				'<tr>'+
				'<td>名称</td>'+
				'<td><input  class="easyui-textbox" name="userlist['+i+'].name" style="width:150px" ></td>'+
				'<td>年龄</td>'+
				'<td><input  class="easyui-textbox" name="userlist['+i+'].sex" style="width:150px" ></td>'+
				'<td>别名</td>'+
				'<td><input  class="easyui-textbox" name="userlist['+i+'].iname" style="width:150px" ></td>'+
				'</tr>'+
				
			'<tr>'+
			'<button type="button" onclick="aaa('+i+')" class="btn btn-success" id="re'+i+'">▲</button>'+
			'</tr>'+
		'</table><br>');
		
	}
			function aaa (id){
				var fid="#areaForm" +id;
				$(fid).remove();
				$("#re"+id).remove();
			}		
		

</script>
</body>
</html>