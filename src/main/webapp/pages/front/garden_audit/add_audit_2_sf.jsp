<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>新增审计 2_sf</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/audit-asset/css/add_audit_2_sf.css" />
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
				
				<!--上传 下载-->
				<div class="load">
					<img src="${pageContext.request.contextPath}/audit-asset/img/download.png" alt="" />
					<img src="${pageContext.request.contextPath}/audit-asset/img/upload.png" alt="" />
					<p>说明：请先下载导入模板，根据模板填写好苗木数据后，再上传文件</p>
				</div>
				
				<!--上传失败-->
				<img id="success" src="${pageContext.request.contextPath}/audit-asset/img/success.png"/>
			</div>
			<!--content end-->
		</div>
		<!--wrap end-->
		
		<!--step start-->
		<div id="step" class="clear">
			<div id="pre_step" class="fl">上一步</div>
			<div id="next_step" class="fl">下一步</div>
		</div>
		<!--step start-->
		
		<!--分割线-->
		<hr />
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
				
				<!--上传 下载-->
				<div class="load">
					<img src="${pageContext.request.contextPath}/audit-asset/img/download.png" alt="" />
					<img src="${pageContext.request.contextPath}/audit-asset/img/upload.png" alt="" />
					<p>说明：请先下载导入模板，根据模板填写好苗木数据后，再上传文件</p>
				</div>
				
				<!--上传成功-->
				<img id="failed" src="${pageContext.request.contextPath}/audit-asset/img/failed.png"/>
			</div>
			
			<!--表格-->
			<div class="table">
				<p>错误信息如下，请先更正错误信息，然后再重新点击<span>上传苗木数据</span>。</p>
				<table border="" cellspacing="" cellpadding="">
					<tr>
						<th>行数</th>
						<th>项目</th>
						<th>错误信息</th>
					</tr>
					<tr>
						<td>2</td>
						<td>规格</td>
						<td>规格信息不能为空</td>
					</tr>
					<tr>
						<td>2</td>
						<td>规格</td>
						<td>规格信息不能为空</td>
					</tr>
					<tr>
						<td>2</td>
						<td>规格</td>
						<td>规格信息不能为空</td>
					</tr>
					<tr>
						<td>2</td>
						<td>规格</td>
						<td>规格信息不能为空</td>
					</tr>
				</table>
			</div>
			
			<!--content end-->
		</div>
		<!--wrap end-->
		
		<!--step start-->
		<div id="step" class="clear">
			<a href="${pageContext.request.contextPath}/front/garden_audit/add_audit_1"><div id="pre_step" class="fl">上一步</div></a>
			<a href="${pageContext.request.contextPath}/front/garden_audit/add_audit_3.html"><div id="next_step" class="fl">下一步</div></a>
		</div>
		<!--step end-->
	</body>
</html>
