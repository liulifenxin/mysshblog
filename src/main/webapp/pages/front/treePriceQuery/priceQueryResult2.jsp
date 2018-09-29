<%@page import="com.hdo.utils.Page"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

		<!--查询结果面包屑导航  start-->
		<div id="result_header"	style="width: 1170px; height: 46px; border-bottom: 1px solid #eee;">
			<p>
				<span>
					<a href="${pageContext.request.contextPath }/front/price/toPriceQuery" style="color: #555;'">
						苗木价格查询
					</a>
				</span>
				<span>|</span>
				<span>查询结果</span>
			</p>
		</div>
		<!--查询结果面包屑导航  end-->

		<!-- 查询结果数量统计 start -->
		<div id="query_category">
			<p>
				<span>${search }</span> 
				<span>${page.records }条结果</span>
			</p>
		</div>
		<!-- 查询结果数量统计 end -->

		<!--选择下拉框 start-->
		<div id="result_choice">
			<form id="query_condition_form">
				<ul class="clear" 
					style="width: 1170px; height: 40px; line-height: 40px; background-color: #F5F8FA; border: 1px solid #E6EAEE;">
					<li>
						<span>苗木类型:</span> 
						<select name="type" id="type">
							<option selected value="全部" id="option1">全部</option>
							<c:forEach items="${applicationScope.params['seedlingCategory'] }" 
								var="seedlingCategory" varStatus="status">
								<option value="${seedlingCategory}" >${seedlingCategory }</option>
							</c:forEach>
						</select>
					</li>

					<li>适应地区: 
						<select name="adaptableArea" id="adaptableArea">
							<option selected value="全部">全部</option>
							<c:forEach items="${applicationScope.params['adaptableArea'] }"
								var="adaptableArea" varStatus="status">
								<option value="${adaptableArea }">${adaptableArea }</option>
							</c:forEach>
						</select>
					</li>

					<li>观赏特征: 
						<select name="ornamentalFeat" id="ornamentalFeat">
							<option selected value="全部">全部</option>
							<c:forEach items="${applicationScope.params['ornamentalFeatures'] }"
								var="ornamentalFeatures" varStatus="status">
								<option value="${ornamentalFeatures }">${ornamentalFeatures }</option>
							</c:forEach>
						</select>
					</li>

					<li>用途特征: 
						<select name="useFeat" id="useFeat">
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
				<span class="iconfont icon-shoucangjia-xianxing">&nbsp;</span>
				<span onclick="addToCollect();">全选加入收藏夹</span>
			</div>
			<div class="fl">
				<span class="iconfont icon-xiazai">&nbsp;</span>
				<span id = "exportID">全选导出本页</span>
			</div>
		</div>
		<!--全选end-->

		<!--查询结果内容 start-->
		<div id="result_content">
			<c:forEach items="${page.rows }" var="plant">
				<div id="result_intro" class="clear">
					<a href="${pageContext.request.contextPath }/front/price/priceInfo?plantId=${plant.plantId}">
						
						<div>
							<img src="${pageContext.request.contextPath}${plant.photo}" />
							<!-- <img src="${pageContext.request.contextPath }/audit-asset/img/baiyulan.png" /> -->
						</div>
						<div>
							<p class="name_mm">
								${plant.plantName }
								<span>(${plant.aliasName })</span>
							</p>
							<p>
								<span>苗木类型：${plant.type }</span> 
								<span>适应地区： <%-- ${plant.adaptableArea } --%>华南、华北</span> 
								<span>生态特征：${plant.sunshinePrefer}/${plant.humidityPrefer}	</span>
								<span>观赏特征：${plant.ornamentalFeat }</span>
								<span>用途特征：${plant.useFeat }</span>
							</p>
							<p>
								<span>胸径：<c:if test="${fn:length(plant.seedFormats) > 0}">${plant.seedFormats[0].spec }</c:if></span>
								<span>产地：成都</span> 
								<span>价格：
									<c:if	test="${fn:length(plant.seedFormats) > 0 && fn:length(plant.seedFormats[0].priceInfos) > 0 }">
										${plant.seedFormats[0].priceInfos[0].price }
									</c:if>	/ 
									<c:if test="${fn:length(plant.seedFormats) > 0}">
										${plant.seedFormats[0].unitTypeString }
									</c:if>
								</span>
								<span style="color: #1A89E8;">查看完整价格>>></span>
							</p>
							<p class="plant_id" style="display:none">${plant.plantId}</p>
							<p class="plant_name" style="display:none">${plant.plantName}</p>
							<p class="alias_name" style="display:none">${plant.aliasName}</p>
						</div>
						<div class="cart">

							<c:if test="${plant.plantCollected =='1111'}">
								<span class="fl gouwu iconfont icon-shoucangjia-kuai"></span>
							</c:if>
							<c:if test="${plant.plantCollected =='2222'}">
								<span class="fl gouwu iconfont icon-shoucangjia-xianxing"></span>
							</c:if>
							<span class="fr iconfont icon-xiazai"></span>
						</div>
					</a>
				</div>
				<input type="hidden" class ="export_data" name = "plantId" value=${plant.plantId} />
			</c:forEach>
		</div>
		<!--查询结果内容 end-->

		<!--分页模块 start-->
		<div id="pages" class="clear" style="margin-top: 8px;">
			<div class="pages_total fl">
				总计：<span class="span_1">${page.records}</span>条 / <span
					class="span_2">${page.total}</span>页
			</div>
			<div class="paging fl">

				<!--翻页分页按钮-->
				<c:if test="${page.total == 1}">
					<span class="disabled">&lt;</span>
				</c:if>

				<c:if test="${page.total != 1}">
					<span><a
						href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?rows=${rows}&page=1&search=${search}${searchplant_param}">&lt;</a></span>
				</c:if>
				
				<%-- 当页面少于9页时 --%>
				<c:if test="${page.total < 9}">
					<c:forEach begin="1" end="${page.total }" varStatus="status">
						<c:if test="${page.page == status.index}">
							<span class="current">${page.page }</span>
						</c:if>
						<c:if test="${page.page != status.index}">
							<span><a
								href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?rows=${rows}&page=${status.index}&search=${search}${searchplant_param}">${status.index}</a></span>
						</c:if>
					</c:forEach>
				</c:if>

				<%-- 当页面大于9页时，1、2页和倒数1、2页就不用居中 --%>
				<c:if test="${page.total >= 9}">
				
					<c:choose>
						<c:when test="${page.page>=9}">
							<c:forEach begin="${page.page-4<=1?1:page.page-4}" end="${page.page+4>=page.total?page.total:page.page+4}" varStatus="status">
								<c:choose>
									<c:when test="${page.page==status.index}">
										<span class="current">${page.page }</span>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${status.index==page.page-3}">
											<span><a
								href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?rows=${rows}&page=${page.page-5}&search=${search}${searchplant_param}">...</a></span>
											</c:when>
											<c:when test="${status.index==page.page+3 }">
												<span><a
								href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?rows=${rows}&page=${page.page+5>page.total?page.total:page.page+5}&search=${search}${searchplant_param}">...</a></span>
											</c:when>
											<c:when test="${status.index==page.page-4}">
											<span><a
								href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?rows=${rows}&page=${page.page-8}&search=${search}${searchplant_param}">${page.page-8}</a></span>
											</c:when>
											<c:when test="${status.index==page.page+4 }">
												<span><a
								href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?rows=${rows}&page=${page.page+8>page.total?page.total:page.page+8}&search=${search}${searchplant_param}">${page.page+8>page.total?page.total:page.page+8}</a></span>
											</c:when>
																	
											<c:otherwise>
											 <span><a
								href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?rows=${rows}&page=${status.index}&search=${search}${searchplant_param}">${status.index}</a></span> 
											</c:otherwise>
										</c:choose>
										
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach begin="1" end="9" varStatus="status">
								<c:choose>
									<c:when test="${page.page==status.index }">
										<span class="current">${page.page }</span>
									</c:when>
									<c:otherwise>
										<span><a href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?rows=${rows}&page=${status.index}&search=${search}${searchplant_param}">${status.index}</a></span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</c:if>

				<c:if test="${page.total == 1}">
					<span class="disabled">&gt;</span>
				</c:if>
				<c:if test="${page.total != 1}">
					<span><a
						href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?rows=${rows}&page=${page.total}&search=${search}${searchplant_param}">&gt;</a></span>
				</c:if>

			</div>

			<div id="display_count">
				<select name="rows" id="rows">
					<option value="10">10条/页</option>
					<option value="20">20条/页</option>
					<option value="30">30条/页</option>
				</select>
			</div>

		</div>
		<!--分页模块 end-->

	</div>
	<div>
		<hr>
		<input type="hidden" value="${search }" name="search">
		<input type="hidden" value="${rows }" name="rows">
	</div>

	<!--收藏夹图标 start -->
	<div id="shoppoing_cart" class="iconfont icon-shoucangjia-xianxing">
		<span class="red_dot">0</span>
	</div>
	<!--收藏夹图标 end -->

