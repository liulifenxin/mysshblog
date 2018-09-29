<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/audit-asset/css/priceQuery.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/audit-asset/css/iconfont/iconfont.css" />
<script
	src="${pageContext.request.contextPath }/audit-asset/js/jquery-3.2.1.js"></script>
<script
	 src="${pageContext.request.contextPath }/audit-asset/css/iconfont/iconfont.js"></script>
<style>
a {
	text-decoration: none;
}

input::-webkit-input-placeholder{
		color:#c5c5c5;
		font-size:14px;
}
</style>

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
	<div id="price_query">
		<!--tree search-->
		<div id="tree_search">
			<!--search-->
			<div id="search" style="font-size: 16px;">
				<div id="search_box">
					<span class="iconfont icon-sousuo" style="text-indent: 0; color:#CED0DA;"></span>
					<input type="text" id="searchInput" name="search" placeholder="请输入，多个关键词用逗号隔开"/>
				</div>
				<div>
					<p class="searchBtn_wrap">
						<span style="color: #fff;" id="searchBtn">搜索</span>
					</p>
				</div>
				<div>
					<p id="filter"><span style="font-size: 15px; padding-right: 5px;">高级搜索</span><span class="span_2 iconfont icon-jiantou-xia " style="font-size: 12px;"></span></p>
				</div>
			</div>

			<!--filter-->
			<div id="advanced_filter">
				<form id="search_condition">
				
					<div>
						<p>适应地区:</p>
						<c:forEach items="${applicationScope.params['adaptableArea'] }"
							var="adaptableArea" varStatus="status">
							<label><input type="checkbox" name="adaptableArea"
							value="${adaptableArea}"	<%-- value="${status.index }" --%> />${adaptableArea}</label>
						</c:forEach>
					</div>
					<div>
						<p>阳光喜好:</p>
						<c:forEach
							items="${applicationScope.params['sunshinePreference'] }"
							var="sunshinePreference" varStatus="status">
							<label><input type="checkbox" name="sunshinePrefer"
							value="${sunshinePreference}"	<%-- value="${status.index }" --%> />${sunshinePreference}</label>
						</c:forEach>
					</div>
					<div>
						<p>温度喜好:</p>
						<c:forEach
							items="${applicationScope.params['temperaturePreference'] }"
							var="temperaturePreference" varStatus="status">
							<label><input type="checkbox" name="temperaturePrefer"
						value="${temperaturePreference}" <%-- value="${status.index }" --%> />${temperaturePreference}</label>
						</c:forEach>
					</div>
					<div>
						<p>湿度喜好:</p>
						<c:forEach
							items="${applicationScope.params['humidityPreference'] }"
							var="humidityPreference" varStatus="status">
							<label><input type="checkbox" name="humidityPrefer"
							value="${humidityPreference}"	<%-- value="${status.index }" --%> />${humidityPreference}</label>
						</c:forEach>
					</div>
					<div>
						<p>土壤喜好:</p>
						<c:forEach
							items="${applicationScope.params['soilPreference'] }"
							var="soilPreference" varStatus="status">
							<label><input type="checkbox" name="soilLike"
							value="${soilPreference}"	<%-- value="${status.index }" --%> />${soilPreference}</label>
						</c:forEach>
					</div>
					<div>
						<p>观赏特征:</p>
						<c:forEach
							items="${applicationScope.params['ornamentalFeatures'] }"
							var="ornamentalFeatures" varStatus="status">
							<label><input type="checkbox" name="ornamentalFeat"
							value="${ornamentalFeatures}"	<%-- value="${status.index }" --%> />${ornamentalFeatures}</label>
						</c:forEach>
					</div>
					<div>
						<p>用途特征:</p>
						<c:forEach items="${applicationScope.params['useFeatures'] }"
							end="25" var="useFeatures" varStatus="status">
							<label><input type="checkbox" name="useFeat"
							value="${useFeatures}"	<%-- value="${status.index }" --%> />${useFeatures}</label>
						</c:forEach>
					</div>
					
					
				</form>

			</div>

			<!--search history-->
			<div id="search_history">
				<div>
					<p id="history_searchDIV_P1" style="display:none">历史搜索</p>
					<p id="history_searchDIV_P2"  style="cursor: pointer;">清空</p>
				</div>

				<div  class="search_history_l">
					<c:forEach items="${sessionScope.searchHistory }"
						var="searchHistory">
						<p>${searchHistory }</p>
					</c:forEach>
				</div>
			</div>
		</div>

		<!--常见苗木内容 start-->
		<div id="trees">
			<div id="commom_title">
				<p>
				<svg class="icon" aria-hidden="true">
  					<use xlink:href="#icon-qiaomu"></use>
				</svg>
					<span>常见绿化苗木</span>
				</p>
			</div>

			<div id="trees_content">
				<c:forEach var="plant" items="${plants}">
					<div id="trees_intro">
						<div>
							<!-- 
							<img
								src="${pageContext.request.contextPath}/audit-asset/img/baiyulan.png" /> -->
							<img src="${pageContext.request.contextPath}${plant.photo}" />
						</div>
						<div>
							<p>
								<!-- 白玉兰<span>(木兰、玉兰)</span> -->
								${plant.plantName} <span>(${plant.aliasName})</span>
							</p>
							<p>
								<span>苗木类型：${plant.type}</span> 
								<span>适应地区： ${plant.adaptableArea}</span>
								<span>生态特征： ${plant.sunshinePrefer}/${plant.humidityPrefer}/${plant.soilLike}</span>
							    <span>观赏特征：${plant.ornamentalFeat }</span>
								<span>用途特征：${plant.useFeat}</span>
							</p>
							
							
							<p id="intro">${plant.pDesc}/</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<!--常见苗木内容 end-->
		<div id="check_all">
			<p>
				<a href="${pageContext.request.contextPath}/front/price/queryAll">查看所有苗木>>></a>
			</p>
		</div>


	</div>
	<script>
	(function(){
		var $filter=$('#filter');
		var $advanced_filter=$('#advanced_filter');
			
			$filter.click(function(){
			if($advanced_filter.css('display')=='none'){
				
				$advanced_filter.show()
			}
			else{
				$advanced_filter.hide()
			}
	})
	})();
