<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增审计 2_sf</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/audit-asset/css/add_audit_2_sf.css" />
<script
	src="${pageContext.request.contextPath}/audit-asset/js/jquery-3.2.1.js"></script>

<script>
	function upload() {
		$('#upload').click();
		$('#upload')
				.change(
						function() {
							debugger;
							var formData = new FormData($('#uploadForm')[0]);
							var id = "${project.id}";
							formData.append('id', id);
							/* $.ajax({
										url : "${pageContext.request.contextPath}/front/garden_audit/2",
										data : formData,
										
										type : "post",
										success : function(data) {
											if (data.status == "success") {
												alert(data);

											} else {
												swal("", "错误", "error");
											}
										},
										error : function() {
											swal("", "错误", "error");
										}
									}); */
							$.ajax({
										type : 'post',
										url : "${pageContext.request.contextPath}/front/garden_audit/02",
										data : formData,
										cache : false,
										processData : false,
										contentType : false,
										success : function(data) {
                                            console.log(data);
                                            if(data.status=='success'){
                                                flag = true;
                                                projectId = data.projectId;
                                                alert('上传成功');
                                            }
											/* alert(JSON.stringify(data)); */
										},
										error : function(error) {
											alert(JSON.stringif(error));
										}
									});
						});
	}
	function download() {
		/* downloadFile */

		window
				.open("${pageContext.request.contextPath}/upfiles/audit_import_example.xls");
				/* .open("${pageContext.request.contextPath}/upfiles/downlingInformation201802.xls"); */

	}
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
			<!--面包屑-->
			<div class="crumbs_step clear" style="color: #fff;">
				<p>1 录入项目基本信息</p>
				<p>2 导入苗木数据</p>
				<p>3 生成审计报告</p>
			</div>

			<!--上传 下载-->
			<div class="load">
				<img
					src="${pageContext.request.contextPath}/audit-asset/img/download.png"
					alt="" onclick="download()" style="cursor: pointer;" /><img
					src="${pageContext.request.contextPath}/audit-asset/img/upload.png"
					alt="" onclick="upload()" style="cursor: pointer;" />

				<form id="uploadForm" enctype="multipart/form-data">
					<input type="file" name="file" id="upload" style="display: none" />

				</form>


				<p>说明：</p><br>
				<p>1.请先下载导入模板，根据模板填写好苗木数据后，再上传文件</p><br>
				<%-- <p>2.上传文件时，需根据不同阶段上传对应的苗木数据。</p><br>
				<c:forEach items="${auditstageString }" var="auditstageInt" varStatus="status">
					<span>审计阶段：${auditstageInt }</span>
					 <img src="${pageContext.request.contextPath}/audit-asset/img/upload.png"
					alt="" onclick="upload(${status.index})" style="cursor: pointer;" />
					<br>
				</c:forEach> --%>
			</div>

			<!--上传成功-->
			<img id="success" style="display: none;"
				src="${pageContext.request.contextPath}/audit-asset/img/success.png" />
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
	<div class="wrap" style="display: none;">
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
				<img
					src="${pageContext.request.contextPath}/audit-asset/img/download.png"
					alt="" /> <img
					src="${pageContext.request.contextPath}/audit-asset/img/upload.png"
					alt="" />
				<p>说明：请先下载导入模板，根据模板填写好苗木数据后，再上传文件</p>
			</div>

			<!--上传失败-->
			<img id="failed"
				src="${pageContext.request.contextPath}/audit-asset/img/failed.png" />
		</div>

		<!--表格-->
		<div class="table">
			<p>
				错误信息如下，请先更正错误信息，然后再重新点击<span>上传苗木数据</span>。
			</p>
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
		<a href="add_audit_1.html"><div id="pre_step" class="fl">上一步</div></a>
		<!-- "add_audit_3.html" -->
		<a  id="next_step_a" onclick="javascript:void(0);" ><div id="next_step" class="fl">下一步</div></a>
	</div>
	<!--step end-->

<script type="text/javascript">
<% String id =  (String)request.getAttribute("projectId"); %>

    // zcy --------begin-------------
	var flag = false;
	var projectId;
	$("#next_step_a").on("click",function(){
	    if(!flag) {
            alert('请上传苗木');
            return;
        }
        window.location.href="add_audit_3?projectId=${ project.id}";
       /*  window.location.href = "${pageContext.request.contextPath}/front/garden_audit/analysePlant?projectId=" + projectId; */
	})
    // zcy --------end-------------
    

		
</script>



</body>
</html>
