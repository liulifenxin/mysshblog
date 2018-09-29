<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/audit-asset/css/iconfont/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/audit-asset/css/index.css">
		<link rel="stylesheet" type="text/css" href="//at.alicdn.com/t/font_652554_flec2w9p7ousor.css">
		<script type="text/javascript" src="<%=request.getContextPath() %>/audit-asset/js/jquery-3.2.1.js"></script>
		<title>index</title>
	</head>
	<body>
		<div id="header_nav" style="width:100%;background-color: #1D2D4D;">
		<div id="menu">
			<div class="one">
				<div class="iconfont icon-logo" style="font-size:32px;opacity:0.6;float:left;cursor:pointer;"><span style="font-family: MicrosoftYaHei-Bold;font-size: 14px;letter-spacing: 1.17px;position:relative;top:-7px;margin-left:5px;">成都市温江苗木审计平台</span></div>
			</div>
			<div class="two">
				<ul>
					<li>苗木价格查询</li>
					<li>园林审计</li>
					<li>苗木信息录入</li>
					<li>园林设计支撑</li>
					<li style="color:#0BBA6B;opacity: 1;">统计分析</li>
				</ul>
				<div class="underline">
					<i></i>
					<i></i>
					<i style="background-color:#0BBA6B"></i>
					<i></i>
					<i></i>
				</div>
			</div>
			<div class="three">
				<div class="headPortrait">
					<img src="${pageContext.request.contextPath}/audit-asset/img/touxiang.png" style="width:36px;height:36px">
					<span class="iconfont icon-sanjiao-xia"></span>
					<div id="exit" style="cursor: pointer;" ><span class="iconfont "></span>退出登录</div>
				</div>
			</div>
		</div>
		</div>

			<iframe src="<%=request.getContextPath() %>/front/analysis/index" frameborder="0" scrolling="no" id="frame" name="frame" style="width:100%;height:100%;"></iframe>

		<script type="text/javascript">
			var url = "${pageContext.request.contextPath}";
		</script>
		
		<script type="text/javascript">
			$("#exit").click(function(){
				window.location.href = "${pageContext.request.contextPath }/logout";
			});
			
			/*点击logo回到首页*/
		  	$(".one").click(function(){
		  		window.top.location.href="${pageContext.request.contextPath }/front";
		  	});
		</script>
		
		
		<script src="${pageContext.request.contextPath}/audit-asset/js/index.js"></script>
		<!--<script>
			function iframe1(){
				var $frame = $("#frame");
				frame.location.href = 'treePrice/priceQueryResult.html';
			}
		</script>-->
	</body>
</html>