</script>
<script type="text/javascript">

	/*点击搜索实现搜索功能*/
	
	$(".searchBtn_wrap").on("click",function(){
		var search = $("input[name='search']").val();
		var search_condition = $("#search_condition").serialize();
		var search_data= decodeURIComponent(search_condition,true);
		
		/* window.location.href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?search="+search; */
		window.location.href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?search="+search+"&"+search_data; 
	});
	
	/*点击回车实现搜索功能*/
	$("#searchInput").bind('keypress',function(event){
		if(event.keyCode == "13"){
			var search = $("input[name='search']").val();
			var search_condition = $("#search_condition").serialize();
			var search_data= decodeURIComponent(search_condition,true);
			
			/* window.location.href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?search="+search; */
			window.location.href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?search="+search+"&"+search_data; 
		}
	});
	
	//退出收藏夹，失败
	/* function exitList2() {
		 //var userID = ${sessionScope.toBackSearch};
		 alert("123");
		 //alert(userID);
		//var search= "";
		 //alert(search);
		 //frame.window.location.href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?search=${search}";
		 //window.top.location.href="${pageContext.request.contextPath }/export/plantData?ids="+ids;
		 //var $s_c_cover = $("#s_c_cover");
		 //$s_c_cover.css("display","none");
		 //frame.exitList2();
	} */
	
	
</script>
<script type="text/javascript">
			$(function(){
				
				var his =${fn:length(searchHistory)}
				
				if(his>0){
					$("#history_searchDIV_P1").show();
					$("#history_searchDIV_P2").show();
				}else{
					$("#history_searchDIV_P1").hide();
					$("#history_searchDIV_P2").hide();
				}
			});
			
			/*点击高级搜索切换图标*/
			(function(){
				var $filter = $("#filter");
			 	var $span_2 = $("#search .span_2");
			 	$filter.click(function(){
			 		$span_2.toggleClass('icon-jiantou-xia');
			 		$span_2.toggleClass('icon-jiantou-shang')
			 	})
			})();
					
			/*input输入的时候字体颜色为#222*/
			(function(){
				var $s_input = $("#search input");
				$s_input.focus(function(){
					$(this).css("color","#222")
				})
			})();
			
			
</script>
	<script type="text/javascript">
	
	/*清除历史记录 */
	$("#history_searchDIV_P2").click(function(){

		var $history = $(".search_history_l");

		$history.html('');
		$("#search_history p").hide();

		
	});	
	</script>

</body>
</html>
