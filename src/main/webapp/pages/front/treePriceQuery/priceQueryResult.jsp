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
	href="${pageContext.request.contextPath }/audit-asset/css/iconfont/iconfont.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/audit-asset/css/priceQuery.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/audit-asset/js/jquery-3.2.1.js"></script>
</head>
<body onload="IFrameResize()">
	<div id="query_result">

		<!--查询结果  start-->
		<div id="result_header"
			style="width: 1170px; height: 46px; border-bottom: 1px solid #eee;">
			<p>
				<span><a
					href="${pageContext.request.contextPath }/front/price/toPriceQuery"
					style="color: #555;'">苗木价格查询</a></span> <span>|</span> <span>查询结果</span>
			</p>
		</div>
		<!--查询结果  end-->

		<div id="query_category">
			<p>
				<span>${search }</span> <span>${page.records }条结果</span>
			</p>
		</div>

		<!--选择下拉框 start-->
		<div id="result_choice">
			<form id="query_condition_form">
				<ul class="clear"
					style="width: 1170px; height: 40px; line-height: 40px; background-color: #F5F8FA; border: 1px solid #E6EAEE;">
					<li><span>苗木类型:</span> <select name="type">
							<option selected value="全部">全部</option>
							<c:forEach
								items="${applicationScope.params['seedlingCategory'] }"
								var="seedlingCategory" varStatus="status">
								<option value="${seedlingCategory}">${seedlingCategory }</option>
							</c:forEach>
					</select></li>

					<li>适应地区: <select name="adaptableArea">
							<option selected value="全部">全部</option>
							<c:forEach items="${applicationScope.params['adaptableArea'] }"
								var="adaptableArea" varStatus="status">
								<option value="${adaptableArea }">${adaptableArea }</option>
							</c:forEach>
					</select>
					</li>

					<li>观赏特征: <select name="ornamentalFeat">
							<option selected value="全部">全部</option>
							<c:forEach
								items="${applicationScope.params['ornamentalFeatures'] }"
								var="ornamentalFeatures" varStatus="status">
								<option value="${ornamentalFeatures }">${ornamentalFeatures }</option>
							</c:forEach>
					</select>
					</li>

					<li>用途特征: <select name="useFeat">
							<option selected value="全部">全部</option>
							<c:forEach items="${applicationScope.params['useFeatures'] }"
								var="useFeatures" varStatus="status">
								<option value="${useFeatures }">${useFeatures }</option>
							</c:forEach>
					</select>
					</li>
				</ul>
			</form>
		</div>
		<!--选择下拉框 end-->

		<!--全选 start-->
		<div id="all_selection" class="clear">
			<div class="fl">
				<span class="iconfont icon-gouwuche">&nbsp;</span><span>全选加入收藏夹</span>
			</div>
			<div class="fl">
				<span class="iconfont icon-xiazai">&nbsp;</span><span>全选导出本页</span>
			</div>
		</div>
		<!--全选end-->

		<!--查询结果内容 start-->
		<div id="result_content">

			<c:forEach items="${page.rows }" var="plant">
				<div id="result_intro" class="clear">
					<a
						href="${pageContext.request.contextPath }/front/price/priceInfo?plantId=${plant.plantId}">
						<div>
							<img src="${pageContext.request.contextPath}${plant.photo}" />
							<!-- <img src="${pageContext.request.contextPath }/audit-asset/img/baiyulan.png" /> -->
						</div>
						<div>
							<p>${plant.plantName }<span>(${plant.aliasName })</span>
							</p>
							<p>
								<span>苗木类型：${plant.type }</span> <span>适应地区： <%-- ${plant.adaptableArea } --%>
									华南、华北
								</span> <span>生态特征：
									${plant.sunshinePrefer}/${plant.humidityPrefer} </span> <span>观赏特征：${plant.ornamentalFeat }</span>
								<span>用途特征：${plant.useFeat }</span>
							</p>
							<p>
								<span>胸径：<c:if test="${fn:length(plant.seedFormats) > 0}">${plant.seedFormats[0].spec }</c:if></span>
								<span>产地：成都</span> <span>价格：<c:if
										test="${fn:length(plant.seedFormats) > 0 && fn:length(plant.seedFormats[0].priceInfos) > 0 }">${plant.seedFormats[0].priceInfos[0].price }</c:if>
									/ <c:if test="${fn:length(plant.seedFormats) > 0}">${plant.seedFormats[0].unitTypeString }</c:if></span>
								<span style="color: #1A89E8;">查看完整价格>>></span>
							</p>
						</div>
						<div class="cart">
							<span class="fl iconfont icon-gouwuche"></span>
							<span class=" fr iconfont icon-xiazai" style></span>
						</div>
					</a>
				</div>
			</c:forEach>

		</div>
		<!--查询结果内容 end-->

		<!--paging start-->
		<div id="pages" class="clear" style="margin-top: 8px;">
			<div class="pages_total fl">
				总计：<span class="span_1">${page.records}</span>条 / <span
					class="span_2">${page.total}</span>页
			</div>
			<div class="paging fl">
				<!--翻页分页按钮-->
				<!--翻页分页按钮-->
				<%-- 					<c:if test="${page.page ne 1 && page.page ne 0}">
						<span class="lt"><a href="<%=request.getContextPath() %>/front/price/toPriceQueryResult?page=1&search="+${search}>&lt;</a></span>
						<span><a href="#"  class="lt">&lt;</a></span>
					</c:if>
					
					<c:forEach begin="1" end="${page.total }" varStatus="status" var="p">
						<c:if test="${page.page eq status.index}">
								<span class="current">${page.page}</span>
						</c:if>
						<c:if test="${page.page ne status.index }">
							<span><a href="<%=request.getContextPath() %>/front/price/toPriceQueryResult?page=${p}&search=${search}" id="page">${p} </a></span>
							<span><a href="#" class="p">${p}</a></span>
						</c:if>
					</c:forEach>
					
					<c:if test="${page.page ne page.total }">
						<span><a href="<%=request.getContextPath() %>/front/price/toPriceQueryResult?page=${page.total}&search=${search}">&gt;</a></span>
						<span><a href="#"  class="gt">&gt;</a></span>	
					</c:if> 
