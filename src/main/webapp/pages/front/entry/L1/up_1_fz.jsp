<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>批量导入</title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/audit-asset/css/up_1_fz.css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/audit-asset/js/jquery-1.12.4.min.js"></script>
	</head>
		<body>
		<!--wrap start-->
		<div class="wrap">
			<!--header start-->
			<div id="header" class="clear">
				<p class="fl">园林苗木信息列表&nbsp;|&nbsp;</p>
				<p class="fl">新增苗木</p>
			</div>
			<!--header end-->
			
			<!--content start-->
			<div id="content">
				
				
				<!--上传 下载-->
				<div class="load">
					<img src="<%=request.getContextPath() %>/audit-asset/img/download.png" alt="" style="cursor: pointer;" onclick="download();"/>
					<img src="<%=request.getContextPath() %>/audit-asset/img/upload.png" alt="" onclick="upload();" style="cursor: pointer;"/>
					<form id="uploadForm" enctype="multipart/form-data">  
   <input type="file" style="display: none;" id="upload" name="file">
</form>  
					
					<p>说明：请先下载导入模板，根据模板填写好苗木数据后，再上传文件</p>
				</div>
				
				<!--上传失败-->
				<div  style="width: 110px; height: 120px; margin: 100px auto 0; "><img id="success" src="<%=request.getContextPath() %>/audit-asset/img/success.png" style="display: none; "/></div>
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
		<!-- <div class="wrap">
			header start
			<div id="header" class="clear">
				<p class="fl">园林审计列表&nbsp;|&nbsp;</p>
				<p class="fl">新增审计</p>
			</div>
			header end
			
			content start
			<div id="content">
				面包屑
				<div class="crumbs_step clear">
					<p>1 录入项目基本信息</p>
					<p>2 导入苗木数据</p>
					<p>3 生成审计报告</p>
				</div>
				
				上传 下载
				<div class="load">
					<img src="img/download.png" alt="" />
					<img src="img/upload.png" alt="" />
					<p>说明：请先下载导入模板，根据模板填写好苗木数据后，再上传文件</p>
				</div>
				
				上传成功
				<img id="failed" src="img/failed.png"/>
			</div>
			
			表格
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
			
			content end
		</div> -->
		<!--wrap end-->
		
		<!--step start-->
		<!-- <div id="step" class="clear">
			<a href="add_audit_1.html"><div id="pre_step" class="fl">上一步</div></a>
			<a href="add_audit_3.html"><div id="next_step" class="fl">下一步</div></a>
		</div> -->
		<!--step end-->
	</body>
	<script type="text/javascript">
	function upload(){
		$('#upload').click();
		$('#upload').change(function()
		{
			 var formData = new FormData($('#uploadForm')[0]);  
	            $.ajax({  
	                type: 'post',  
	                url: "${pageContext.request.contextPath}/plant/excelBatchAdd",  
	                data: formData,  
	                cache: false,  
	                processData: false,  
	                contentType: false,  
	            }).success(function (data) {  
	            	 $('#success').delay('2000').show(0).css({'margin':'0 auto'}); 
	            }).error(function () {  
	                alert("上传失败");  
	            });  
		});
			
		
	}
	$("#next_step").click(function(){
		window.location.href="${pageContext.request.contextPath}/plant/list2";
	});
	
	function download(){
		 window.open("${pageContext.request.contextPath}/upfiles/seedlingInformation20180503.xls");
	}
	</script>
</html>
