<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>温江园林审计平台首页</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/audit-asset/css/iconfont/iconfont.css" />
	
	<style>
		/*reset*/
		*{ margin: 0; padding: 0;}
		html,body{width: 100%; height: 100%; font-family: "微软雅黑"; font-family: MicrosoftYaHei;}
		li{ list-style: none;}
		h2{ font-weight: normal;}

		/*public*/
		.fl{ float: left;}
		.fr{ float: right;}
		.clear{ content: ''; display: block; clear: both;}

		/*layout*/
		body{
			background-image: linear-gradient(270deg, #0B276A 21%, #0C57A0 100%);   
		  background-image: -webkit-linear-gradient(270deg, #0B276A 21%, #0C57A0 100%);
		  background-image: -ms-linear-gradient(270deg, #0B276A 21%, #0C57A0 100%);
			background-image: -moz-linear-gradient(270deg, #0B276A 21%, #0C57A0 100%);
		  background-image: -o-linear-gradient(270deg, #0B276A 21%, #0C57A0 100%);
		}
		#wrap{ position: relative; width: 1170px; margin: 0 auto;}
		#header{ width: 100%; height: 30px; margin-top: 20px;}
		#slider{ position: absolute; top: 90px; left: 0; width: 100%; height: 478.5px;}
		#modules{ position: absolute; top: 490px; left: 0;}	
		
		
		/*common*/
		
		/*header*/
		#header .logo img{ width: 140px; height: 30px;}
		#header .loginButton{ width: 80px; height: 30px; line-height: 30px; text-align: center; color: #fff; font-size: 14px; border: 1px solid #fff; border-radius: 2px; cursor: pointer;}
		
		/*slider*/
		#slider .s_left{ position: absolute; top: 150px; left: 0; width: 500px; height: 140px; overflow: hidden;}
		#slider .s_left ul{ position: absolute; top: 0; right: 0; width: 3500px; height: 140px; }
		#slider .s_left li{ float: right; width:500px;}
		#slider .s_left h2{ margin-bottom: 10px; font-size: 36px; color: #fff; line-height: 47px;}
		#slider .s_left p{ font-size: 24px; color: #fff; line-height: 40px; opacity: .7; letter-spacing: 1px;}
		
		#slider .s_right{ position: absolute; top: 0; right: 0; width: 550px; height: 478.5px; overflow: hidden;}
		#slider ul.img_box{ position: absolute; top: 0; left:0; height: 478.5px;}
		#slider ul.img_box li{ float: left; width: 550px; height: 478.5px;}
		#slider ul.img_box li img{ width: 550px; height: 478.5px;}
		
		#modules li{ position: relative; float: left; width: 218px; height: 90px; line-height:90px; margin-right: 20px; font-size: 16px; color: #fff; border-radius: 4px;}
		#modules li span.iconfont{ font-size: 51px; margin:0 10px 0 25px; }
		#modules li span.text{ vertical-align: top;}
		#modules li:nth-child(1){ background-color: #09CB9F;}
		#modules li:nth-child(2){ background-color: #FA9D55;}
		#modules li:nth-child(3){ background-color: #29BCFF;}
		#modules li:nth-child(4){ background-color: #7466F8;}
		#modules li:nth-child(5){ margin: 0; background-color: #E83D69;}
    #modules li:hover{ cursor: pointer;}
		#modules li.on{ top: -10px; box-shadow: 0 8px 32px 0 rgba(0,0,0,0.20);}
		
		.tab_cover{ position: absolute; top: 0; left: 0; width: 218px; height: 90px; background-color: rgba(0,0,0,.2); border-radius: 4px;}
		 
		/*cover*/
		#cover { display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,.3);}
		#cover form{ width: 400px; height: 500px; position:absolute; left:0; right:0; top:0; bottom:0; margin:auto; background-color: #fff; background: #fff; box-shadow: 0 8px 20px 0 rgba(0,0,0,0.40); border-radius: 10px;}
		#cover form .logo{ display: block; width: 265px; height: 50px; margin: 50px auto 60px}	
		#cover form .logo img{width: 130px; height: 115px;}
		#cover form p{ width: 280px; margin: 0 auto 20px; border-bottom: 1px solid #D8D8D8;}
		#cover form input{ width: 280px; height: 50px; font-size: 14px; color: #C5C5C5; line-height: 50px; text-indent: 10px; border: none;}
		#cover form input#submit{ margin-top: 23px; font-size: 16px; color: #FFF; letter-spacing: 1.14px; text-align: center; background-color: #0BBA6B; border-radius: 4px;}
		#cover form input#submit:hover{ cursor: pointer;}	
			
		#cover #close:hover{ color: #f60; cursor: pointer;}
	</style>
</head>
<body>
	<div id="wrap">
		<!--header start-->
		<div id="header" class="clear">
			<%-- <div class="logo fl"><img src="${pageContext.request.contextPath}/audit-asset/img/logo01.png" alt="温江园林审计平台logo" /></div> --%>
			<div class="iconfont icon-logo" style="font-size:30px;float:left;color:#fff;"><span style="font-family: MicrosoftYaHei-Bold;font-size: 16px;letter-spacing: 1.17px;position:relative;top:-5px;margin-left:5px;">成都市温江苗木审计平台</span></div>
			<c:if test="${sessionScope.user eq null }">
				<div class="loginButton login fr">登录</div>
			</c:if>
			<c:if test="${sessionScope.user ne null }">
				<div class="loginButton fr">${sessionScope.user.name }</div>
			</c:if>
		</div>
		<!--header end-->

		<!--slider start-->
		<div id="slider">
			
			<!--left-->
			<div class="s_left">
				<ul class="module_box clear">
					<li class="module_info1">
						<h2>苗木价格查询</h2>
						<p>查询苗木区域性价格定位，价格变化趋势<br/>了解苗木的基本生态习性</p>
					</li>
					<li class="module_info2">
						<h2>园林审计</h3>
						<p>提取苗木关键信息，再通过后台分析服务对每<br/>个阶段的合理性、经济性进行分析</p>
					</li>
					<li class="module_info3">
						<h2>苗木信息录入</h3>
						<p>个人录入苗木基本信息与价格信息，为平台分<br/>析提供更全面、更合理的数据支持</p>
					</li>
					<li class="module_info4">
						<h2>园林设计支撑</h3>
						<p>设计人员在平台设定要求，平台通过价格、以<br/>往项目设计的优秀经验进行苗木推荐</p>
					</li>
					<li class="module_info5">
						<h2>统计分析</h3>
						<p>按年统计当年园林审计涉及的金额、工作量等<br/>可量化数据；分析提供未来审计的侧重点</p>
					</li>
				</ul>
			</div>
			
			<!--right-->
			<div class="s_right pic">
				<ul class="img_box">
					<li><img src="${pageContext.request.contextPath}/audit-asset/img/01.png" alt="" /></li>
					<li><img src="${pageContext.request.contextPath}/audit-asset/img/02.png" alt="" /></li>
					<li><img src="${pageContext.request.contextPath}/audit-asset/img/03.png" alt="" /></li>
					<li><img src="${pageContext.request.contextPath}/audit-asset/img/04.png" alt="" /></li>
					<li><img src="${pageContext.request.contextPath}/audit-asset/img/05.png" alt="" /></li>
				</ul>
			</div>
			
			<!--modules start-->
			<div id="modules" class="tab clear">
				<ul> 
					<li><span class="iconfont icon-miaomujiage"></span><span class="text">苗木价格查询</span><div class="tab_cover"></div></li>
					<li><span class="iconfont icon-yuanlinshenji"></span><span class="text">园林审计</span><div class="tab_cover"></div></li>
					<li><span class="iconfont icon-xinxiluru"></span><span class="text">苗木信息录入</span><div class="tab_cover"></div></li>
					<li><span class="iconfont icon-shejizhicheng"></span><span class="text">园林设计支撑</span><div class="tab_cover"></div></li>
					<li><span class="iconfont icon-tongjifenxi"></span><span class="text">统计分析</span><div class="tab_cover"></div></li>
				</ul>
		<!--<ul> 
					<li><img src="${pageContext.request.contextPath}/audit-asset/img/module1.png" alt="苗木价格查询"/></li>
					<li><img src="${pageContext.request.contextPath}/audit-asset/img/module2.png" alt="园林审计"/></li>
					<li><img src="${pageContext.request.contextPath}/audit-asset/img/module3.png" alt="苗木信息录入"/></li>
					<li><img src="${pageContext.request.contextPath}/audit-asset/img/module4.png" alt="园林设计支撑"/></li>
					<li><img src="${pageContext.request.contextPath}/audit-asset/img/module5.png" alt="统计分析"/></li> 
				</ul> -->
			</div>
			<!--modules end-->
		</div>
		<!--slider end-->
		
	</div>
	
	<!--cover start-->
	<div id="cover">
		<form id="form" action="" method="post">
			<span id="close" class="iconfont icon-guanbi" style="position:absolute;right:20px;top:20px;color: #888888;"></span>
			<%-- <div class="logo iconfont icon-logo" style="font-size:20px;margin-left:80px;margin-top:80px;"><span style="font-family: MicrosoftYaHei-Bold;font-size: 16px;letter-spacing: 1.17px;position:relative;top:-2px;margin-left:5px;">成都市温江苗木审计平台</span><img src="${pageContext.request.contextPath}/audit-asset/img/logo2.png"/></div> --%>
			<img src="${pageContext.request.contextPath}/audit-asset/img/图标logo.png" />
			<p><input type="text" name="number" id="number" value="" placeholder="请输入用户名" /></p>
			<p><input type="password" name="password" id="password" value="" placeholder="请输入密码" /></p>
			<div class="error" style="width:104px;height:16px;font-size:12px;color: #EC3F4E;letter-spacing: 1px;margin: auto;margin-top:25px;"></div>
			<p><input type="hidden" name="code" value="a32398fb-af78-4e2e-9af7-38e66e068e39"/><input type="button" id="submit" value="登录"/></p>
		</form>
	</div>
	<!--cover end-->
	<script src="${pageContext.request.contextPath}/audit-asset/js/jquery-1.12.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/audit-asset/js/slider.js"></script>
	
	<script>
		/*
		 *@fileName：AuditForm
		 *@author：Cao Mingfei
		 *@creatDate 2018-5-4
		 * */
		
		/*点击'登录'弹出登录框*/
		(function () {
			var $h_login = $('#header .login');
			var $cover = $('#cover');
			$h_login.click(function () {
				$cover.css({'display':'block'})
			});
		})();
		
		/*点击叉叉 关闭登录页面*/
		(function () {
			var $c_close = $('#cover #close');
			var $cover = $('#cover')
			$c_close.click(function () {
				$cover.css({"display":"none"})
			})
		})();
	  
		/*账号密码输入时，字体颜色为黑色*/
		(function () {
			var $number = $('#number');
			var $password = $('#password');
			$number.focus(function () {
				$(this).css('color','#222')
			});
			$password.focus(function () {
				$(this).css('color','#222')
			})
		})();
	  
	  	/*点击模块，跳转至对应页面*/
	  	(function(){
		var $m_li = $("#modules li");
		var userId = "${sessionScope.user.id}";
		$m_li.click(function(){
			var index = $(this).index();
			debugger;
			switch(index){
				case 0:
					if(userId == ""){
						alert("请登录!");
						$(".login").trigger("click");
					}else{
						// window.location.href = "priceQuery.html"; 
						 window.location.href = "${pageContext.request.contextPath}/front/price/priceQuery"; 
					}
					//window.location.href = "${pageContext.request.contextPath}/front/price/priceQuery";
					break;
				case 1:
					if(userId == ""){
						alert("请登录!");
						$(".login").trigger("click");
					}else{
						window.location.href = "${pageContext.request.contextPath}/front/garden_audit";
					}
					//window.location.href = "${pageContext.request.contextPath}/front/garden_audit";
					break;
				case 2:
					if(userId == ""){
						alert("请登录!");
						$(".login").trigger("click");
					}else{
						window.location.href = "${pageContext.request.contextPath}/plant/toList";
					}
					//window.location.href = "${pageContext.request.contextPath}/plant/toList";
					break;
				case 3:
					if(userId == ""){
						alert("请登录!");
						$(".login").trigger("click");
					}else{
						// window.location.href = "treePrice/priceQuery.html"; 
						//window.location.href = "${pageContext.request.contextPath}/front/auditSupport/toList";
						window.location.href = "${pageContext.request.contextPath}/auditSupport/L0/design_support.html";
						//frame
					}
					//window.location.href = "${pageContext.request.contextPath}/auditSupport/L0/design_support.html";
					break;
				case 4:
					if(userId == ""){
						alert("请登录!");
						$(".login").trigger("click");
					}else{
						window.location.href = "${pageContext.request.contextPath}/front/analysis";
					}
					//window.location.href = "${pageContext.request.contextPath}/front/analysis";
					break;
			};
		});
	})();

	  	/**
	  	* @description 登录
	  	* @author BaiGuiCai
	  	* @date 2018年5月8日16:25:30
	  	*/
	  	
	  	$("#submit").click(function(){
			var number = $("#number").val().trim();
			var pwd = $("#password").val().trim();			
			if(number.length == 0){
				$(".error").html("户名不能为空！")
				return;
			}
			if(pwd.length == 0){
				$(".error").html("密码不能为空！")
				return;
			}
					
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/doLogin",
				data:$("#form").serialize(),
				dataType:"json",
				success:function(data){
				    console.log(data);
					if(data.success == true){
					    //后台管理员
					    if(data.type==8){
					       window.location.href="${pageContext.request.contextPath}/front/price/priceQuery";
					    }
					}else{
						var msg;
						if(data.code == 1){
							$(".error").html("账号或密码错误！")
							$("#number").css("border-color","red");
						}else if(data.code == 2){
							$(".error").html("账号或密码错误！")
							$("#password").css("border-color","red");
						}else if(data.code == 3){
							$(".error").html("工号已经被停用！")
							$("#number").css("border-color","red");
						}else if(data.code == 4){
							$(".error").html("验证码错误！")  
							//$("#code").css("border-color","red");
						}else{
							//swal("","data.code:"+data.code+"不是指定返回值","error");
							console.log(data.code+"不是指定返回值");
						}
						
					}
				}
			});

		});
	  	
	 
  </script>
</body>
</html>
