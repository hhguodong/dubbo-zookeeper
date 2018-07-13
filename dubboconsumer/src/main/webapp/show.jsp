<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-easyui/jquery.easyui.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/js/jquery-easyui/themes/default/easyui.css"/>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/js/jquery-easyui/themes/icon.css"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/uploadify/jquery.uploadify.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/uploadify/uploadify.css"/>
</head>
<body>
    <div id="cc" class="easyui-layout" style="width:1400px;height:400px;">   
     <div data-options="region:'north',title:'North Title',split:true" style="width:1400px;height:100px;">
     
                 <center><font size="6">终于TMD查出来了1</font></center>
                 	名字：<input name="name" class="easyui-textbox" style="width:300px">
	    <a id="btn" href="javascript:search()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
     </div>   
    
    <div data-options="region:'center',title:'center title'" style="padding:5px;background:#eee;">
         <input type="button" value="新增" onclick="aa()"/>
         <table id="dg"></table>
         <div id="dd"></div>
         
    
    </div>   
</div>
<script type="text/javascript">

		$(function(){ 
			$('#dg').datagrid({    
			    url:'<%=request.getContextPath() %>/user/queryUser.do',
			    queryParams: {"name":$("[name='name']").val()},
			    columns:[[    
			        {field:'id',title:'编号',width:300},    
			        {field:'name',title:'姓名',width:300},    
			        {field:'sex',title:'年龄',width:300},
			        {field:'iname',title:'别名',width:300},
			        {field:'aa',title:'操作',width:300,formatter:function(value,row,index){
			        	return   "<input type='button' class='btn btn-info' value='删除' onclick='deletes("+row.id+")'/><input type='button' class='btn btn-info' value='修改' onclick='updateUser("+row.id+")'/>";
			        }}   
			    ]]    
			});  

		});
		
		function search(){
			$('#dg').datagrid({    
			    url:'<%=request.getContextPath() %>/user/queryUser.do', 
			    queryParams: {"name":$("[name='name']").val()},
			    columns:[[    
			        {field:'id',title:'编号',width:300},    
			        {field:'name',title:'姓名',width:300},    
			        {field:'sex',title:'年龄',width:300},
			        {field:'iname',title:'别名',width:300},
			        {field:'aa',title:'操作',width:300,formatter:function(value,row,index){
			        	return   "<input type='button' class='btn btn-info' value='删除' onclick='deletes("+row.id+")'/><input type='button' class='btn btn-info' value='修改' onclick='updateUser("+row.id+")'/>";
			        }} 
			    ]]    
			});  
		}
		
		function aa(){
			
			$('#dd').dialog({    
			    title: 'My Dialog',    
			    width: 800,    
			    height: 500,    
			    closed: false,    
			    cache: false,    
			    href: '<%=request.getContextPath() %>/aa.jsp',    
			    modal: true,
			    buttons:[{
					text:'保存',
					handler:function(){
						$.ajax({
							url:"<%=request.getContextPath()%>/user/addDobbo.do",
							type:"post",
							data:$("#form_add").serialize(),
							dataType:"text",
							success:function (addFlag){
								
									$('#dd').dialog('close');
									$('#dg').datagrid('reload');
								
							},
							error:function (){
								alert("新增出错");
							}
							
						})					
					}
				}]
			});    
			$('#dd').dialog('refresh', 'new_content.php');  
			
		}
		
		 function deletes(id){
		    	$.ajax({  
			           type : 'post',  
			           url : "<%=request.getContextPath()%>/user/deleteUser.do?id="+id,  
			           dataType : 'text',  
			           async:false,
			           success : function(data) {
			        	   if(data=='aaa'){
			        		   
			        		   $('#dg').datagrid('reload');
			        	   }
			        	  

			           }  
			       })
		    	
		    }
		 
		 function updateUser(id){
				
				$('#dd').dialog({    
				    title: 'My Dialog',    
				    width: 800,    
				    height: 500,    
				    closed: false,    
				    cache: false,    
				    href: '<%=request.getContextPath() %>/user/queryUserbyid.do?id='+id,    
				    modal: true,
				    buttons:[{
						text:'保存',
						handler:function(){
							$.ajax({
								url:"<%=request.getContextPath()%>/user/updateDobbo.do",
								type:"post",
								data:$("#formid").serialize(),
								dataType:"text",
								success:function (addFlag){
									
										$('#dd').dialog('close');
										$('#dg').datagrid('reload');
									
								},
								error:function (){
									alert("修改出错");
								}
								
							})					
						}
					}]
				});    
				$('#dd').dialog('refresh', 'new_content.php');  
				
			}
		
		


</script>
</body>
</html>