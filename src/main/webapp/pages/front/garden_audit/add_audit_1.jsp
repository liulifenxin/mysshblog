<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>新增审计 1</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/audit-asset/css/add_audit_1.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/audit-asset/css/layui.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/audit-asset/css/iconfont.css" />
		<script src="${pageContext.request.contextPath}/audit-asset/js/jquery-3.2.1.js"></script>
		<script src="${pageContext.request.contextPath}/audit-asset/js/layui.js"></script>
		<script src="${pageContext.request.contextPath}/audit-asset/js/layui.all.js"></script>
		<script>
			layui.use(['form', 'laydate'], function(){
			  var form = layui.form
			  ,laydate = layui.laydate;
			  
			  //日期
			  laydate.render({
			    elem: '#date'
			  });
			  laydate.render({
			    elem: '#date2'
			  });
			  
			});
		</script>
	</head>
		<body>
		<!--wrap start-->
		<div class="wrap">
			<!--header start-->
			<div id="header" class="clear">
				<p class="fl">园林审计列表&nbsp;|&nbsp;</p>
				<p class="fl">新增审计</p>
			</div>
			<!--header end-->
			
			<!--content start-->
			<div id="content">
				<div class="crumbs_step clear">
					<p>1 录入项目基本信息</p>
					<p>2 导入苗木数据</p>
					<p>3 生成审计报告</p>
				</div>
				<form action="" class="info_input">
					<p>项目名称<input type="text" name="projectName" id="projectName" value="" placeholder="请输入"/></p>
					<p>项目所在地
						<select name="projectPlace" id="projectPlace">
							<option value="">请选择</option>
							<c:forEach items="${applicationScope.params['adaptableArea'] }" var="adaptableArea" varStatus="status">
								<option value="${status.index }">${adaptableArea}</option>
							</c:forEach>
						</select>
					</p>
					<p>所在区域
						<select name="projec_region" id="projec_region">
							<option value="">请选择</option>
						</select>
					</p>
					<!-- <input type="text"  id="startDate" value="" placeholder="开始日期" />
					<input type="text" name="endDate" id="endDate" value="" placeholder="结束日期"/> -->
					<p>项目日期<input type="text" name="startDate" id="date" lay-verify="date" placeholder="开始日期" autocomplete="off" class="layui-input iconfont icon-riqi" >
						至<input type="text" name="endDate" id="date2" lay-verify="date" placeholder="结束日期" autocomplete="off" class="layui-input">
					</p>

					<p>疑点百分比<input type="text" name="doubtfulPercent" id="doubtfulPercent" value="" placeholder="请输入0-100整数"/></p>
					<p>说明：项目中每种规格苗木价格与平台计算价格进行对比，超出此百<br />分比的数据作为疑点提取出来</p>
					<div class="habits clear">
						<p>项目地区生态习性</p>
						<p class="fl">阳光
							<br />
							<select name="temperature">
								<c:forEach items="${applicationScope.params['temperaturePreference'] }" var="temperaturePreference" varStatus="status">
									<option value="${status.index }">${temperaturePreference}</option>
								</c:forEach>
							</select>
						</p>
						<p class="fl">气温
							<br />
							<select name="humidity">
								<c:forEach items="${applicationScope.params['humidityPreference'] }" var="humidityPreference" varStatus="status">
									<option value="${status.index }">${humidityPreference}</option>
								</c:forEach>
							</select>
						</p>
						<p class="fl">湿度
							<br />
							<select name="soil">
								<c:forEach items="${applicationScope.params['soilPreference'] }" var="soilPreference" varStatus="status">
									<option value="${status.index }">${soilPreference}</option>
								</c:forEach>
							</select>
						</p>
					</div>
				</form>
			</div>
			<!--content end-->
		</div>
		<!--wrap end-->
		
		<!--next_step start-->
		<a id="submit"  href="#">
			<div id="next_step">下一步</div>
		</a>
		<!--next_step end-->
	</body>
	<script type="text/javascript" src="${pageContext.request.contextPath}/audit-asset/js/jquery-3.2.1.js"></script>
	<script type="text/javascript">
		$("#submit").on("click",function(){
			var projectName = $("input[name='projectName']").val();
			var projectPlace = $("select[name='projectPlace'] :selected").val();
			var startDate = $("input[name='startDate']").val();
			var endDate = $("input[name='endDate']").val();
			var doubtfulPercent = $("input[name='doubtfulPercent']").val();
			var temperature = $("select[name='temperature'] :selected").val();
			var humidity = $("select[name='humidity'] :selected").val();
			var soil = $("select[name='soil'] :selected").val();
			
			if(projectName == undefined || projectName.trim() == ""){
				alert("项目名称不能为空!");
				return false;
			}
			
			if(projectPlace == undefined || projectPlace.trim() == ""){
				alert("项目所在地不能为空!");
				return false;
			}
			
			if(startDate == undefined || startDate.trim() == ""){
				alert("开始时间不能为空!");
				return false;
			}
			
			if(endDate == undefined || endDate.trim() == ""){
				alert("结束时间不能为空!");
				return false;
			}
			
			if(doubtfulPercent == undefined || doubtfulPercent.trim() == ""){
				alert("疑点百分比不能为空!");
				return false;
			}
			if(!/^(([1-9]\d?)|100)$/.test(doubtfulPercent.trim())){
				alert("疑点百分比为1-100整数!");
				return false;
			}
			
			if(temperature == undefined || temperature.trim() == ""){
				alert("温度选项不能为空!");
				return false;
			}
			
			if(humidity == undefined || humidity.trim() == ""){
				alert("湿度选项不能为空!");
				return false;
			}
			
			if(soil == undefined || soil.trim() == ""){
				alert("土壤选项不能为空!");
				return false;
			}
			
			var data = {
					"projectName":projectName.trim(),
					"projectPlace":projectPlace.trim(),
					"startDate":startDate.trim(),
					"endDate":endDate.trim(),
					"doubtfulPercent":doubtfulPercent.trim(),
					"temperature":temperature.trim(),
					"humidity":humidity.trim(),
					"soil":soil.trim()
			};
			 window.location.href="${pageContext.request.contextPath}/front/garden_audit/add_audit_2_sf?"+$.param(data); 
			
		});
	</script>
</html>
