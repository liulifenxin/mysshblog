<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>仓储管理系统-Warehouse</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!-- sweetAlert插件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/sweetAlert/js/sweet-swal2.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/sweetAlert/css/sweet-swal2.css" />
  </head>
  
  <body>
   	<div style="width: 100%;height:150px"></div>
  </body>
  <script type="text/javascript">
  	$(document).ready(function(){
  		if( "${outTime}" == "true"){
  			swal("系统版本过低,请及时更新系统");
  		}
  		var bug ="         .............................................\n"
			+"                  佛祖镇楼                  BUG辟易\n"
			+"          佛曰:\n"
			+"                  写字楼里写字间，写字间里程序员；\n"
			+"                  程序人员写程序，又拿程序换酒钱。\n"
			+"                  酒醒只在网上坐，酒醉还来网下眠；\n"
			+"                  酒醉酒醒日复日，网上网下年复年。\n"
			+"                  但愿老死电脑间，不愿鞠躬老板前；\n"
			+"                  奔驰宝马贵者趣，公交自行程序员。\n"
			+"                  别人笑我忒疯癫，我笑自己命太贱；\n"
			+"                  不见满街漂亮妹，哪个归得程序员？\n";
		
		//console.log(bug);
  		/* console.log("一个项目，要经历怎样的过程，才能抵达用户面前？\n"+
  					"一位新人，要经历怎样的成长，才能站在技术之巅？\n"+
  					"生活永远是向前看的，勇于迈出第一步，敢于挑战，敢于奋斗，敢于拼搏，只要你想要没有什么做不到！从现在起，改变自己，加入诚骏！"+
  					"请将简历发送至  mk@honestdo.com（ 邮件标题请以'姓名-应聘XX职位-来自XX'命名）\n"+
  					"职位介绍：http://www.honestdo.com/main/news/recruit.html"); */
  	});
  	
  </script>
</html>
