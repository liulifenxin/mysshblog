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
<script type="text/javascript">
		$(function(){
			// 首页
			$(".spanFirst").click(function() {
				var form = $(this).parents("form:eq(0)");
				var pageNo = form.find(".page");
				pageNo.val("${page.firstPage}");
				form.submit();
			});

			// 上一页
			$(".spanPre").click(function() {
				var form = $(this).parents("form:eq(0)");
				var pageNo = form.find(".page");
				pageNo.val(new Number("${page.currentPage}") - 1);
				if(!pageNo.val()) {
					pageNo.val(new Number("${page.currentPage}"));
					return;
				}
				form.submit();
			});

			// 下一页
			$(".spanNext").click(function() {
				var form = $(this).parents("form:eq(0)");
				if(new Number("${page.currentPage}") + 1 > new Number("${page.totalPage}")) {
					return;
				}
				form.find(".page").val(new Number("${page.currentPage}") + 1);
				form.submit();
			});

			// 尾页
			$(".spanLast").click(function() {
				var form = $(this).parents("form:eq(0)");
				var pageNo = form.find(".page");
				pageNo.val("${page.totalPage}");
				form.submit();
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
		<c:if test="${page.currentPage=='1'}">
		       		<li class="disabled"><a>上一页</a></li>
		</c:if>
		<c:if test="${page.currentPage!='1'}">
		       		<li class="spanPre"><a>上一页</a></li>
		</c:if>
		<li><a>第${page.currentPage }页/共${page.totalPage}页</a></li>
		
		<c:if test="${page.currentPage==page.totalPage}">
			<li class="disabled"><a>下一页</a></li>
		</c:if>
		<c:if test="${page.currentPage!=page.totalPage}">
	     	<li class="spanLast"><a>下一页</a></li>
	    </c:if>
	      <li class="spanLast"><a>尾页</a></li>
	      <input type="hidden" value = "" name="rows" class = "rows"/>
	      <input type="hidden" value = "" name="page" class = "page"/>
	   </ul>
	</div>
</html>
