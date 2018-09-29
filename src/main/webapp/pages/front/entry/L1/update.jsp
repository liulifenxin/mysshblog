<!--
	作者：chen cong liang 
	时间：2018-05-04 
	描述：苗木修改
-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>修改苗木</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/audit-asset/css/newlyIncreased.css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>		
				<link href="<%=request.getContextPath() %>/sweetAlert/css/sweet-swal.css" rel="stylesheet">
		<script src="<%=request.getContextPath() %>/sweetAlert/js/sweet-swal.js"></script>
	</head>
	<body style="overflow-x:hidden; ">
		<div id="nav">					<!--整体标签-->
			<div class="wrap">
				<div id="header">
			<p>苗木信息列表 | <span style="font-weight: bold;">修改苗木信息</span></p>
		</div>
		</div>
		<!--中间整体标签-->
		<div id="nav_2">	
				<div id="scend">
					<p><span class="f2">1</span><span style="font-size:18px; color=#222222;letter-spacing: 1.12px;line-height: 20px;">苗木基本信息</span></p>
				</div>
				
		<!--给文字后的分割线设置标签-->
				<div class="f3"></div>
			
		
		<div id="F_img" style="width:150px;height:120px;background-color:red;position:absolute;top:90px;left:8px;">
		<img src="<%=request.getContextPath() %>/audit-asset/img/miaomu.png" style="width:100%;height:100%;"></div>
		<form id="add">
		<!--名称-->	
		<div class="name">
			<p><span class="l1"><span style="color:red;">*</span>苗木名称</span><input type="text" name="plantName" id="" style="width:260px;height:30px;" value="${plant.plantName }"  /></p>			
		</div>	
		<!--别名--->
		<div class="alias" style="position:relative;top:-4px;">
			<p><span class="l2" style="margin-right: 37px;margin-left:7px;">别名</span><input type="text" name="aliasName" id="" style="width:260px;height:30px;" value="${plant.aliasName }"  /></p>			
		</div>	
		
		<!--类型-->
		<div class="type">

			<!-- <span class="l3">苗木类型*</span> -->
			<%-- <input type = "text" name="type" value="${plant.type }"> --%>
			<span class="l3"><span class="stars" style="color:red;">*</span>苗木类型</span>
			<select name="type" style="width:264px;height:34px;" value="${plant.type }">
				<c:forEach items="${applicationScope.params['seedlingCategory']}" var="seedlingCategory" varStatus="status">
					<option  value="${status.index}"> ${seedlingCategory}
				</c:forEach>
			</select>
			


		</div>
		<!--地区-->
		<div class="region" style="position:relative;top:-19px;">
			<span class="l4"><span style="color:red;">*</span>适应地区</span>
			<select name="type1" id="area" style="width:266px;height:35px;">
				<c:forEach items="${applicationScope.params['adaptableArea']}" var="adaptableArea" varStatus="status">
					<option  value="${status.index}"> ${adaptableArea}
				</c:forEach>
			</select>
		</div>
		
		<!--阳光喜好-->
		<div class="sun">
			<span class="l5"><span style="color:red;">*</span>阳光喜好</span>
			<select name="type2" style="width:264px;height:34px;">
				<c:forEach items="${applicationScope.params['sunshinePreference']}" var="sunshinePreference" varStatus="status">
					<option   value="${status.index}"> ${sunshinePreference}
				</c:forEach>
			</select>
		</div>
		
		<!--温度喜好-->
		<div class="tem" style="position:relative;top:-34px;">
			<span class="l6"><span style="color:red;">*</span>温度喜好</span>
			<select name="type3" style="width:266px;height:34px;">
				<c:forEach items="${applicationScope.params['temperaturePreference']}" var="temperaturePreference" varStatus="status">
					<option  value="${status.index}"> ${temperaturePreference}
				</c:forEach>
			</select>
		</div>
		
		<!--湿度喜好-->
		<div class="hum">
			<span class="l7"><span style="color:red;">*</span>湿度喜好</span>
			<select name="type4" style="width:264px;height:34px;">
				<c:forEach items="${applicationScope.params['humidityPreference']}" var="humidityPreference" varStatus="status">
					<option value="${status.index}"> ${humidityPreference}
				</c:forEach>
			</select>
		</div>
		
		<!--土壤-->
		<div class="soil" style="position:relative;top:-48px;">
			<span class="l8"><span style="color:red;">*</span>土壤喜好</span>
			<select style="width:266px;height:35px;">
				<c:forEach items="${applicationScope.params['soilPreference']}" var="soilPreference" varStatus="status">
					<option  value="${status.index}"> ${soilPreference}
				</c:forEach>
				
			</select>
		</div>
		
		<!--观赏特征-->
		<div class="fea">
			<span class="l9" style="margin-right: 9px;margin-left:8px;">观赏特征</span>
			<select name="type5" style="width:264px;height:34px;">
				<c:forEach items="${applicationScope.params['ornamentalFeatures']}" var="ornamentalFeatures" varStatus="status">
					<option  value="${status.index}"> ${ornamentalFeatures}
				</c:forEach>
			</select>
		</div>
		
		<!--用途-->
		<div class="pur" style="position:relative;top:-64px;">
			<span class="l10"><span style="color:red;">*</span>用途特征</span>
			<select name="type6" style="width:266px;height:35px;">
				<c:forEach items="${applicationScope.params['useFeatures']}" var="useFeatures" varStatus="status">
					<option  value="${status.index}"> ${useFeatures}
				</c:forEach>
			</select>
		</div>	
		
		<!--描述-->
		<span  class="des"><p style="margin-left:8px;">描述</p><textarea class="l12" name="pDesc" style="width:689px;height:85px;">${plant.pDesc }</textarea></span>
	
		
		<div id="nav_3">	
				<div id="scend_1">
					<p><span class="f4">2</span><span style="font-size:18px;">苗木价格信息</span></p>
				</div>
			
		<div id="add_search" class="clear">
					<!--添加价格-->
					<div id="tj" class="add_audit fl">
						<span>+</span>
						<span>添加价格</span>
					</div>
			
		<!--给文字后的分割线设置标签-->
				<div class="f5"></div>
		
		<!--表格-->
		<div id="table" style="position:relative;">
			<table border="" cellspacing="0" cellpadding="0" style="border-style:none;">
		     <tr>
		     	<td style="color:#7F8FA4;">产地</td>
		     	<td style="color:#7F8FA4;">规格类型</td>
		     	<td style="color:#7F8FA4;">规格</td>
		     	<td style="color:#7F8FA4;">价格</td>
		     	<td style="color:#7F8FA4;">单位</td>	
		     	   
		     </tr>
		     <c:forEach items="${sf}" var="sf">
		     	<tr id="seedformat_${sf.id}">
		     		<td>${sf.placeOrigin}</td>
		     		<td>${sf.specTypeStr }</td>
		     		<td>${sf.spec} </td>
		     		<td>${sf.price}</td>
		     		<td>${sf.unit} </td>
		     		
		     		<td  style="border-style:none;background-color:white;font-size:12px;color:#EC3F4E;position:absolute;right:-5px;height:37px;line-height:37px;" id="del_seedformat${sf.id}" onclick="del_seedformat(${sf.id})">删除</td>
		     	</tr>
		     </c:forEach>
		     					
			</table>
		</form>	
			<div id="add_search_1" class="clear_1">
					<!--添加价格-->
					<div class="add_audit fl_1">
						<span id="save" onclick="return false;" style="cursor: pointer;">确认修改</span>
						<!-- <button  onclick="return false;" id="submit">提交</button> -->
					</div>
					
					<div id="can" class="add_audit fl_2" style="background-color:white;">
						<span style="color:black;">上一步</span>
					</div>
		
			</div>
		
		</div>
		</div>
	</body>
	<script type="text/javascript">
		$("#save").click(function(){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/plant/insert",
				data: $("#add").serialize(),
				dataType:"json",
				success:function(data){
					if(data.status == "success"){
						/* window.location.href="${pageContext.request.contextPath}/plant/toList"; */
						window.history.go(-1);
					}else{
						alert("保存出错");
					}
				},
				error:function(){
					alert("服务器异常");
				}
			});
		});
		
		function del_seedformat(seedformatId){
			
			del(seedformatId);
			
		}
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
								url:"${pageContext.request.contextPath}/plant/edit",
								data:{"id":id},
								dataType:"json",
								type:"get",
								success:function(data){
									if(data.status == "success"){
										swal("", "已成功删除数据！", "success"); 
										/* window.setTimeout("window.location.href='${pageContext.request.contextPath}/plant/list'",1000); */
										$("#seedformat_"+id).remove();
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
		}
		
	</script>

	
</html>
