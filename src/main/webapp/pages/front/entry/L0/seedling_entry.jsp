<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>苗木信息录入</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/audit-asset/css/seedling_entry.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/audit-asset/css/iconfont/iconfont.css">
<link href="<%=request.getContextPath()%>/sweetAlert/css/sweet-swal.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/sweetAlert/js/sweet-swal.js"></script>
<style>
li {
	list-style: none;
}

#table td li {
	width: 50%;
	float: left;
}

/*搜索框文字效果*/
input::-webkit-input-placeholder {
	color: #C5C5C5;
	font-size: 14px;
}

/*修改浮层框*/
.modify_frame {
	display: none;
	position: absolute;
	top: 25px;
	right: 0;
	width: 304px;
	height: 140px;
	background: #FFF;
	border: 1px solid #D8D8D8;
	border-radius: 4px;
	z-index: 100;
}

.modify_frame form {
	width: 265px;
	margin: 0 auto;
}

.modify_frame p {
	position: relative;
	width: 100%;
}

.modify_frame p label {
	position: absolute;
	top: 6px;
	left: 165px;
	font-size: 14px;
	color: #222222;
}

.modify_frame p:nth-child(1) {
	width: 100%;
	height: 20px;
	margin: 12px 0;
	font-family: MicrosoftYaHei;
	font-size: 14px;
	color: #222222;
	letter-spacing: 1px;
	text-align: left;
}

.modify_frame p:nth-child(2) {
	width: 100%;
	height: 30px;
	font-family: MicrosoftYaHei;
	font-size: 14px;
	color: #222222;
	letter-spacing: 1px;
}

.modify_frame p:nth-child(2) select {
	height: 30px;
	background: #FFFFFF;
	border: 1px solid #D8D8D8;
	border-radius: 2px;
}

.modify_frame p:nth-child(2) select:nth-child(1) {
	width: 90px;
	margin-right: 5px
}

.modify_frame p:nth-child(2) select#unit_valuation {
	width: 64px;
	margin-left: 5px;
}

.modify_frame p:nth-child(2) input {
	position: relative;
	top: -1px;
	height: 28px;
	width: 88px;
	background: #FFFFFF;
	border: 1px solid #D8D8D8;
	border-radius: 2px;
}

.modify_frame p:nth-child(3) {
	width: 100%;
	height: 30px;
	margin-top: 15px;
	font-family: MicrosoftYaHei;
	font-size: 14px;
	color: #222222;
	letter-spacing: 1px;
	text-align: left;
}

.modify_frame p:nth-child(3) span {
	display: inline-block;
	width: 64px;
	height: 30px;
	margin-left: 10px;
	line-height: 30px;
	text-align: center;
	background: #0BBA6B;
	border-radius: 2px;
}

.modify_frame p:nth-child(3) span:nth-child(2) {
	color: #FFF;
	border: 1px solid #0BBA6B;
}

.modify_frame p:nth-child(3) span:nth-child(1) {
	color: #555;
	background: #fff;
	border: 1px solid #D8D8D8;
}

.modify_frame .triangle_1 {
	position: absolute;
	top: -14px;
	right: 16px;
	width: 14px;
}

