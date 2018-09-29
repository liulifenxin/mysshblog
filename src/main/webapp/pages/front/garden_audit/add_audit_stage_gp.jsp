<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增审计 1</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/audit-asset/css/add_audit_1.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/audit-asset/css/layui.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/audit-asset/css/iconfont/iconfont.css" />
<script
	src="${pageContext.request.contextPath}/audit-asset/js/jquery-3.2.1.js"></script>
<script
	src="${pageContext.request.contextPath}/audit-asset/layui/layui.js"></script>
<script
	src="${pageContext.request.contextPath}/audit-asset/layui/layui.all.js"></script>

</head>
<body class="yc">
	<!--wrap start-->
	<div class="wrap" style="position: relative;height:850px;">
		<span id="errorMsg" style="display: block; width: 200px; height: 30px; line-height: 30px; position: absolute; top: 176px; left: 187px; color: red;"></span>
		<!--header start-->
		<div id="header" class="clear">
			<p class="fl">园林审计列表&nbsp;|&nbsp;</p>
			<p class="fl">新增审计</p>
		</div>
		<!--header end-->

		<!--content start-->
		<div id="content">
			<div class="crumbs_step clear" style="color: #fff;">
				<p>1 录入项目基本信息</p>
				<p>2 导入苗木数据</p>
				<p>3 生成审计报告</p>
			</div>
			<form action="" class="info_input clear">
				<!--项目设置  -->
				<div id="project_set" class="fl">
					<h3>项目设置</h3>
					<p>
						<span class="red_star">*</span>项目名称 <input type="text" placeholder="${project.projectName }" style="width: 360px; margin-left: 45px;"
							 disabled="true" >
						<%-- <span class="date_wrap"><input type="text"
							name="projectName2" id="projectName2" value="${project.projectName}" disabled="true" ></span> --%> 
					</p>
					
					<p class="project_date">
						<span class="red_star">*</span>项目日期 <span disabled="true" style="display:inline-block;width:360px;height:30px;margin-left:45px;border:1px solid #D8D8D8;border-radius:2px;background:#ECECEC">
							<input type="text" name="startDate" id="date" lay-verify="date"
							placeholder="${startDate}" disabled="true">
							至<input type="text" name="endDate" id="date2" lay-verify="date"
							placeholder="${endDate}" disabled="true">
							<!-- <span class="iconfont icon-riqi"></span> -->
						</span>
					</p>
					<!-- 项目占地面积 -->
					<p style="position:relative;">
						<span class="red_star">*</span>项目占地面积 
						<span style="display: inline-block; width: 360px; height: 30px; margin-left: 15px; border: 1px solid #D8D8D8; border-radius: 2px;">
							<input type="text" placeholder="${project.projectAcreage }" disabled="true" style="width: 360px;">
							 <i style="position:absolute;right:4px;top:6px;">㎡</i></span>
					</p>
					<p>
						<span class="red_star">*</span>项目所在地 <input type="text" placeholder="${project.projectPlace }" style="width: 360px; margin-left: 30px;"
							 disabled="true" >
					</p>

					<div class="habits clear">
						<p>项目地区生态特征</p>
						<p id="sunshine_wrap">
							<span class="red_star">*</span><span>阳光特征</span>
							<input type="text" placeholder="${sunshine }" style="width: 360px; margin-left: 45px;"
							 disabled="true">
						</p>
						
						<p id="temperature_wrap">
							<span class="red_star">*</span><span>气温特征</span>
							<input type="text" placeholder="${temperature }" style="width: 360px; margin-left: 45px;"
							 disabled="true" >
						</p>
						<p id="humidity_wrap">
							<span class="red_star">*</span><span>湿度特征</span>
							<input type="text" placeholder="${humidity }" style="width: 360px; margin-left: 45px;"
							 disabled="true" >
						</p>
					</div>
				</div>

				<!--审计设置  -->
				<div id="audit_set" class="fl">
				<div class="div-box" >
					<h3>审计设置</h3>
					
					<div id="tank" style="display:none;position:absolute;top:-40px;left:250px;width:260px;height:80px;background: #FFFFFF;border: 1px solid #D8D8D8;box-shadow: 0 4px 16px 0 ;border-radius: 2px;">
						<p id="es" style="width:228px;margin-top: 15px;margin-left: 20px;color: #555555;font-size:12px;letter-spacing: 1px;"></p>
						<p type="button" onclick="zdl()" style="cursor: pointer;font-size: 12px;color: #1A89E8;margin-top: 15px;letter-spacing: 1px;text-align: right;">我知道了</p>
					</div>
					
					<p id="audit_part_wrap" >
						<span class="red_star" style="position: relative; top: -10px;">*</span><span
							style="position: relative; top: -10px;">审计阶段</span> 
						<span id="audit_part" onclick="swith_arrow('#audit_part_wrap')" oninput="haveAuditStage()">请选择 </span> 
						<i class="iconfont icon-jiantou-xia"></i>
					</p>
					<!-- 项目阶段多选 -->
					<ul class="multi_selec_frame">
						<li><span class="iconfont icon-fuxuankuangweixuan"></span><span>项目设计阶段</span></li>
						<li><span class="iconfont icon-fuxuankuangweixuan"></span><span>招标控制价阶段</span></li>
						<li><span class="iconfont icon-fuxuankuangweixuan"></span><span>中标价阶段</span></li>
						<li><span class="iconfont icon-fuxuankuangweixuan"></span><span>变更价阶段</span></li>
						<li><span class="iconfont icon-fuxuankuangweixuan"></span><span>结算价阶段</span></li>
					</ul>
					</div>
					<h4>审计参考对象设置</h4>
					<p id="mean_calc_wrap">
						<span class="red_star">*</span><span>参考价格</span> <select
							name="mean_calc" id="mean_calc"
							onclick="swith_arrow('#mean_calc_wrap')">
							<option value="1">均值计算</option>
							<option value="2">权威值计算</option>
							<option value="3">权重值计算</option>
						</select> <i class="iconfont icon-jiantou-xia"></i>
					</p>

					<p id="percent_wrap">
						<span class="red_star">*</span><span>疑点百分比</span> <input
							type="text" name="doubtfulPercent" id="percent" value=""
							placeholder="请输入" /> <span class="introduce">说明：项目中每种规格苗木价格与平台计算价格进行对比，超出此百分比的数据作为疑点提取出来</span>
						<i class="posi_percent">%</i>
					</p>
		
				</div>
			</form>
		
		</div>
		<!--content end-->

		<!--next_step start-->
		<div id="next_step">下一步</div>
		<!--next_step end-->

	</div>
	<!--wrap end-->


