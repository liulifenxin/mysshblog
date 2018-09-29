<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/audit-asset/css/priceQuery.css" />
<script
	src="${pageContext.request.contextPath}/audit-asset/js/jquery-3.2.1.js"></script>
</head>
<body>
	<div id="price_query">
		<!--tree search-->
		<div id="tree_search">
			<!--search-->
			<div id="search">
				<div id="search_box">
					<input type="text" placeholder="请输入关键词" id="search_filed"/>
				</div>
				<div>
					<p>
						<span><a href="javascript:;" id="search">搜索</a></span>
						
					</p>
				</div>
				<div>
					<p id="filter">
						<span>高级筛选</span>
					</p>
				</div>
			</div>

			<!--filter-->
			<div id="advanced_filter">
				<div>
					<p>适应地区</p>
					<c:forEach items="${applicationScope.params['adaptableArea'] }" var="adaptableArea" varStatus="status">
						<label><input type="checkbox" name="adaptableArea" value="${status.index }" />${adaptableArea}</label>		
					</c:forEach>
				</div>
				<div>
					<p>阳光喜好</p>
					<c:forEach items="${applicationScope.params['sunshinePreference'] }" var="sunshinePreference" varStatus="status">
						<label><input type="checkbox" name="sunshinePreference" value="${status.index }" />${sunshinePreference}</label>		
					</c:forEach>
				</div>
				<div>
					<p>温度喜好</p>
					<c:forEach items="${applicationScope.params['temperaturePreference'] }" var="temperaturePreference" varStatus="status">
						<label><input type="checkbox" name="temperaturePreference" value="${status.index }" />${temperaturePreference}</label>		
					</c:forEach>
				</div>
				<div>
					<p>湿度喜好</p>
					<c:forEach items="${applicationScope.params['humidityPreference'] }" var="humidityPreference" varStatus="status">
						<label><input type="checkbox" name="humidityPreference" value="${status.index }" />${humidityPreference}</label>		
					</c:forEach>
				</div>
				<div>
					<p>观赏特征</p>
					<c:forEach items="${applicationScope.params['ornamentalFeatures'] }" var="ornamentalFeatures" varStatus="status">
						<label><input type="checkbox" name="ornamentalFeatures" value="${status.index }" />${ornamentalFeatures}</label>		
					</c:forEach>
				</div>
				<div>
					<p>用途特征</p>
					<c:forEach items="${applicationScope.params['useFeatures'] }" end="11" var="useFeatures" varStatus="status">
						<label><input type="checkbox" name="useFeatures" value="${status.index }" />${useFeatures}</label>		
					</c:forEach>
				</div>				
				
				
			</div>

			<!--search history-->
			<div id="search_history">
				<div>
					<p>历史搜索</p>
					<p>清空</p>
				</div>
				<div>
					<p>银杏</p>
					<p>法国冬青</p>
					<p>龙柏</p>
					<p>白玉兰</p>
					<p>海棠</p>
				</div>
			</div>
		</div>

		<!--常见苗木内容 start-->
		<div id="trees">
			<div id="commom_title">
				<p>
					<span>常见绿化苗木</span>
				</p>
			</div>

			<div id="trees_content">
				<c:forEach var="plant" items="${plants}">
					<div id="trees_intro">
						<div>
							<img
								src="${pageContext.request.contextPath}/audit-asset/img/baiyulan.png" />
						</div>
						<div>
							<p>
								<!-- 白玉兰<span>(木兰、玉兰)</span> -->
								<c:out value="${plant.plantName}" />
								<span>(木兰、玉兰)</span>
							</p>
							<p>
								<span>苗木类型：<c:out value="${plant.type}" /></span> <span>适应地区：<c:out
										value="${plant.adaptAreaStr}" /></span> <span>生态特征：<c:out
										value="${plant.sunshinePrefer}/${plant.humidityPrefer}" /></span> <span>观赏特征：<c:out
										value="${plant.ornamentalFeat}" /></span> <span>用途特征：<c:out
										value="${plant.useFeat}" /></span>
							</p>
							
							
							
							
							<p id="intro">
								<c:out value="${plant.pDesc}/" />
							</p>
						</div>
					</div>
				</c:forEach>




			</div>
		</div>
		<!--常见苗木内容 end-->
		<div id="check_all">
			<p>
				<a href="price_info.html">查看所有苗木 >>></a>
			</p>
		</div>


	</div>
	<script>
		(function() {
			var $filter = $('#filter');
			var $advanced_filter = $('#advanced_filter');

			$filter.click(function() {
				if ($advanced_filter.css('display') == 'none') {

					$advanced_filter.show()
				} else {
					$advanced_filter.hide()
				}
			})
		})();
	</script>
 <script type="text/javascript">
						

						
</script>
</body>
</html>