.modify_frame .triangle_1 img {
	width: 14px;
}
</style>
</head>
<body>
	<!--nav start-->
	<div id="nav">
		<!--nav start-->
		<div class="wrap">
			<!--header start-->
			<div id="header" class="clear">
				<!-- <img src="<%=request.getContextPath()%>/audit-asset/img/list.png" class="fl"/> -->
				<p class="fl">苗木录入列表</p>
			</div>
			<!--header end-->

			<!--content start-->
			<div id="content">
				<!--新增审计和搜索框-->

				<div id="add_search" class="clear">
					<!--新增审计-->
					<a href="<%=request.getContextPath()%>/plant/add">
						<div class="add_audit fl">
							<span class="iconfont icon-xinzeng" style="font-size: 10px;"></span>
							<span>新增价格</span>
						</div>
					</a> <a href="<%=request.getContextPath()%>/plant/toBatchAdd">
						<div class="add_audit fl" style="margin-left: 10px;">
							<span class="iconfont icon-piliangdaoru"
								style="font-size: 8.4px;"></span> <span>批量导入</span>
						</div>
					</a>
					<!--搜索框-->
					<div class="search fr" style="position: relative;">
						<input type="text" name="search" id="search" value="${condition }" placeholder="请输入关键词" /> <span
							class="iconfont icon-sousuo"
							style="color: #d8d8d8; position: absolute; right: 5px; top: 9px;"></span>
					</div>
				</div>
				<!--表格-->
				<div id="table">
					<table border="" cellspacing="0" cellpadding="0">
						<tr>
							<th>苗木名称</th>
							<th>产地</th>
							<th>规格</th>
							<th>报价日期</th>
							<th style="position: relative;">价格<i id="exclamatory">i<i></th>
							<th>单位</th>
							<th>价格来源</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${page.rows}" var="priceSeedFormatPlantModel">
							<tr>
								<td>${priceSeedFormatPlantModel.plant_name}</td>
								<td>${priceSeedFormatPlantModel.area}</td>
								<td>${priceSeedFormatPlantModel.specTypeString}：${priceSeedFormatPlantModel.spec}</td>
								<td>${priceSeedFormatPlantModel.price_ctime}</td>
								<td>${priceSeedFormatPlantModel.price}</td>
								<td>${priceSeedFormatPlantModel.unitTypeString}</td>
								<td>${priceSeedFormatPlantModel.data_source}</td>
								<td>
									<!-- <a href="<%=request.getContextPath()%>/plant/toUpdate?plantId=${plant.plantId}&id=${plant.id}" style="color:#555;"><li><span title="修改" class="iconfont icon-xiugai" style="color:#BBC5D5;"></span></li></a> -->
									<%-- <a href="<%=request.getContextPath() %>/plant/edit?id=${plant.id }"><li><span class="iconfont icon-shanchu"></span></li></a> --%>
									<li style="position: relative;"><span
										onclick="showModify('${priceSeedFormatPlantModel.id}')"
										title="修改" class="iconfont icon-xiugai"
										style="cursor: pointer; color: #BBC5D5;"></span>
										<div id="modify${priceSeedFormatPlantModel.id}"
											class="modify_frame">
											<form id="update_formID${priceSeedFormatPlantModel.id}">
													
												<p>修改价格</p>
												<p>
													<select name="pricetype">
														<option value="上车价">上车价</option>
														<option value="到场价">到场价</option>
													</select> <input type="text" name="price" id="yuan"
														value="${priceSeedFormatPlantModel.price}" /><input type="hidden" name="id" value="${priceSeedFormatPlantModel.id}"/> <select
														name="unit_valuation" id="unitTypeString">
														<option value="">株</option>
														<option value="">颗</option>
													</select> <label for="yuan">元</label>
												</p>
												<p>
													<span class="fr"
														onclick="showModify('${priceSeedFormatPlantModel.id}')">取消</span><span
														class="fr"
														onclick="submit_update('${priceSeedFormatPlantModel.id}')">确认</span>
												</p>

												<p class="triangle_1">
													<img
														src="${pageContext.request.contextPath }/audit-asset/img/tooltip_arrow.png" />
												</p>
											</form>
										</div></li> <span title="删除" class="iconfont icon-shanchu"
									style="cursor: pointer; color: #BBC5D5;" id="del"
									onclick="del(${plant.id})"; ></span>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>

			</div>



			<script type="text/javascript">
			function submit_update(id){
				/* debugger; */
				showModify(id);
				var com=$("#update_formID"+id);
				
				
					var param = com.serialize();
					$.ajax({
						url:"${pageContext.request.contextPath}/plant/edit_priceInfo",
						data:param,
						dataType:"json",
						type:"post",
						success:function(data){
							if(data.status == "success"){
								swal("", "已成功修改数据！", "success"); 
								/* window.setTimeout("window.location.href='${pageContext.request.contextPath}/plant/list2'",1000);  */
								document.location.reload();
							}else{
								swal("", "错误", "error");
							}
						},
						error:function(){
							swal("", "错误", "error");
						}
					});
			
			}
			
				
			
			
			
			</script>
			<!--content end-->

			<%-- <!--paging start-->
			<div id="pages" class="clear">
				<div class="pages_total fl">总计：<span class="span_1">${pageBean.records}</span>条 / <span class="span_2">${pageBean.total}</span>页</div>
				<div class="paging fl">
					
					<!--翻页分页按钮-->
					<c:if test="${pageBean.page ne 1 && pageBean.page ne 0}">
						<span><a href="<%=request.getContextPath() %>/plant/list2?page=1">&lt;</a></span>
					</c:if>
					
					<c:forEach begin="1" end="${pageBean.total }" varStatus="status" var="p">
						<c:if test="${pageBean.page eq status.index}">
								<span class="current">${pageBean.page}</span>
						</c:if>
						<c:if test="${pageBean.page ne status.index }">
							<span><a href="<%=request.getContextPath() %>/plant/list2?page=${p}" id="page">${p} </a></span>
						</c:if>
					</c:forEach>
					
					<c:if test="${pageBean.page ne pageBean.total }">
						<span><a href="<%=request.getContextPath() %>/plant/list2?page=${pageBean.total}">&gt;</a></span>	
					</c:if>
					
				</div>
			</div>
			<!--paging end--> 