</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/audit-asset/js/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/audit-asset/js/distpicker.data.js"></script>
<script src="${pageContext.request.contextPath}/audit-asset/js/distpicker.js"></script>

<script type="text/javascript">
	function haveAuditStage(){
		var auditStageName = $("#audit_part").val();
		alert(auditStageName);
		alert(123123);
		/* $.ajax({
			url:"${pageContext.request.contextPath}/front/garden_audit/getProject",
			data:{"auditStageName":projectName},
			dataType:"json",
	    	success: function(data){
	    		if(data.status == "success"){
		    		document.getElementById("errorMsg").innerHTML = "您所创建的项目名已存在！";
		    		$("#projectName").focus();
	    		}else if(data.status == "noProject"){
		    		document.getElementById("errorMsg").innerHTML = "";
	    		}
	    	},
	    	error:function(error){
	    	}
		})  */
	}
</script>


<script>
	$("#percent").keyup(
		function() {
			var projectName = $("input[name='projectName']").innerHTML;
			var projectPlace = $("select[name='projectPlace'] :selected").innerHTML;
			var doubtfulPercent = $("input[name='doubtfulPercent']").innerHTML;
	
			if (projectName !== null && projectPlace !== null
					&& doubtfulPercent !== null) {
				$('#next_step').css({
					'background-color' : '#0BBA6B',
					'color' : '#fff'
				});
				return false;
			}
		});
</script>

<script type="text/javascript">
<% String pid =  (String)request.getAttribute("projectId"); %>
	$("#next_step")
	.on(
		"click",
		function() {					
			//alert("123456");
			var doubtfulPercent = $("input[name='doubtfulPercent']").val();			
			var mean_calc = $("select[name='mean_calc'] :selected").val();					 
			if (doubtfulPercent == undefined
					|| doubtfulPercent.trim() == "") {
				alert("疑点百分比不能为空!");
				return false;
			}
			
			if (!/^(([1-9]\d?)|100)$/.test(doubtfulPercent.trim())) {
				alert("疑点百分比为1-100整数!");
				return false;
			}

			if (auditStage == undefined || auditStage.trim() == "") {
				alert("审计阶段不能为空!");
				return false;
			}

			 /* var data = {
				"auditstageInt" :  auditStage.trim(),
				"mean_calc" : mean_calc.trim(),
				"projectAcreage" : projectAcreage.trim()
			}; 
			debugger;
			var proj = $.param(data);
			debugger; 
			window.location.href = "${pageContext.request.contextPath}/front/garden_audit/add_audit_stage2_gp?"
					+ $.param(data); */
			var id = ${project.id};
			window.location.href = "${pageContext.request.contextPath}/front/add_audit_stage2_gp?projectId="
					+ id + "&auditStage=" + auditStage + "&doubtfulPercent=" + doubtfulPercent;	
		});
