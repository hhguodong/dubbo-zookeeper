	/**页面加载时执行脚本*/
		$(function(){
			$.ajax({
				//url路径
				url:"/userList",
				//提交方式
				type:"post",
				//返回值类型
				dataType:"json",
				//意不提交是否开启
				async:false,//关闭异步请求
				//请求成功后的回调函数
				success:function (pager){
					tableHtml(pager);
				},
				//出现错误或者异常时的处理方法
				error:function (){
					alert("查询程序出错！！！");
				}
			});
			})
			
			$("#add").click(function(){
				var addUser = dialog({
					title:"新增用户",
					content:$("#addform"),
					ok:function(){
							$.ajax({
								url:"<%=request.getContextPath()%>/addUser",
								data:$("#addform").serialize(),
								type:"post",
								dataType:"text",
								success:function(result){
									alert(result);
									if(result=="success"){
										location.reload();
									}else{
											alert("新增失败!!");
										}
									},
									error:function(){
										alert("新增失败!!");
										}
							
								})
						
						},
					okValue:"新增"
					});
					addUser.show();
				})
			/**
				条件查询方法查询方法
			*/
			$("#checkButton").click(function(){
				$("[name='cpage']").val(1);
				$.ajax({
						url:"<%=request.getContextPath()%>/userList",
						type:"post",
						data:$("#tableform").serialize(),
						dataType:"text",
						async:false,
						success:function(pager){
							alert(pager);
							var data=eval("("+pager+")");
							tableHtml(data);
							},
						error:function(){
							alert("查询出错请联系管理员");
							}
					})
				})
				
				/**
				分页方法列表的拼装方法
				*/		
		function tableHtml(pager){
					var tr="";
					$.each(pager.list,function(){
						var sexname="女";
						if(this.sex==0){
							sexname="男";
							}
						tr +="<tr>"
								+"<td><input type='checkbox' name='checkMore' value='"+this.id+"'/></td>"
								+"<td>"+this.id+"</td>"
								+"<td>"+this.name+"</td>"
								+"<td>"+sexname+"</td>"
								+"<td>"+this.age+"</td>"
								+"<td>"+this.address+"</td>"
								+"<td>"+this.birthday+"</td>"
								+"<td>"+this.email+"</td>"
								+"<td>"+this.tel+"</td>"
								+"<td><input type='button' value='删除' onclick='shanchu("+this.id+")'/><input type='button' value='修改' onclick='xiugai("+this.id+")'/></td>"
							  +"</tr>"
						} )
					$("#userShow").html(tr);
					$("#cpage").html(pager.cpage);
					$("#totalPage").html(pager.totalPage);
					$("#totalCount").html(pager.totalCount);
			}
			
		function jump(flag){
			var cpage=$("#cpage").html();
			var totalPage=$("#totalPage").html();
			if(flag==1 ){ 
				if( cpage == 1){
				alert("已经是首页了。");
				return false;
				}
				else{
					$("[name='cpage']").val(1);
				}
			}
			if(flag==2){
				if( cpage==1 ){
						alert("没有上一页了");
						return false;
				}else{
					$("[name='cpage']").val(--cpage);
					}
				}
			if(flag==3){
				if( cpage == totalPage ){
					alert("没有下一页了。");
					return false;
				}else{
					$("[name='cpage']").val(++cpage);
					}
			}
			if(flag==4 ){
				if(cpage==totalPage){
					alert("已经是尾页了。");
					return false;
					}				
				else {
					$("[name='cpage']").val(totalPage);
				}
			}

			$.ajax({
				url:"<%=request.getContextPath()%>/userList",
				type:"post",
				data:$("#tableform").serialize(),
				dataType:"json",
				async:false,//关闭异步请求
				success:function (pager){
					tableHtml(pager);
				},
				error:function (){
					alert("查询程序出错！！！");
				}
				});
			}