--%>
			<!--paging start-->
			<div id="pages" class="clear" style="height:200px;">
				<div class="pages_total fl">
					<c:if test="${empty condition }">
						当前三个月内总计：
					</c:if>
					<c:if test="${!empty condition }">
						总计：
					</c:if>
					<span class="span_1">${page.records }</span>条 / <span
						class="span_2">${page.total }</span>页
				</div>
				<div class="paging fl">

					<!--翻页分页按钮-->
					<c:if test="${page.total == 1}">
						<span class="disabled">&lt;</span>
					</c:if>
					<c:if test="${page.total != 1}">
						<span><a
							href="${pageContext.request.contextPath}/plant/list2?rows=${rows}&page=1&condition=${condition }">&lt;</a></span>
					</c:if>



					<%-- 当页面少于5页时 --%>
					<%-- <c:if test="${page.total < 5}">
						<c:forEach begin="1" end="${page.total }" varStatus="status">
							<c:if test="${page.page == status.index}">
								<span class="current">${page.page }</span>
							</c:if>
							<c:if test="${page.page != status.index}">
								<span><a
									href="${pageContext.request.contextPath}/plant/list2?page=${status.index}&condition=${condition }">${status.index}</a></span>
							</c:if>
						</c:forEach>
					</c:if> --%>

					<%-- 当页面大于5页时，1、2页和倒数1、2页就不用居中 --%>
					<%-- <c:if test="${page.total >= 5}">
						<c:choose>
							<c:when test="${page.page < 3 }">
								前2个
								<c:forEach begin="2" end="${page.page }" varStatus="status">
									<span><a
										href="${pageContext.request.contextPath}/plant/list2?page=1&condition=${condition }">1</a></span>
								</c:forEach>
								<span class="current">${page.page }</span>
								<c:forEach begin="${page.page }" end="4" varStatus="status">
									<span><a
										href="${pageContext.request.contextPath}/plant/list2?page=${status.index + 1}&condition=${condition }">${status.index + 1}</a></span>
								</c:forEach>
							</c:when>
							<c:when test="${page.total - page.page < 2 }">
								后2个
								<c:forEach begin="0" end="${page.total - page.page + 1}" varStatus="status">
										<span><a href="${pageContext.request.contextPath}/plant/list2?page=${page.page - (3 - status.index)}">${page.page - (3 - status.index)}</a></span>
									</c:forEach>
									<span class="current">${page.page }</span>
									<c:forEach begin="1" end="${page.total - page.page}" varStatus="status">
										<span><a href="${pageContext.request.contextPath}/plant/list2?page=${status.index + page.page}">${status.index + page.page}</a></span>
									</c:forEach>
								<c:forEach begin="${page.total - page.page }" end="3"
									varStatus="status">
									<span><a
										href="${pageContext.request.contextPath}/plant/list2?page=${page.page - 4 + status.index}&condition=${condition }">${page.page - 4 + status.index}</a></span>
								</c:forEach>
								<span class="current">${page.page }</span>
								<c:forEach begin="1" end="${page.total - page.page}"
									varStatus="status">
									<span><a
										href="${pageContext.request.contextPath}/plant/list2?page=${status.index + page.page}&condition=${condition }">${status.index + page.page}</a></span>
								</c:forEach>
							</c:when>
							
							<c:otherwise>
								在中间的
								<c:if test="${page.page - 2 > 0}">
									<span><a
										href="${pageContext.request.contextPath}/plant/list2?page=${page.page - 2}&condition=${condition }">${page.page - 2}</a></span>
								</c:if>
								<c:if test="${page.page - 1 > 0}">
									<span><a
										href="${pageContext.request.contextPath}/plant/list2?page=${page.page - 1}&condition=${condition }">${page.page - 1}</a></span>
								</c:if>
								<span class="current">${page.page }</span>
								<c:if test="${page.page + 1 <= page.total}">
									<span><a
										href="${pageContext.request.contextPath}/plant/list2?page=${page.page + 1}&condition=${condition }">${page.page + 1}</a></span>
								</c:if>
								<c:if test="${page.page + 2 <= page.total}">
									<span><a
										href="${pageContext.request.contextPath}/plant/list2?page=${page.page + 2}&condition=${condition }">${page.page + 2}</a></span>
								</c:if>
							</c:otherwise>

						</c:choose>

						
								
							
					</c:if> --%>
					
				
				<%-- 当页面少于9页时 --%>
				<c:if test="${page.total < 9}">
					<c:forEach begin="1" end="${page.total }" varStatus="status">
						<c:if test="${page.page == status.index}">
							<span class="current">${page.page }</span>
						</c:if>
						<c:if test="${page.page != status.index}">
							<span><a
								href="${pageContext.request.contextPath}/plant/list2?rows=${rows}&page=${status.index}&condition=${condition }">${status.index}</a></span>
						</c:if>
					</c:forEach>
				</c:if>

				<%-- 当页面大于9页时，1、2页和倒数1、2页就不用居中 --%>
				<c:if test="${page.total >= 9}">
				
					<c:choose>
						<c:when test="${page.page>=9}">
							<c:forEach begin="${page.page-4<=1?1:page.page-4}" end="${page.page+4>=page.total?page.total:page.page+4}" varStatus="status">
								<c:choose>
									<c:when test="${page.page==status.index}">
										<span class="current">${page.page }</span>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${status.index==page.page-3}">
											<span><a
								href="${pageContext.request.contextPath}/plant/list2?rows=${rows}&page=${page.page-5}&condition=${condition }">...</a></span>
											</c:when>
											<c:when test="${status.index==page.page+3 }">
												<span><a
								href="${pageContext.request.contextPath}/plant/list2?rows=${rows}&page=${page.page+5>page.total?page.total:page.page+5}&condition=${condition }">...</a></span>
											</c:when>
											<c:when test="${status.index==page.page-4}">
											<span><a
								href="${pageContext.request.contextPath}/plant/list2?rows=${rows}&page=${page.page-8}&condition=${condition }">${page.page-8}</a></span>
											</c:when>
											<c:when test="${status.index==page.page+4 }">
												<span><a
								href="${pageContext.request.contextPath}/plant/list2?rows=${rows}&page=${page.page+8>page.total?page.total:page.page+8}&condition=${condition }">${page.page+8>page.total?page.total:page.page+8}</a></span>
											</c:when>
											
											
											<c:otherwise>
											 <span><a
								href="${pageContext.request.contextPath}/plant/list2?rows=${rows}&page=${status.index}&condition=${condition }">${status.index}</a></span> 
											</c:otherwise>
										</c:choose>
										
									</c:otherwise>
								</c:choose>
								
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach begin="1" end="9" varStatus="status">
								<c:choose>
									<c:when test="${page.page==status.index }">
										<span class="current">${page.page }</span>
									</c:when>
									<c:otherwise>
										<span><a href="${pageContext.request.contextPath}/plant/list2?rows=${rows}&page=${status.index}&condition=${condition }">${status.index}</a></span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				
				</c:if>
					
					

					<c:if test="${page.total == 1}">
						<span class="disabled">&gt;</span>
					</c:if>
					<c:if test="${page.total != 1}">
						<span><a
							href="${pageContext.request.contextPath}/plant/list2?rows=${rows}&page=${page.total}&condition=${condition }">&gt;</a></span>
					</c:if>

					<%--每页显示的数量 --%>
					<select name="page.pageSize" id="pageSizeSelector"
						style="width: 80px; height: 30px; border: 1px solid #D8D8D8; border-radius: 2px;">
						<option value="10" class="pageSize">10条/页</option>
						<option value="20" class="pageSize">20条/页</option>
						<option value="30" class="pageSize">30条/页</option>
					</select>
				</div>
				<input type="hidden" value="${rows }" name="rows">
			</div>
			<!--paging end-->
		</div>
		<!--wrap end-->
	</div>
	<!--nav  end-->