--%>

				<!--翻页分页按钮-->

				<c:if test="${page.total == 1}">
					<span class="disabled">&lt;</span>
				</c:if>

				<c:if test="${page.total != 1}">
					<span><a
						href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?page=1&search=${search}${searchplant_param}">&lt;</a></span>
				</c:if>

				<%-- 当页面少于 5页时 --%>
				<c:if test="${page.total < 5}">
					<c:forEach begin="1" end="${page.total }" varStatus="status">
						<c:if test="${page.page == status.index}">
							<span class="current">${page.page }</span>
						</c:if>
						<c:if test="${page.page != status.index}">
							<span><a
								href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?page=${status.index}&search=${search}${searchplant_param}">${status.index}</a></span>
						</c:if>
					</c:forEach>
				</c:if>

				<%-- 当页面大于5页时，1、2页和倒数1、2页就不用居中 --%>
				<c:if test="${page.total >= 5}">
					<c:choose>
						<c:when test="${page.page < 3 }">
							<%-- 前2个 --%>
							<c:forEach begin="2" end="${page.page }" varStatus="status">
								<span><a
									href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?page=1 &search=${search}${searchplant_param}">1</a></span>
							</c:forEach>
							<span class="current">${page.page }</span>
							<c:forEach begin="${page.page }" end="4" varStatus="status">
								<span><a
									href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?page=${status.index + 1}&search=${search}${searchplant_param}">${status.index + 1}</a></span>
							</c:forEach>
						</c:when>
						<c:when test="${page.total - page.page < 2 }">
							<c:forEach begin="${page.total - page.page }" end="3"
								varStatus="status">
								<span><a
									href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?page=${page.page - 4 + status.index}&search=${search}${searchplant_param}">${page.page - 4 + status.index}</a></span>
							</c:forEach>
							<span class="current">${page.page }</span>
							<c:forEach begin="1" end="${page.total - page.page}"
								varStatus="status">
								<span><a
									href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?page=${status.index + page.page}&search=${search}${searchplant_param}">${status.index + page.page}</a></span>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<%-- 在中间的 --%>
							<c:if test="${page.page - 2 > 0}">
								<span><a
									href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?page=${page.page - 2}&search=${search}${searchplant_param}">${page.page - 2}</a></span>
							</c:if>
							<c:if test="${page.page - 1 > 0}">
								<span><a
									href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?page=${page.page - 1}&search=${search}${searchplant_param}">${page.page - 1}</a></span>
							</c:if>
							<span class="current">${page.page }</span>
							<c:if test="${page.page + 1 <= page.total}">
								<span><a
									href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?page=${page.page + 1}&search=${search}${searchplant_param}">${page.page + 1}</a></span>
							</c:if>
							<c:if test="${page.page + 2 <= page.total}">
								<span><a
									href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?page=${page.page + 2}&search=${search}${searchplant_param}">${page.page + 2}</a></span>
							</c:if>
						</c:otherwise>
					</c:choose>
				</c:if>



				<c:if test="${page.total == 1}">
					<span class="disabled">&gt;</span>
				</c:if>
				<c:if test="${page.total != 1}">
					<span><a
						href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?page=${page.total}&search=${search}${searchplant_param}">&gt;</a></span>
				</c:if>
				
				
				
			</div>
			
			<div id="display_count">
				<select name="rows" id="rows">
					<option value="5">5条/页</option>
					<option value="10">10条/页</option>
				</select>
			</div>
		</div>
		<!--paging end-->

	</div>
	<div>
		<hr>
		<input type="hidden" value="${search }" name="search">
		<input type="hidden" value="${rows }" name="rows">
	</div>

	<!--购物车 start -->
	<div id="shoppoing_cart" class="iconfont icon-gouwuche">
		<span class="red_dot">1</span>
	</div>
	<!--购物车 end -->

