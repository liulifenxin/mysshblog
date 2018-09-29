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
	<body style="overflow:hidden;">
		<div id="header_nav" style="width:100%;background-color: #1D2D4D;">
		<div id="menu">
			<div class="one">
				<div class="iconfont icon-logo" style="font-size:32px;opacity:0.6;float:left;cursor:pointer;"><span style="font-family: MicrosoftYaHei-Bold;font-size: 14px;letter-spacing: 1.17px;position:relative;top:-7px;margin-left:5px;">成都市温江苗木审计平台</span></div>

			</div>
			<div class="two">
				<ul>
					<li>苗木价格查询</li>
					<li>园林审计</li>
					<li style="color:#0BBA6B;opacity: 1;">苗木信息录入</li>
					<li>园林设计支撑</li>
					<li>统计分析</li>
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
					<img src="<%=request.getContextPath() %>/audit-asset/img/touxiang.png" style="width:36px;height:36px">
					
					<span class="iconfont icon-sanjiao-xia"></span>
				</div>
			</div>
		</div>
		</div>

		<iframe src="<%=request.getContextPath() %>/plant/list2" frameborder="0" id="frame" name="frame" style="width:100%;"
		onload="changeFrameHeight()" scrolling="auto"
		></iframe>

		<!--Calculation start -->
			<div id="calc_cover">
				<div id="calc_table">
					<div class="c_t_wrap clear">
						<p><span class="fl">此价格为系统推算后的到场价，推算规则如下：</span><span class="close fr">×</span></p>
						<table class="table_1">
							<tr>
								<th>苗木类型</th>
								<th>规格类型</th>
								<th>到场价</th>
								<th>备注</th>
							</tr>
							<tr>
								<td rowspan="2" class="td_1">藤木/竹类/球根花卉/水生花卉/宿根花卉/一二年生花卉/草坪地被植物</td>
								<td>所有</td>
								<td>=地价*(1+5%+10%)</td>
								<td>经纪人10%，运输5%</td>
							</tr>
							<tr>
								<td>所有</td>
								<td>=上车价*(1+5%)</td>
								<td>运输5%</td>
							</tr>
							<tr class="height_80">
								<td rowspan="2" class="td_1">落叶针叶树/落叶阔叶树/常绿阔叶树/常绿针叶树</td>
								<td>胸径/地径/分支点粗度</td>
								<td>=地价*(1+5%+10%)+(起挖环节对应系数)+(包装环节对应系数)+(上车环节对应系数)</td>
								<td>经纪人10%，运输5%</td>
							</tr>
							<tr class="height_80">
								<td>胸径/地径/分支点粗度</td>
								<td>=上车价*(1+5%)</td>
								<td>运输5%</td>
							</tr>
							<tr>
							<!--	<td rowspan="2" class="td_1">草坪地被植物</td>   -->
								<td>高/冠幅</td>
								<td>=地价*(1+5%+10%+10.5%)</td>
								<td>经纪人10%.运输5%,通用系数10.5%</td>
							</tr>
							<tr>	
								<td>高/冠幅</td>
								<td>=上车价*(1+5%)</td>
								<td>运输5%</td>
							</tr>
						</table>
						<table class="table_2">
							<tr>
								<th>系数名</th>
								<th>参数</th>
								<th>系数</th>
							</tr>
							<tr>
								<td>价格幅度</td>
								<td>/</td>
								<td>*15%</td>
							</tr>
							<tr>
								<td>经纪人环节</td>
								<td>/</td>
								<td>*10%</td>
							</tr>
							<tr>
								<td>起挖环节</td>
								<td>3cm以下</td>
								<td>+15</td>
							</tr>
							<tr>
								<td>起挖环节</td>
								<td>4cm</td>
								<td>+25</td>
							</tr>
							<tr>
								<td>起挖环节</td>
								<td>5cm</td>
								<td>+30</td>
							</tr>
							<tr>
								<td>起挖环节</td>
								<td>6cm</td>
								<td>+40</td>
							</tr>
							<tr>
								<td>起挖环节</td>
								<td>7cm</td>
								<td>+60</td>
							</tr>
							<tr>
								<td>起挖环节</td>
								<td>8cm</td>
								<td>+70</td>
							</tr>
						</table>
						
					</div>
				</div>
			</div>
		<!--Calculation end -->

		
		<script src="${pageContext.request.contextPath}/audit-asset/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript">
		/*
		 *@fileName: iframe自适应高度 、点击×关闭推算弹窗
		 *@author: Cao Mingfei
		 *@createDate: 2018-5-22
		 * */
		
			var url = "${pageContext.request.contextPath}";

			/*iframe自适应高度  */
	    function changeFrameHeight(){
        var ifm= document.getElementById("frame");
        ifm.height=document.documentElement.scrollHeight; 
    	}
    	$(function(){ window.onresize=function(){
        changeFrameHeight(); }}); 
			
    	/*点击×关闭推算弹窗  */
    	(function(){
    		var $close = $("#calc_cover .close");
  			
    		$close.click(function(){
    			var $calc_cover = $("#calc_cover");
    			$calc_cover.css("display","none")
    		})
    	})();
    	
    	/*点击i弹出推算价格*/
  		function showCalc(){
     			var $calc_cover = $("#calc_cover");
     			$calc_cover.css("display","block")
  		}
    	
    	
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
