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
						<span class="red_star">*</span>项目名称<input type="text"
							name="projectName" oninput="haveProjectName()" id="projectName" value="" placeholder="请输入" /> 
							<!-- oninput可能存在浏览器兼容性问题 -->
					</p>
					
					<p class="project_date">
						<span class="red_star">*</span>项目日期 <span class="date_wrap">
							<input type="text" name="startDate" id="date" lay-verify="date"
							placeholder="开始日期" autocomplete="off" class="layui-input">
							至<input type="text" name="endDate" id="date2" lay-verify="date"
							placeholder="结束日期" autocomplete="off" class="layui-input"><span
							class="iconfont icon-riqi"></span>
						</span>
					</p>
					<!-- 项目占地面积 -->
					<p style="position:relative;">
						<span class="red_star">*</span>项目占地面积<input type="text"

							name="projectAcreage" id="projectAcreage" value="" placeholder="请输入" style="margin-left:20px;width:360px;" />
						<i style="position:absolute;right:4px;top:6px;">㎡</i>
					</p>
					<p>
						<span class="red_star">*</span>项目所在地<input type="hidden"
							name="projectPlace" id="projectPlace" value="四川省-成都市-锦江区" placeholder="请输入" />
					</p>

					<!-- 地区选择器 start -->
					<div class="form-inline clear"
						style="position: absolute; top: 235px; right: 1px;border:1px solid #d8d8d8;height:30px;line-height:30px;width:360px;">
						<div data-toggle="distpicker" class="clear areapick">
							<div class="form-group fl">
								<label class="sr-only" for="province2"></label> <select
									class="form-control" id="province2" style="width: 135px;  border: none;"
									data-province="四川省"></select>
							</div>
							<div class="form-group fl">
								<label class="sr-only" for="city2"></label> <select
									class="form-control" id="city2" style="width: 110px; border: none;" data-city="成都市"></select>
							</div>
							<div class="form-group fl">
								<label class="sr-only" for="district2"></label> <select
									class="form-control" id="district2" style="width: 112px; border: none;"
									data-district="锦江区"></select>
							</div>
						</div>
					</div>
										
					<!-- 地区选择器 end -->


					<div class="habits clear">
						<p>项目地区生态特征</p>
						<p id="temperature_wrap">
							<span class="red_star">*</span><span>阳光特征</span>
							<%-- <select name="temperature">
									<c:forEach items="${applicationScope.params['temperaturePreference'] }" var="temperaturePreference" varStatus="status">
										<option value="${status.index }">${temperaturePreference}</option>
									</c:forEach>
								</select> --%>
							<select name="sunshine" id="sunshine"
								onclick="swith_arrow('#temperature_wrap')">
								<option value="">请选择</option>
								<option value="s1">阳性</option>
								<option value="s2">中性</option>
								<option value="s3">阴性</option>

							</select> <i class="iconfont icon-jiantou-xia"></i>
						</p>
						<p id="humidity_wrap">
							<span class="red_star">*</span><span>气温特征</span>
							<%-- <select name="humidity">
									<c:forEach items="${applicationScope.params['humidityPreference'] }" var="humidityPreference" varStatus="status">
										<option value="${status.index }">${humidityPreference}</option>
									</c:forEach>
								</select> --%>
							<select name="temperature" id="temperature"
								onclick="swith_arrow('#humidity_wrap')">
								<option value="">请选择</option>
								<option value="t1">炎热</option>
								<option value="t2">温暖</option>
								<option value="t3">寒冷</option>
							</select> <i class="iconfont icon-jiantou-xia"></i>
						</p>
						<p id="soil_wrap">
							<span class="red_star">*</span><span>湿度特征</span>
							<%-- <select name="soil">
									<c:forEach items="${applicationScope.params['soilPreference'] }" var="soilPreference" varStatus="status">
										<option value="${status.index }">${soilPreference}</option>
									</c:forEach>
								</select> --%>
							<select name="humidity" id="humidity"
								onclick="swith_arrow('#soil_wrap')">
								<option value="">请选择</option>
								<option value="h1">多雨</option>
								<option value="h2">湿润</option>
								<option value="h3">干旱</option>
								
							</select> <i class="iconfont icon-jiantou-xia"></i>
						</p>
					</div>
				</div>

				<!--审计设置  -->
				<div id="audit_set" class="fl">
				<div class="div-box" >
					<h3>审计设置</h3>
					<p id="audit_part_wrap" >
						<span class="red_star" style="position: relative; top: -10px;">*</span><span
							style="position: relative; top: -10px;">审计阶段</span> <span
							id="audit_part" onclick="swith_arrow('#audit_part_wrap')">
							请选择 </span> <i class="iconfont icon-jiantou-xia"></i>
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
			
		<!-- 			<p id="S_m_wrap">
						<span class="red_star">*</span><span>规格匹配</span> <select
							name="spec_matching" id="spec_matching"
							onclick="swith_arrow('#S_m_wrap')">
							<option value="1">高值匹配</option>
							<option value="2">低值匹配</option>
						</select> <span class="introduce">说明：项目苗木规格与系统规格不一致时，采用此方式匹配</span> <i
							class="iconfont icon-jiantou-xia"></i>
					</p>
		 -->	
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/audit-asset/js/jquery-3.2.1.js"></script>