</body>
<script type="text/javascript">
	//获取模糊查询的条件
	var search = $("input[name='search']").val();
	//获取当前页面显示条数
	var cal = $("input[name='rows']").val();

	$(document).ready(function() {
		//根据显示条数默认选中下拉框
		var v = document.getElementById('rows');
		if (cal == 5) {
			v[0].selected = true;
		} else {
			v[1].selected = true;
		}
	});
	//显示条数下拉框改变事件
	$("#rows")
			.bind(
					"change",
					function() {
						//获取下拉框的值
						var val = $('#rows option:selected').text();
						var r = val.substring(val.indexOf('条'), 0);
						window.location.href = "${pageContext.request.contextPath}/front/price/toPriceQueryResult?rows="
								+ r + "&search=" + search;
					});
	//返回首页事件
	$(".lt")
			.bind(
					"click",
					function() {
						window.location.href = "${pageContext.request.contextPath}/front/price/toPriceQueryResult?page=1&search="
								+ search + "&rows=" + cal;
					});
	//分页跳转事件
	$(".p")
			.bind(
					"click",
					function() {
						//var page = document.getElementsByClassName('p')[0].innerText;
						var page = $(this).text();
						window.location.href = "${pageContext.request.contextPath}/front/price/toPriceQueryResult?page="
								+ page + "&search=" + search + "&rows=" + cal;
					});
	//末页事件
	$(".gt")
			.bind(
					"click",
					function() {
						var last = document.getElementsByClassName('span_2')[0].innerText;
						window.location.href = "${pageContext.request.contextPath}/front/price/toPriceQueryResult?page="
								+ last + "&search=" + search + "&rows=" + cal;
					});
</script>

<script>
	function IFrameResize() {
		//alert(this.document.body.scrollHeight); //弹出当前页面的高度 
		var obj = parent.document.getElementById("frame"); //取得父页面IFrame对象 
		//alert(obj.height); //弹出父页面中IFrame中设置的高度 
		obj.height = this.document.body.scrollHeight; //调整父页面中IFrame的高度为此页面的高度 
	}

	/*点击浮动购物车显示购物车栏  */
	(function() {
		var $shoppoing_cart = $("#shoppoing_cart");
		$shoppoing_cart.click(function() {
			parent.showCart()
		})
	})();

	 var plant = ${searchplant};
	
	var selects = $("#query_condition_form").find("select");
		 selects.each(function(index, element) {
			if(index==0){
				if(plant.type){
					 $(this).find("option[value='"+plant.type+"']").attr("selected",true);
				}
				 
			} else if(index==1){
				if(plant.adaptableArea){
					 $(this).find("option[value='"+plant.adaptableArea+"']").attr("selected",true);
				}
				 

			}else if(index==2){
				if(plant.ornamentalFeat){
					 $(this).find("option[value='"+plant.ornamentalFeat+"']").attr("selected",true);
				}
				 

			}else if(index==3){
				if(plant.useFeat){
					$(this).find("option[value='"+plant.useFeat+"']").attr("selected",true);
				}
			} 
			
			$(this).change(function() {
				//添加所需要执行的操作代码  
				var va = $(this).val();
				var serialize = $("#query_condition_form").serialize();
				serialize= decodeURIComponent(serialize,true);
				window.location.href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?"+serialize
			})
	}); 
	
		 
		 
		 
		 
		 
	
	
	
	
	
</script>

</html>
