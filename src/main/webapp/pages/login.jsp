<!-- <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN" style="height:100%">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>温江园林审计平台</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<!-- ${pageContext.request.contextPath} -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/skin.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/sweetAlert/css/animate.css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<!-- sweetAlert插件 -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/sweetAlert/js/sweet-swal.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/sweetAlert/css/sweet-swal.css" />
<style>
	.login_main {
	    overflow-x: hidden;
	    width: 1000px;
	    margin: 0 auto;
	    margin-top: 9%;
	    /* background: url(${pageContext.request.contextPath}/images/login-green.jpg) center top no-repeat; */
	     background: url(${pageContext.request.contextPath}/images/login-mainbg-tongzhou1.jpg) center top no-repeat; 
	}
	.homePage{
		position:absolute;
		top:20px;
		/*right:80px;*/
	}
	.homePage a{
		color:#fff;
		font-size:18px;
	}
	.homePage a:hover{
		color:#e4393c;
	}
	#download{
		font-size:14px;
		text-decoration:underline;
		color:#888;
		opacity:1;
	}
	#download:hover{
		color:red;
	}

	#back-img{
		width: 100%;
		height: 100%;
		filter: blur(0px);
		position: absolute;
		top: 0;
		bottom: 0;
		left: 0;
		right: 0;
	}
	.login_table:hover{
		opacity: 1;
	}
	.login_table:hover + #back-img{
		filter: blur(2px);
	}
	.animated.fadeInDown{
		animation-fill-mode: none;
		animation-duration: 0.6s;
	}
	input.animated.flipInX.flipInX1 {
		animation-duration: 1.5s;
		-webkit-animation-duration: 1.5s;
	}
	input.animated.flipInX.flipInX2 {
		animation-duration: 2.5s;
		-webkit-animation-duration: 2.5s;
	}
	input.animated.flipInX.flipInX3 {
		animation-duration: 3.5s;
		-webkit-animation-duration: 3.5s;
	}
	
</style>
<script type="text/javascript">
	if(self != top){
		top.location.href = "${pageContext.request.contextPath}/login";
	}	
</script>
</head>
<body class="login_main">
	<%-- <div class="homePage" style="width: 100%">
		<div style="margin: 0 auto 0 auto;width: 230px;height: 42px;">
			<img src="${pageContext.request.contextPath}/images/logo.png">
		</div>
	</div> --%>
<%-- 	<div>
		推荐浏览器(点击就下载):<a href="${pageContext.request.contextPath}/apk/ie.exe" download="IE 11.exe" style="text-decoration:underline">IE 11</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/apk/chrome.exe" download="谷歌浏览器.exe" style="text-decoration:underline">谷歌浏览器</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/apk/firefox.exe" download="火狐浏览器.exe" style="text-decoration:underline">火狐浏览器</a>
	</div> --%>
	<table class="login_table animated fadeInDown" style="height:300px;/* margin:200px auto 0 auto; */margin-left: 65%;margin-top: 16%;position:relative" >
		<tr>
			<td id="right_cont">
				<table height="50%" width="100%">
					<tr>
						<td width="15%" rowspan="5">&nbsp;</td>
						<td valign="top" id="form" >
							<form id="loginid" method="post">
								<table valign="top" width="100%">
									<tr> 
										<td colspan="2"><h2 class="login_title"
										style="padding-left: 24px;text-align:left;font-size:24px;">温江园林审计平台</h2></td>
									</tr>
									<tr>
										<td align="center" colspan="2">
											<span id="msg" style="border:1px; background:#CCC;color:#F00;font-size:16px;"></span>
										</td>
									</tr>
									<tr>
										<td>工&nbsp;&nbsp;&nbsp;&nbsp;号：</td>
										<td><input class="animated flipInX flipInX1" type="text" name="number" id="number"/></td>
									</tr>
									<tr>
										<td>密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
										<td><input class="animated flipInX flipInX2" type="password" name="password" id="pwd"/></td>
									</tr>
									<tr>
										<td>验证码：</td>
										<td><input class="animated flipInX flipInX3" type="text" name="code" id="code" style="width:67px;" autocomplete="off"/>
											<img src="${pageContext.request.contextPath}/code"  
													 onclick="this.src='${pageContext.request.contextPath}/code?x='+Math.random();"
													 alt="验证码" title="切换图片" style="vertical-align:middle" />
										</td>
									</tr>
									<!-- 用户区分 -->
									<!-- <tr>
										<td>
										管理员&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="userType1" name="type" style="line-height:40px" />
										<input type="hidden" id="userType" name="userType" value=""/>
										</td>
										<td>客&nbsp;户&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="userType2" name="type" style="" /></td>
									</tr> -->
									<!-- <tr style="height:18px">
										<td> </td>
										<td style="height:18px;text-align:center;font-size:13px">
											<a href="" onclick="myReload()">看不清，换一个</a>
										</td>
						 			</tr> -->
								</table>
							</form>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr >
			<td class="login_btn">
				<input type="button" value="登录" id="loginbtn" style="height:26px;margin-left:60px;"/>
				<input type="button" id="reset" value="重置" style="height:26px;"/>
			</td>
		</tr>
		
	
 	</table>
	
