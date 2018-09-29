<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增审计 2_sf_gp</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/audit-asset/css/add_audit_2_sf.css" />
<script
	src="${pageContext.request.contextPath}/audit-asset/js/jquery-3.2.1.js"></script>

<script>
	//var indexs = [];
	function upload(e,index) {
		
		
		var auditstagestr = $(e).attr("id");
		//alert(auditstagestr);
		$('#upload').click();
		$('#upload').unbind("change");  //解除change事件，防止多次触发上传事件
		$('#upload').change( function() {
		//$('#upload').live('change', function() {
			//上传名称
			var filename = document.getElementById("upload");
			var length = filename.files.length;
			var temp = filename.files[0].name;						 
			$(".sccg").eq(index).find("span").eq(0).text(temp);
			$(".scsb").eq(index).find("span").eq(0).text(temp);
			
			//上传动态
			$(".scz").eq(index).show();
		    $(".sccg").eq(index).hide();
		    $(".scsb").eq(index).hide();
			//debugger;
			var formData = new FormData($('#uploadForm')[0]);
			var id = "${project.id}";
			formData.append('id', id);
			formData.append('auditStageString', auditstagestr);
			
			$.ajax({
				type : 'post',
				url : "${pageContext.request.contextPath}/front/garden_audit/02_gp",
				data : formData,
				cache : false,
				processData : false,
				contentType : false,
				success : function(data) {
                    console.log(data);
                    if(data.status=='success'){
                        flag++;
                        projectId = data.projectId;
                        //alert('上传成功');
                        $(".scz").eq(index).hide();
			      		$(".sccg").eq(index).show();
			      		$(".scsb").eq(index).hide();
			      	    //上传之后不能继续上传，未实现
			    	    /* if(indexs.length==0){
			    			indexs[indexs.length]=index;
			    		}
			    		else{
			    			for(var j = 0;j< indexs.length;j++){
			    				if(index==indexs[j]){
			    					return false;
			    				}
			    				if(j==indexs.length-1){
			    					indexs[indexs.length]=index;
			    					break;
			    				}
			    			}
			    		} */
			      		$(e).removeAttr("onclick");//jquery1.6+
			      	    $(e).text("上传成功");
                    }
                    if(data.status=='error'){
						$(".scz").eq(index).hide();
					    $(".sccg").eq(index).hide();
					    $(".scsb").eq(index).show();
                	}
					/* alert(JSON.stringify(data)); */
				},
				error : function(error) {
					//alert(JSON.stringif(error));
					$(".scz").eq(index).hide();
				    $(".sccg").eq(index).hide();
				    $(".scsb").eq(index).show();
				}
			});
			//将file域中当前的value值清空，解决同一个文件不能连续上传问题	
			var objFile=document.getElementById('upload'); 
			//alert("\"当前值："+$('#upload').outerHTML);
			//alert("\"文件值："+objFile.value+"\"开始清除"); 
			objFile.value=""; 
			//alert("\"当前值："+objFile.value+"\"已清除"); 
			//alert("\"验证清除后的值："+$('#upload').outerHTML);
		});		
	}
	function download() {
		/* downloadFile */
		window.open("${pageContext.request.contextPath}/upfiles/audit_import_example.xls");
		/* .open("${pageContext.request.contextPath}/upfiles/downlingInformation201802.xls"); */
	}