</body>

<!-- <script type="text/javascript">
	//获取当前页面显示条数
	var cal = $("input[name='rows']").val();
	debugger;
	$(document).ready(function(){
		/* $(".pageSize").each(function(){
			if($(this).val()==pageSize){
				$(this).attr("selected","selected");
			}
		}); */
		//根据显示条数默认选中下拉框
		var v = document.getElementById('pageSizeSelector');
		if (cal == 10) {
			debugger;
			v[0].selected = true;
		} else {
			v[1].selected = true;
		}
		//debugger;
		var rows = ${rows}
		if (rows) {
			$("#pageSizeSelector").find("option[value='" + rows + "']").attr(
					"selected", true);
		}

		$("#pageSizeSelector").change(function(){
		/*	alert("value:"+$(this).attr("value"));*/
			var rows = $(this).find("option:selected").val();
			window.location.href = "${pageContext.request.contextPath}/plant/list2?page=1&rows="+rows;
		});
	});
</script> -->

<script type="text/javascript"
	src="<%=request.getContextPath()%>/audit-asset/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/audit-asset/js/seedling_entry.js"></script>
<script type="text/javascript">
	 /* function del(id){
			debugger;
			if(confirm("是否删除")){
				$.ajax({
					data:{"id":id},
					dataType:"json",
					type:"get",
					url:"${pageContext.request.contextPath}/plant/edit",
					success:function(data){
						if(data.status == "success"){
							window.location.href="${pageContext.request.contextPath}/plant/list2";
						}
					}
				});
			} 
		}  */
		function del(id){
			//debugger;
			/* $("[onclick]").click(function(){ */
					  swal({
						title:"删除",
						text:"您确定要删除这条数据吗？",
						type:"warning",
						confirmButtonText:"确定",
						showCancelButton:true,
						cancelButtonText:"取消",
						closeOnConfirm:false,
						confirmButtonColor:"#ec6c62"
						},function(){
							//debugger;
							 $.ajax({
								url:"${pageContext.request.contextPath}/plant/edit2",
								data:{"id":id},
								dataType:"json",
								type:"get",
								success:function(data){
									if(data.status == "success"){
										swal("", "已成功删除数据！", "success"); 
										window.setTimeout("window.location.href='${pageContext.request.contextPath}/plant/list2'",1000); 
									}else{
										swal("", "错误", "error");
									}
								},
								error:function(){
									swal("", "错误", "error");
								}
							});
					});
			/* 	}); */
		};
		
		
		/*
		 *@description: 点击i弹出推算价格
		 *@author: Cao Mingfei
		 *@createDate: 2018-5-23
		 * */
		 
		/*点击i弹出推算价格*/
		(function(){
  		var $calc_i = $("#exclamatory");
  		$calc_i.click(function(){
  			window.parent.showCalc()
  		})
		})();
		
		/*点击修改ico弹出修改浮层*/
		function showModify(id){
			var a = "#modify" + id;
			$(a).toggle()
			//	$(a).css("dispaly","block")
		}
		
/* 		$(document).ready(function(){
			var $modify_frame = $(".modify_frame");
			alert($modify_frame.length)
			for(var i = 0; i<10; i++ ){
				if(i != 0){
					$modify_frame[i].css("display","none");	
				}
			}
		}) */
	</script>
	
	<script type="text/javascript">
		$(function(){
	        $('#search').bind('keypress',function(event){
	            if(event.keyCode == "13"){
	            	var condition = $("#search").val();
	            	debugger;
	        		window.location.href="${pageContext.request.contextPath}/plant/list2?condition="+condition; 

	            }
	        });
	    });
	</script>
	
</html>