<%-- 	<img id="back-img" src="${pageContext.request.contextPath}/images/login1.png" style="z-index: -1"/> --%>
	<script type="text/javascript">
	$(function(){
		//
		setTimeout(function(){
			$(".appLoad").css("display","block");
		},1000);
		
		$(document).on("keypress",function(){
			if(event.keyCode == "13"){
				$("#loginbtn").trigger("click");
			}
		});
		
		$("#loginbtn").click(function(){
			var number = $("#number").val().trim();
			var pwd = $("#pwd").val().trim();
			var code = $("#code").val().trim();
			//var type = $("#userType").val().trim();
			if(number.length == 0){
				$("#msg").text("用户名不能为空");
				return;
			}
			if(pwd.length == 0){
				$("#msg").text("密码不能为空");
				return;
			}
			if(code.length == 0){
				$("#msg").text("验证码不能为空");
				return;
			}
			/* if(type.length==0){
			    $("#msg").text("请选择用户类型！");
				return;
			} */
			
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/doLogin",
				//data:$("#loginid").serialize()+"&userType=admin",
				data:$("#loginid").serialize(),
				dataType:"json",
				success:function(data){
				    console.log(data);
					if(data.success == true){
					    //后台管理员
					    if(data.type==8){
					       window.location.href="${pageContext.request.contextPath}/main";
					    }
					    //客户
						if(data.type==9){
					       window.location.href="${pageContext.request.contextPath}/cmain";
					    }
					}else{
						var msg;
						if(data.code == 1){
							msg = "工号不存在";
							$("#number").css("border-color","red");
						}else if(data.code == 2){
							msg = "密码错误";
							$("#pwd").css("border-color","red");
						}else if(data.code == 3){
							msg = "工号已经被停用";
							$("#number").css("border-color","red");
						}else if(data.code == 4){
							msg = "验证码错误";
							$("#code").css("border-color","red");
						}else{
							swal("","data.code:"+data.code+"不是指定返回值","error");
							console.log(data.code+"不是指定返回值");
						}
						$("#msg").text(msg);
					}
				}
			});
		});
		
		$("#name").focus(function(){
			$("#number").css("border-color","#375a78");
		});
		$("#pwd").focus(function(){
			$("#pwd").css("border-color","#375a78");
		});
		$("#code").focus(function(){
			$("#code").css("border-color","#375a78");
		});
		
		$("#reset").click(function() {
			$("#number").val("");
			$("#pwd").val("");
			$("#code").val("");
			//使重置后用户名框获得焦点
			$("#name").focus();
		});
		
		//登录类型的判断
		//管理员
	   $("#userType1").click(function () {
	            var boolCheck=$(this).is(":checked");
               if (boolCheck) {
                  $("#userType").val("admin");
               }
           });
        //客户
        $("#userType2").click(function () {
            //var boolCheck=$('input:radio[name="type"]').is(":checked");
            var boolCheck=$(this).is(":checked");
            if (boolCheck) {
                $("#userType").val("customer");
            }
        });
		
	});
	</script>
	<%@include file="./commons/ad.jsp" %>
	
</body>
</html>