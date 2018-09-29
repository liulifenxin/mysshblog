<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/audit-asset/css/priceQuery.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/audit-asset/css/iconfont/iconfont.css" />
	<script
	 src="${pageContext.request.contextPath }/audit-asset/css/iconfont/iconfont.js"></script>
	 
	 <style type="text/css">
	.icon {
   		width: 1em; height: 1em;
  	 	vertical-align: -0.15em;
   		fill: currentColor;
   		overflow: hidden;
		}
</style>
</head>
<body>
	<div id="query_all" style="padding-bottom: 100px;">
				<!--价格信息头部 start-->
		<div id="queryAll_header">
			<p>
				<span>苗木价格查询</span>
				<span>|</span>
				<span>所有苗木</span>
			</p>
		</div>
		<!--价格信息头部 end-->	
		
		<!--苗木类别-->
		<c:forEach  var="entry" items="${map}" begin="0" end="${fn:length(map)}" varStatus="status">
			<div id="tree_category">
				<h3><svg class="icon" aria-hidden="true">
  					<use xlink:href="#icon-qiaomu"></use>
				</svg><span>${entry.key }</span></h3>
				<p>
					<c:forEach items="${entry.value}" var="plant">
						<a	href="${pageContext.request.contextPath }/front/price/priceInfo?plantId=${plant.plantId}" style="color:#0033FF;">${plant.plantName }</a>
					</c:forEach>
				</p>
			</div>
		
		</c:forEach>
		
		<!-- 
		
			<div id="tree_category">
				<h3><svg class="icon" aria-hidden="true">
  					<use xlink:href="#icon-qiaomu"></use>
				</svg><span>乔木</span></h3>
				<p>
					<a>银杏</a>
					<a>金桂</a>
					<a>银桂</a>
					<a>月桂</a>
					<a>紫薇</a>
					<a>樱花</a>
					<a>香樟</a>
					<a>黑壳楠</a>
					<a>栾树</a>
					<a>朴树</a>
					<a>红枫</a>
					<a>四季杨</a>
					<a>银杏</a>
					<a>金桂</a>
				</p>
			</div>
			
					苗木类别
			<div id="tree_category">
				<h3><svg class="icon" aria-hidden="true">
  					<use xlink:href="#icon-qiaomu"></use>
				</svg>
				<sapn>藤本</sapn></h3>
				<p>
					<a>银杏</a>
					<a>金桂</a>
					<a>银桂</a>
					<a>月桂</a>
					<a>紫薇</a>
					<a>樱花</a>
					<a>香樟</a>
					<a>黑壳楠</a>
					<a>栾树</a>
					<a>朴树</a>
					<a>红枫</a>
					<a>四季杨</a>
					<a>银杏</a>
					<a>金桂</a>
				</p>
			</div>
			
			苗木类别
			<div id="tree_category">
				<h3><svg class="icon" aria-hidden="true">
  					<use xlink:href="#icon-qiaomu"></use>
				</svg><span>灌木</span></h3>
				<p>
					<a>银杏</a>
					<a>金桂</a>
					<a>银桂</a>
					<a>月桂</a>
					<a>紫薇</a>
					<a>樱花</a>
					<a>香樟</a>
					<a>黑壳楠</a>
					<a>栾树</a>
					<a>朴树</a>
					<a>红枫</a>
					<a>四季杨</a>
					<a>银杏</a>
					<a>金桂</a>
				</p>
			</div>
			
			苗木类别
			<div id="tree_category">
				<h3><svg class="icon" aria-hidden="true">
  					<use xlink:href="#icon-qiaomu"></use>
				</svg><span>竹类</span></h3>
				<p>
					<a>银杏</a>
					<a>金桂</a>
					<a>银桂</a>
					<a>月桂</a>
					<a>紫薇</a>
					<a>樱花</a>
					<a>香樟</a>
					<a>黑壳楠</a>
					<a>栾树</a>
					<a>朴树</a>
					<a>红枫</a>
					<a>四季杨</a>
					<a>银杏</a>
					<a>金桂</a>
				</p>
			</div> -->
			
	</div>
	
</body>
</html>