<script
	src="${pageContext.request.contextPath}/audit-asset/js/distpicker.data.js"></script>
<script
	src="${pageContext.request.contextPath}/audit-asset/js/distpicker.js"></script>

<script>
	$("#percent")
			.keyup(
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
	function haveProjectName(){
		sss = 0;
		var projectName = $("#projectName").val();
		if(projectName.trim() == ""){
/* 			alert("请输入项目名称！") */
			document.getElementById("errorMsg").innerHTML = "请输入项目名称！";
    		$("#projectName").focus();
		}else{
			$.ajax({
				url:"${pageContext.request.contextPath}/front/garden_audit/getProject",
				data:{"projectName":projectName},
				dataType:"json",
		    	success: function(data){
		    			//debugger;
		    		if(data.status == "success"){
			    		/* alert("您所创建的项目名已存在！"); */
			    		document.getElementById("errorMsg").innerHTML = "您所创建的项目名已存在！";
			    		$("#projectName").focus();
			    		sss = 1;
		    		}else if(data.status == "noProject"){
			    		/* alert("您所创建的项目名已存在！"); */
			    		document.getElementById("errorMsg").innerHTML = "";
			    		/* $("#projectName").focus(); */
		    		}
		    		
		    	},
		    	error:function(error){
		    		
		    	}
			})
		}
	}
</script>

<script type="text/javascript">
	$("#next_step")
			.on(
					"click",
					function() {
						/* projectAcreage */
						var projectName = $("input[name='projectName']").val();
						var projectPlace = $("input[name='projectPlace']")
								.val();
						var startDate = $("input[name='startDate']").val();
						var endDate = $("input[name='endDate']").val();
						var doubtfulPercent = $("input[name='doubtfulPercent']")
								.val();
						var temperature = $(
								"select[name='temperature'] :selected").val();
						var humidity = $("select[name='humidity'] :selected")
								.val();
						var soil = $("select[name='soil'] :selected").val();
						var sunshine = $("select[name='sunshine'] :selected")
								.val();
						/* var spec_matching = $(
								"select[name='spec_matching'] :selected").val(); */
						var mean_calc = $("select[name='mean_calc'] :selected")
								.val();

						var projectAcreage = $("input[name='projectAcreage']").val();
						if(sss==1){
							alert("项目已存在");
							return false;
						}

						if (projectName == undefined
								|| projectName.trim() == "") {
							alert("项目名称不能为空!");
							return false;
						}
						
						 if (projectAcreage == undefined
								|| projectAcreage.trim() == "") {
							alert("项目占地面积不能为空!");
							return false;
						} 

						if (startDate == undefined || startDate.trim() == "") {
							alert("开始时间不能为空!");
							return false;
						}

						if (endDate == undefined || endDate.trim() == "") {
							alert("结束时间不能为空!");
							return false;
						}
/*************************** LuoJiang 判断开始时间必须小于结束时间start  *****************************************/
						var beginTime = startDate;
					    var endTime = endDate;
					    //debugger;
					    var a = (Date.parse(endTime) - Date.parse(beginTime)) / 3600 / 1000;
					    if (a < 0) {
					        alert("项目的开始时间不能大于结束时间!");
					        return false;
					    }
/*************************** LuoJiang 判断开始时间必须小于结束时间end   *****************************************/
						
						if (doubtfulPercent == undefined
								|| doubtfulPercent.trim() == "") {
							alert("疑点百分比不能为空!");
							return false;
						}
						if (!/^(([1-9]\d?)|100)$/.test(doubtfulPercent.trim())) {
							alert("疑点百分比为1-100整数!");
							return false;
						}

						if (temperature == undefined
								|| temperature.trim() == "") {
							alert("温度选项不能为空!");
							return false;
						}

						if (humidity == undefined || humidity.trim() == "") {
							alert("湿度选项不能为空!");
							return false;
						}

						if (sunshine == undefined || sunshine.trim() == "") {
							alert("阳光选项不能为空!");
							return false;
						}
						if (auditStage == undefined || auditStage.trim() == "") {
							alert("审计阶段不能为空!");
							return false;
						}

						var pro = $("#province2 option:selected").val();
						var city = $("#city2 option:selected").val();
						var dis = $("#district2 option:selected").val();
						debugger;
						 var data = {
							"projectName" : projectName.trim(),
							//"projectPlace" : projectPlace.trim(), 
							"projectPlace" :pro+city+dis,
							"city" : city,
							"startDate" : startDate.trim(),
							"endDate" : endDate.trim(),
							"doubtfulPercent" : doubtfulPercent.trim(),
							"temperature" : temperature.trim(),
							"humidity" : humidity.trim(),
							"auditstageInt" :  auditStage.trim(),
							"sunshine" : sunshine.trim(),
							//"spec_matching" : spec_matching,
							"mean_calc" : mean_calc.trim(),
							"projectAcreage" : projectAcreage.trim()

						}; 
						debugger;
						var proj = $.param(data);
						debugger; 
						window.location.href = "${pageContext.request.contextPath}/front/garden_audit/add_audit_2_sf_gp?"
								+ $.param(data);
					});
	
	
	 
	
	
	</script>

<script>
	var auditStage = "";
	layui.use([ 'form', 'laydate' ], function() {
		var form = layui.form;
		var laydate = layui.laydate;

		//日期
		laydate.render({
			elem : '#date'
		});
		laydate.render({
			elem : '#date2'
		});

	});
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
			$('.multi_selec_frame').toggle()
			event.stopPropagation();
		});


		$Li.on('click',function(event) {


							var old_html = $("#audit_part").html();
						//	alert(old_html);

							var li_html = $(this).find(".iconfont").siblings(
									"span").html();
							var ico_class = $(this).find(".iconfont").attr(
									'class');
							var i = $(this).index();

							//					alert(ico_class)

							if ( '请选择 '== old_html) {

								$("#audit_part").html('');
								$(this).find(".iconfont").toggleClass(
										"icon-fuxuankuangweixuan");
								$(this).find(".iconfont").toggleClass(
										"icon-fuxuankuangyixuan");
								$audit_part.append('<span class="selec_item" id=SI'+i+'>'
												+ li_html
												+ '<b class="iconfont icon-guanbi"></b>&nbsp;&nbsp;</span>')
							} else if (ico_class === "iconfont icon-fuxuankuangweixuan") {
								$(this).find(".iconfont").toggleClass(
										"icon-fuxuankuangweixuan");
								$(this).find(".iconfont").toggleClass(
										"icon-fuxuankuangyixuan");
								$audit_part
										.append('<span class="selec_item" id=SI'+i+'>'
												+ li_html
												+ '<b class="iconfont icon-guanbi"></b>&nbsp;&nbsp;</span>')
							} else {
								$(this).find(".iconfont").toggleClass(
										"icon-fuxuankuangyixuan");
								$(this).find(".iconfont").toggleClass(
										"icon-fuxuankuangweixuan");
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
<script type="text/javascript">

	/**
	  *  create:LuoJiang
	  *  desc:异步获取每个地区的生态特征：阳光、温度、湿度
	  */
    $(function(){
    	//默认地区四川省成都市锦江区
    	var address = $("#projectPlace").val();
    	//debugger;
    	//alert(address);
    	$.ajax({
	    	 url: "${pageContext.request.contextPath}/front/garden_audit/getEcologicalFeatures",
	    	 data: {"address":address},
	    	 dataType:"json",
	    	 success: function(data){
	    		 debugger;
	    		 $("#sunshine").val(data.sunshineFeatures);
	    		 $("#temperature").val(data.temperatureFeatures);
	    		 $("#humidity").val(data.humidityFeatures);
	    	 },
	    	 error:function(error){
	    		 debugger;
	    		alert("数据库暂无该地区生态特征"); 
	    		 $("#sunshine").val("");
	    		 $("#temperature").val("");
	    		 $("#humidity").val("");
	    	 }
	     });
    	
    	
    	
	     /* $('.areapick').distpicker(); */
		 //将选择的值传递到对应的input中，然后异步请求该地区的生态特征
	     $('.areapick select').change(function(event) {
		    /*  $('.hideinputbox input').eq($(this).index()).val($(this).val());
		      console.log($('.hideinputbox input').eq($(this).index()).val()); */
		     var province2 = $("#province2").val();
		     var city2 = $("#city2").val();
		     var district2 = $("#district2").val();
		     var address = province2 +"-"+ city2 +"-"+ district2;
		     //alert(address);
		     $("#projectPlace").val(address);
		     $.ajax({
		    	 url: "${pageContext.request.contextPath}/front/garden_audit/getEcologicalFeatures",
		    	 data: {"address":address},
		    	 dataType:"json",
		    	 success: function(data){
		    		 //debugger;
		    		 $("#sunshine").val(data.sunshineFeatures);
		    		 $("#temperature").val(data.temperatureFeatures);
		    		 $("#humidity").val(data.humidityFeatures);
		    	 },
		    	 error:function(error){
		    		 debugger;
		    		alert("数据库暂无该地区生态特征"); 
		    		 $("#sunshine").val("");
		    		 $("#temperature").val("");
		    		 $("#humidity").val("");
		    	 }
		     });
	     });
    });
</script>
<!-- <script type="text/javascript">
	//判断创建的项目是否与已创建的项目同名
	var list = '${hadProjectList }';
	debugger;
	if(list){
		document.getElementById("errorMsg").innerHTML = "您所创建的项目名已存在！";
		$("#projectName").focus();
	}
</script> -->
</html>