</script>
</head>
<body>
	<!--wrap start-->
	<div class="wrap" style="height:900px">
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
				<img src="${pageContext.request.contextPath}/audit-asset/img/download.png"
				alt="" onclick="download()" style="cursor: pointer;" />
				<!--gp  <img	
	            src="${pageContext.request.contextPath}/audit-asset/img/upload.png"
				alt="" onclick="upload()" style="cursor: pointer;" />  gp-->

				<form id="uploadForm" enctype="multipart/form-data">
					<input type="file" name="file" id="upload" style="display: none" />
				</form>

				<p>说明：</p>
				<p>1.请先下载导入模板，根据模板填写好苗木数据后，再上传文件</p>
				<p>2.上传文件时，需根据不同阶段上传对应的苗木数据。</p>
				<c:forEach items="${sessionScope.auditstageString }" var="auditstageStr" varStatus="status">
					<%-- <span>审计阶段：${auditstageStr }</span> --%>
					<div style="display:inline-block;margin-top:15px;width:200px;">
						<span><p style="display:inline-block;color:#EC3F4E;font-size:14px;">*</p>审计阶段：${auditstageStr }</span>
					</div>
					<%-- <img id="${auditstageStr }" src="${pageContext.request.contextPath}/audit-asset/img/upload.png"
					alt="" onclick="upload(this)" style="cursor: pointer;" /> --%>
					<div style="display:inline-block;width:52px;height:16px;margin-left:44px;">
						<a id="${auditstageStr }" class="up" onclick="upload(this,${status.index})" 
						style="width:52px;height:16px;font-size:12px;color: #555555;letter-spacing: 1px;cursor: pointer;text-decoration:underline;">点击上传</a>
					</div>
					<div>
						<!-- 上传过程图片 -->
						<div id="" class="scz" style="display:none;margin-top:10px;">
							<div class="circle" style="display:inline-block;width:8px;height:8px;border-radius: 20px;background-color: #0BBA6B;margin-left:10px;" ></div>
							<div class="circle" style="display:inline-block;width:8px;height:8px;border-radius: 20px;background-color: #0BBA6B;margin-left:10px;opacity:0.4;" ></div>
							<div class="circle" style="display:inline-block;width:8px;height:8px;border-radius: 20px;background-color: #0BBA6B;margin-left:10px;opacity:0.1;" ></div>
							<div style="display:inline-block;margin-left:10px;font-size:11px;letter-spacing: 0.92px;color: #555555;font-family: MicrosoftYaHei;">上传中</div>
						</div>
						<!-- 上传成功图片 -->
						<div id="" class="sccg" style="display:none;margin-top:10px;">
							<img alt="" src="${pageContext.request.contextPath}/audit-asset/img/icon－excle.svg" style="width:18px;height:18px;margin-bottom: -3px;">
							<span style="font-size: 12px;letter-spacing: 0.86px;color: #555555;"></span>
							<img alt="" src="${pageContext.request.contextPath}/audit-asset/img/解析成功.svg" style="width:18px;height:18px;margin-bottom: -4px;margin-left:10px;">
						</div>
						<!-- 上传失败图片 -->
						<div id="" class="scsb" style="display:none;margin-top:10px;">
							<img alt="" src="${pageContext.request.contextPath}/audit-asset/img/icon－excle.svg" style="width:18px;height:18px;margin-bottom: -3px;">
							<span style="font-size: 12px;letter-spacing: 0.86px;color: #555555;"></span>
							<img alt="" src="${pageContext.request.contextPath}/audit-asset/img/解析失败.svg" style="width:18px;height:18px;margin-bottom: -4px;margin-left:10px;">
							<a style="font-family: MicrosoftYaHei;font-size: 12px;color: #EC3F4E;letter-spacing: 1px;cursor: pointer;">查看错误信息 ></a>
						</div>
					</div>
				</c:forEach>    
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
	var flag = 0;
	var projectId;
	//var auditstageIndex="${auditstageIndex}";
	$("#next_step_a").on("click",function(){
		if(flag == 0) {
            alert('请上传苗木数据');
            return;
        }
		else if(flag<"${auditstageIndex}") {
            alert('请将苗木数据上传完整');
            return;
        }
        window.location.href="add_audit_3_gp?projectId=${ project.id}";
       /*  window.location.href = "${pageContext.request.contextPath}/front/garden_audit/analysePlant?projectId=" + projectId; */
	})
    // zcy --------end-------------
    

		
</script>



</body>
</html>
