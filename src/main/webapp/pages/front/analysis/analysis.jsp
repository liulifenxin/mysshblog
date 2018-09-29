<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/audit-asset/css/analysis.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/audit-asset/css/iconfont/iconfont.css"/>
		
		<title>统计分析</title>
	</head>
	<body>
	<!--趋势图形-->
		<div id="name_1">
	    <div>
	    	<img src="${pageContext.request.contextPath}/audit-asset/img/ss.png" style="position:relative;left:106px;top:53px;"/>
	    </div>
		<div id="content_1"></div>
		</div>
	
	<!--柱状图-->
		<div id="year">
			<div>
				<img src="${pageContext.request.contextPath}/audit-asset/img/ss.png" style="position: relative;left: 145px;top:74px;"/>
			</div>
			<div id="shown"></div>
	<!--搜素榜-->		
		</div>
		<div id="search">
			<div id="frame_head">
			<img src="${pageContext.request.contextPath}/audit-asset/img/ss.png" />
			<p class="name" style="color: #000000;">本周搜索榜</p>		
			</div>
			<div class="frame_1">
				<p><img src="${pageContext.request.contextPath}/audit-asset/img/one.png" style="position: relative;top: 8px;left:-9px;"/><span  style="font-size: 14px;color: #000000;position:relative;left:-8px;">01.紫薇</span><span style="float:right;position:relative;top:15px;">7834次</span></p>
				<p><img src="${pageContext.request.contextPath}/audit-asset/img/two.png" style="position: relative;left: -5px;top: 5px;"/> <span style="font-size: 14px;color: #000000;position: relative;left: -10px;"> 02.红枫</span><span style="float:right;position:relative;top:6px;">6437次</span></p>
				<p><img src="${pageContext.request.contextPath}/audit-asset/img/two.png"/ style="position: relative;top:4px;left:-5px;"> <span style="font-size: 14px;color: #000000;position: relative;left: -10px;"> 03.朴树</span><span style="float:right;position:relative;top:2px;">6121次</span></p>
				<p>04.银杏<span style="float:right;">5634次<span></p>
				<p>05.法桐<span style="float:right;">4232次<span></p>
				<p>06.樱花<span style="float:right;">4089次<span></p>
				<p>07.红叶石楠<span style="float:right;">3998次<span></p>
				<p>08.雪松<span style="float:right;">2345次<span></p>
				<p>09.红叶石楠球<span style="float:right;">2112次<span></p>
				<p>10.广玉兰<span style="float:right;">2090次<span></p>
			</div>
		
		</div>
		
	<script type="text/javascript" src="${pageContext.request.contextPath}/audit-asset/js/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/audit-asset//js/echarts.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/audit-asset/js/analysis.js"></script>
	</body>

</html>