</script>

<script>
	var auditStage = "";
</script>


<script>
	//弹框点击“知道了”就隐藏 
	function zdl(){
		$("#tank").hide();
	}	
</script>

<script>
	/*
	 *description: switch、select
	 *author: caomingfei
	 *date: 2018.5.28
	 */
	/*切换上下箭头*/
	function swith_arrow(name) {
		$(name).find("i").toggleClass("icon-jiantou-xia");
		$(name).find("i").toggleClass("icon-jiantou-shang");
	};

	/*审计阶段下拉多选框  */
	(function() {
		var $Li = $(".multi_selec_frame li");
		var $audit_part = $("#audit_part");
		var $body = $("body");

		$audit_part.on('click',function(event) {
			$('.multi_selec_frame').toggle();
			event.stopPropagation();
		});
				
		$Li.on('click',function(event) {
			var old_html = $("#audit_part").html();
			var li_html = $(this).find(".iconfont").siblings("span").html();
			//alert(li_html);
			var pid = ${project.id};
			var ico_class = $(this).find(".iconfont").attr('class');
			var i = $(this).index();
			
			$.ajax({
				url:"${pageContext.request.contextPath}/front/haveAuditStage",
				data:{ "projectId": pid, 
					"auditStageName":li_html},
				dataType:"json",
				//type:"POST",
				//traditional:true,
				success: function(data){
					//alert("返回正确");
					if(data.status == "success"){
						   var dd = document.getElementById("es");
		    		       //alert(dd.innerText);
		    		       dd.innerText =li_html+"已审计，再次审计将覆盖之前的审计结果。";
		    		       //alert(dd.innerText);
						   $("#tank").show();
			    		   //alert("您所选择的项目阶段已审计！");
			    		   //document.getElementById("errorMsg").innerHTML = "您所选择的项目阶段已审计！";
		    		    }
		    		    else if(data.status == "noAuditStage"){		    		    	
			    		    //alert("该阶段未审计");
			    		    //document.getElementById("errorMsg").innerHTML = "该阶段未审计";
		    	    	}
	    	    },
	    	    error:function(error){
	    	    	alert("返回错误+4");
	    	    }
			});
			if ( '请选择 '== old_html) {
				$("#audit_part").html('');
				$(this).find(".iconfont").toggleClass("icon-fuxuankuangweixuan");
				$(this).find(".iconfont").toggleClass("icon-fuxuankuangyixuan");
				$audit_part.append('<span class="selec_item" id=SI'+i+'>'
					+ li_html + '<b class="iconfont icon-guanbi"></b>&nbsp;&nbsp;</span>')
			} else if (ico_class === "iconfont icon-fuxuankuangweixuan") {
				$(this).find(".iconfont").toggleClass("icon-fuxuankuangweixuan");
				$(this).find(".iconfont").toggleClass("icon-fuxuankuangyixuan");
				$audit_part.append('<span class="selec_item" id=SI'+i+'>'
					+ li_html + '<b class="iconfont icon-guanbi"></b>&nbsp;&nbsp;</span>')
			} else {
				$(this).find(".iconfont").toggleClass("icon-fuxuankuangyixuan");
				$(this).find(".iconfont").toggleClass("icon-fuxuankuangweixuan");
				$audit_part.find("span").remove("#SI" + i);
			}
			var va = "";
			$audit_part.find("span").each(
				function(index, element) {
					va += $(this).text().trim() + ",";
					
				})
			auditStage = va;			
			event.stopPropagation();
					
		});
		
		$body.click(function(){
			$('.multi_selec_frame').hide();
			$('#audit_part_wrap').find("i").removeClass("icon-jiantou-shang");
			$('#audit_part_wrap').find("i").addClass("icon-jiantou-xia");
		})
	})();
</script>
</html>
