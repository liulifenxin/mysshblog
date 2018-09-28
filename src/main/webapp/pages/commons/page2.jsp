<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />

		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" />

		<!-- page specific plugin styles -->
		<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jquery-ui.custom.min.css" /> -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/datepicker.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ui.jqgrid.css" />
		<!-- text fonts -->


		<!-- ace styles -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-part2.min.css" />
		<![endif]-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-rtl.min.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script src="${pageContext.request.contextPath}/assets/js/ace-extra.min.js"></script>

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="${pageContext.request.contextPath}/assets/js/html5shiv.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/respond.min.js"></script>
		<![endif]-->
		<style type="text/css">
			.main-content{
				margin-left: 0;
			}
		</style>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/public-table.css" />
        <!-- sweetAlert插件 -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/sweetAlert/js/sweet-swal.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/sweetAlert/css/sweet-swal.css" />
        <script type="text/javascript">
		//初始化页面页数
		function initPage(data){
			console.log("执行了");
			var currentPage = data.currentPage;
			var firstPage = data.firstPage;
			var totalPage = data.totalPage;
			var totalRows = data.totalRows;
			if(currentPage != "1"){
				$("#lastPage").removeClass("disabled");
				$("#lastPage").addClass("spanPre");
			}else{
				$("#lastPage").removeClass("spanPre");
				$("#lastPage").addClass("disabled");
			}
			if(currentPage != totalPage){
				$("#nextPage").removeClass("disabled");
				$("#nextPage").addClass("spanNext");
			}else{
				$("#nextPage").removeClass("spanNext");
				$("#nextPage").addClass("disabled");
			}
			$(".spanFirst").val(firstPage);
			$("#currentPage").text(currentPage);
			$("#totalPage").text(totalPage);
			$(".spanLast").val(totalPage);
			//把字段显示到页面上，
			addHtml(data);
		}
		//翻页重新加载页面
		function otherPage(page){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/newBuilder/getList",
				dataType:"json",
				data:{"page":page},
				success:function(data){
					initPage(data);
				},
				error:function(data){
					swal("","获取失败！","error");
				}
			});
		}
		$(function(){
		
			// 首页
			$(".spanFirst").click(function() {
				var page = $(".spanFirst").val();
				console.log("首页"+page);
				otherPage(page);
			});

			// 上一页
			$(document).on("click",".spanPre",function() {
				var page = parseInt($("#currentPage").text())-1;
				console.log("上一页"+page);
				otherPage(page);
			});

			// 下一页
			$(document).on("click",".spanNext",function() {
				console.log("减了");
				var page = parseInt($("#currentPage").text())+1;
				console.log("下一页"+page);
				otherPage(page);
			});

			// 尾页
			$(".spanLast").click(function() {
				var page = $(".spanLast").val();
				console.log("尾页"+page);
				otherPage(page);
			});

			// 页面大小或者页号更改
	/* 		$(".pageSize, .page").change(function() {
				var form = $(this).parents("form:eq(0)");
				form.submit();
			}); */
		});
		</script>
  </head>
	<div class="pager">
	       <ul class="pagination">
	       <li class="spanFirst"><a>首页</a></li>
		   <li id="lastPage" class="disabled"><a>上一页</a></li>
		   <li><a>第<sapn id="currentPage"></sapn>页/共<span id="totalPage"></span>页</a></li>
		   <li id="nextPage" class="disabled"><a>下一页</a></li>
	       <li class="spanLast"><a>尾页</a></li>
	       <input type="hidden" value = "" name="rows" class = "rows"/>
	       <input type="hidden" value = "" name="page" class = "page"/>
	   </ul>
	</div>
</html>
