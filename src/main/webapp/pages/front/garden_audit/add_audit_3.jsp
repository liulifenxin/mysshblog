<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>ml>
<html>
	<head>
		<meta charset="UTF-8">
		<title>新增审计 3</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/audit-asset/css/add_audit_3.css" />
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
				<!--面包屑-->
				<div class="crumbs_step clear">
					<p>1 录入项目基本信息</p>
					<p>2 导入苗木数据</p>
					<p>3 生成审计报告</p>
				</div>
			</div>
			
			<!--表格-->
			<div class="table t_up">
				<p><span></span>经济性分析结果</p>
				<table border="" cellspacing="" cellpadding="">
					<tr>
						<th>行数</th>
						<th>苗木名称</th>
						<th>苗木规格</th>
						<th>疑点百分比</th>
						<th>平台价格</th>
						<th>项目价格</th>
						<th>偏差百分比</th>
					</tr>
					<tr>
						<td>2</td>
						<td>白玉兰</td>
						<td>胸径 Φ18 - 20cm</td>
						<td>10</td>
						<td>1024</td>
						<td>2048</td>
						<td>15</td>
					</tr>
					<tr>
						<td>2</td>
						<td>白玉兰</td>
						<td>胸径 Φ18 - 20cm</td>
						<td>10</td>
						<td>1024</td>
						<td>2048</td>
						<td>15</td>
					</tr><tr>
						<td>2</td>
						<td>白玉兰</td>
						<td>胸径 Φ18 - 20cm</td>
						<td>10</td>
						<td>1024</td>
						<td>2048</td>
						<td>15</td>
					</tr><tr>
						<td>2</td>
						<td>白玉兰</td>
						<td>胸径 Φ18 - 20cm</td>
						<td>10</td>
						<td>1024</td>
						<td>2048</td>
						<td>15</td>
					</tr>
				</table>
			</div>
			<div class="table t_down">
				<p><span></span>合理分析结果</p>
				<table border="" cellspacing="" cellpadding="">
					<tr>
						<th>行数</th>
						<th>苗木名称</th>
						<th>苗木规格</th>
						<th>疑点百分比</th>
						<th>平台价格</th>
						<th>项目价格</th>
						<th>偏差百分比</th>
					</tr>
					<tr>
						<td>2</td>
						<td>白玉兰</td>
						<td>胸径 Φ18 - 20cm</td>
						<td>10</td>
						<td>1024</td>
						<td>2048</td>
						<td>15</td>
					</tr>
					<tr>
						<td>2</td>
						<td>白玉兰</td>
						<td>胸径 Φ18 - 20cm</td>
						<td>10</td>
						<td>1024</td>
						<td>2048</td>
						<td>15</td>
					</tr>
					<tr>
						<td>2</td>
						<td>白玉兰</td>
						<td>胸径 Φ18 - 20cm</td>
						<td>10</td>
						<td>1024</td>
						<td>2048</td>
						<td>15</td>
					</tr>
				</table>
			</div>
			
			<!--content end-->
		</div>
		<!--wrap end-->
		
		<!--step start-->
		<div id="step" class="clear">
			<a href="${pageContext.request.contextPath}/front/garden_audit/add_audit_2_sf.html"><div id="pre_step" class="fl">上一步</div></a>
			<div id="next_step" class="fl">生成审计报告</div>
		</div>
		<!--step end-->
		
	</body>
</html>