</body>

<script type="text/javascript">
	$(document).ready(
		function() {
			$("#exportID").on("click",function(){
				
				var ids = "";
				$(".export_data").each(function(index,element){
					/* alert($(this).val()); */
					ids+=$(this).val()+",";
				}); 
				window.location.href="${pageContext.request.contextPath }/export/plantData?ids="+ids;
			});
		});
	
</script>


<script type="text/javascript">
	 var plant = ${searchplant};
	 serialize2 ="";
	 if(plant.type){
		 serialize2+="&type="+plant.type
	 }
	 if(plant.adaptableArea){
		 serialize2+="&adaptableArea="+plant.adaptableArea
	 }
	 if(plant.ornamentalFeat){
		 serialize2+="&ornamentalFeat="+plant.ornamentalFeat
	 }
	 if(plant.useFeat){
		 serialize2+="&useFeat="+plant.useFeat
	 }
	 if(plant.sunshinePrefer){
		 serialize2+="&sunshinePrefer="+plant.sunshinePrefer
	 }
	 if(plant.temperaturePrefer){
		 serialize2+="&temperaturePrefer="+plant.temperaturePrefer
	 }
	 if(plant.humidityPrefer){
		 serialize2+="&humidityPrefer="+plant.humidityPrefer
	 }
	 if(plant.soilLike){
		 serialize2+="&soilLike="+plant.soilLike
	 }

	//获取模糊查询的条件
	var search = $("input[name='search']").val();
	//获取当前页面显示条数
	var cal = $("input[name='rows']").val();

	$(document).ready(
			function() {
				//根据显示条数默认选中下拉框
				var v = document.getElementById('rows');
				if (cal == 10) {
					v[0].selected = true;
				} else {
					v[1].selected = true;
				}
				var rows = ${rows}
				if (rows) {
					$("#rows").find("option[value='" + rows + "']").attr(
							"selected", true);
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
								+ r + "&search=" + search+serialize2; 
					});
	//返回首页事件
	$(".lt")
			.bind(
					"click",
					function() {
						 window.location.href = "${pageContext.request.contextPath}/front/price/toPriceQueryResult?page=1&search="
								+ search + "&rows=" + cal+serialize2; 
					});
	//分页跳转事件
	$(".p")
			.bind(
					"click",
					function() {
						//var page = document.getElementsByClassName('p')[0].innerText;
						var page = $(this).text();
						 window.location.href = "${pageContext.request.contextPath}/front/price/toPriceQueryResult?page="
								+ page + "&search=" + search + "&rows="+ cal+serialize2; 
					});
	//末页事件
	$(".gt")
			.bind(
					"click",
					function() {
						var last = document.getElementsByClassName('span_2')[0].innerText;
						window.location.href = "${pageContext.request.contextPath}/front/price/toPriceQueryResult?page="
								+ last + "&search=" + search + "&rows=" + cal+serialize2;
					});
</script>

<script>
	function IFrameResize() {
		//alert(this.document.body.scrollHeight); //弹出当前页面的高度 
		var obj = parent.document.getElementById("frame"); //取得父页面IFrame对象 
		//alert(obj.height); //弹出父页面中IFrame中设置的高度 
		obj.height = this.document.body.scrollHeight; //调整父页面中IFrame的高度为此页面的高度 
	}

	/*点击浮动收藏夹显示收藏夹栏  */
	(function() {
		var $shoppoing_cart = $("#shoppoing_cart");
		$shoppoing_cart.click(function() {
			//top.location.href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?search="+"苏铁";
			parent.showCollectList();
		})
	})();

	var plant = ${searchplant};
	
	//获取模糊查询的条件
	var search = $("input[name='search']").val();
	
	var selects = $("#query_condition_form").find("select");
	selects.each(function(index, element) {

				if (index == 0) {
					if (plant.type) {
						$(this).find("option[value='" + plant.type + "']").attr("selected", true);
					}

				} else if (index == 1) {
					if (plant.adaptableArea) {
						$(this).find(
								"option[value='" + plant.adaptableArea + "']").attr("selected", true);
					}

				} else if (index == 2) {
					if (plant.ornamentalFeat) {
						$(this).find(
								"option[value='" + plant.ornamentalFeat + "']").attr("selected", true);
					}

				} else if (index == 3) {
					if (plant.useFeat) {
						$(this).find("option[value='" + plant.useFeat + "']").attr("selected", true);
					}
				}

				$(this).change(
								function() {
									//添加所需要执行的操作代码  
									var va = $(this).val();
									var serialize = $("#query_condition_form").serialize();
									serialize = decodeURIComponent(serialize,true);
									window.location.href = "${pageContext.request.contextPath}/front/price/toPriceQueryResult?"
											+ serialize + "&search=" + search
								})
			});
</script>

<script>


	function addToCollect() {
		var ids2 = "";
		$(".export_data").each(function(index,element){
			/* alert($(this).val()); */
			ids2+=$(this).val()+",";
		}); 
		
		$(".gouwu").attr("class","fl gouwu iconfont icon-shoucangjia-kuai");
		/* window.location.href="${pageContext.request.contextPath }/collectItem/insertAll?ids="+ids2;
		redDot(); */
		$.ajax({
			url:"${pageContext.request.contextPath}/collectItem/insertAll",
			data:{
				'userId' :${sessionScope.user.number},
				'ids':ids2,
			},
			type:"post",
			success:function(){
				redDot();
			},
			error:function(){
			}
		});
 
	}

   //列表收藏夹按钮响应
   var $span = $(".cart span");
   var $gw = $(".gouwu");
   
   $gw.on('click',function(event){
		var plantId = $(this).parents('.cart').siblings().find('.plant_id').text().replace(/^\s+|\s+$/g,"");
		var plantName = $(this).parents('.cart').siblings().find('.plant_name').text().replace(/^\s+|\s+$/g,"");
		var aliasName = $(this).parents('.cart').siblings().find('.alias_name').text().replace(/^\s+|\s+$/g,"");
	    var ico_class = $(this).attr('class');
	    //列表项收藏夹按钮
	    if (ico_class === "fl gouwu iconfont icon-shoucangjia-xianxing") {
	    	//切换图标
	    	$(this).toggleClass("icon-shoucangjia-xianxing");
			$(this).toggleClass("icon-shoucangjia-kuai");
	
			//插入收藏数据
			$.ajax({
				url:"${pageContext.request.contextPath}/collectItem/insert",
				data:{
					'userId' :${sessionScope.user.number},
					'plantId':plantId,
					'plantName':plantName,
					'aliasName':aliasName
				},
				type:"post",
				success:function(){
					redDot();
				},
				error:function(){
				}
			});
			event.stopPropagation();
			
			return false;
	   	}
	 
	   	else if(ico_class === "fl gouwu iconfont icon-shoucangjia-kuai"){
	   		//切换图标
		   	$(this).toggleClass("icon-shoucangjia-kuai");
		   	$(this).toggleClass("icon-shoucangjia-xianxing");
		   	
		   	//删除收藏夹数据
		   	$.ajax({
				url:"${pageContext.request.contextPath}/collectItem/deleteByUserIdAndPlantId",
				data:{
					'userId' :${sessionScope.user.number},
					'plantId':plantId
				},
				type:"post",
				success:function(){
					redDot();
				},
				error:function(){
				}
			});
			event.stopPropagation();
	   		return false;
	   	}  
   });
	//收藏夹里面的个数
	redDot();
	function redDot(){
		var $redDot = $(".red_dot");
		$.ajax({
			url : "${pageContext.request.contextPath}/collectItem/getCount",
			data : {
				'userId':${sessionScope.user.number}
			},
			type : "post",
			dataType:"json",
			success : function(res) {
				var sum = res.sumRed;
				if(sum>99){
					$redDot.html('99+');
				}
				else{
					$redDot.html(sum);
				}
			}
		});
	}
</script>

</html>
