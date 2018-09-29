<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>园林审计</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/audit-asset/css/garden_audit.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/audit-asset/css/iconfont/iconfont.css" />

<link
	href="<%=request.getContextPath()%>/sweetAlert/css/sweet-swal.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/sweetAlert/js/sweet-swal.js"></script>

<style>
/*搜索框文字效果*/
input::-webkit-input-placeholder {
	color: #C5C5C5;
	font-size: 14px;
}

/*修改浮层框*/
.delect {
	display: none;
	position: absolute;
	top: 25px;
	right: 0;
	width: 260px;
	height: 145px;
	background: #FFF;
	border: 1px solid #D8D8D8;
	border-radius: 4px;
	z-index: 100;
}

.delect form {
	width: 265px;
	margin: 0 auto;
}

.delect p {
	position: relative;
	width: 100%;
}

.delect p label {
	position: absolute;
	top: 6px;
	left: 165px;
	font-size: 14px;
	color: #222222;
}

.delect p:nth-child(1) {
	width: 100%;
	height: 20px;
	margin: 12px 0;
	font-family: MicrosoftYaHei;
	font-size: 14px;
	color: #222222;
	letter-spacing: 1px;
	text-align: left;
}

.delect p:nth-child(2) {
	width: 100%;
	height: 30px;
	font-family: MicrosoftYaHei;
	font-size: 14px;
	color: #222222;
	letter-spacing: 1px;
}

.delect p:nth-child(2) select {
	height: 30px;
	background: #FFFFFF;
	border: 1px solid #D8D8D8;
	border-radius: 2px;
}

.delect p:nth-child(2) select:nth-child(1) {
	width: 90px;
	margin-right: 5px
}

.delect p:nth-child(2) select#unit_valuation {
	width: 64px;
	margin-left: 5px;
}

.delect p:nth-child(2) input {
	position: relative;
	top: -1px;
	height: 28px;
	width: 88px;
	background: #FFFFFF;
	border: 1px solid #D8D8D8;
	border-radius: 2px;
}

.delect p:nth-child(3) {
	width: 100%;
	height: 30px;
	margin-top: 15px;
	font-family: MicrosoftYaHei;
	font-size: 14px;
	color: #222222;
	letter-spacing: 1px;
	text-align: left;
}

.delect p:nth-child(3) span {
	display: inline-block;
	width: 64px;
	height: 30px;
	margin-left: 10px;
	line-height: 30px;
	text-align: center;
	border-radius: 2px;
	font-size: 14px;
	letter-spacing: 1px;
}

.delect p:nth-child(3) span:nth-child(2) {
	color: #555555;
	border: 1px solid #D8D8D8;
}

.delect p:nth-child(3) span:nth-child(1) {
	color: #FFFFFF;
	background: #EC3F4E;
	border: 1px solid #D8D8D8;
}

.delect .tl {
	position: absolute;
	top: -14px;
	right: 16px;
	width: 14px;
}

.delect .tl img {
	width: 14px;
}

#table p {
	font-size: 14px;
	color: #222222;
	letter-spacing: 1px;
	text-align: center;
	line-height: 24px;
}
</style>
<style type="text/css">
.trial {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}


table {
	table-layout: fixed;
}
</style>
</head>
<body>


	<!--wrap start-->
	<div class="wrap">
		<!--header start-->
		<div id="header" class="clear">
			<!-- <img src="${pageContext.request.contextPath}/audit-asset/img/list.png" class="fl"/>   -->
			<p class="fl">园林审计报告列表</p>
		</div>
		<!--header end-->

		<!--content start-->
		<div id="content">
			<!--新增审计和搜索框-->
			<div id="add_search" class="clear">
				<!--新增审计-->
				<a
					href="${pageContext.request.contextPath}/front/garden_audit/add_audit_1">
					<div class="add_audit fl">
						<span class="iconfont icon-xinzeng" style="font-size: 10px;"></span>
						<span>新增审计</span>
					</div>
				</a>
				<!--搜索框-->
				<div class="search fr" style="position: relative;">
					<input type="" name="" id="" value="" placeholder="请输入关键词" /> <span
						class="iconfont icon-sousuo"
						style="text-indent: 0; color: #d8d8d8; position: absolute; right: 5px; top: 9px;"></span>
				</div>
			</div>
			<!--表格-->
			<div id="table">
				<table border="" cellspacing="0" cellpadding="0">
					<tr>
						<th>项目名称</th>
						<th>项目所在地</th>
						<th>项目日期</th>
						<th>已审阶段</th>
						<th>审计日期</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${page.rows}" var="project">
						<tr id="${project.id}">
							<td>${project.projectName }</td>
							<td>${project.projectPlace }</td>
							<td><fmt:formatDate value="${project.startDate }"
									pattern="yyyy/MM/dd" /> - <fmt:formatDate
									value="${project.endDate }" pattern="yyyy/MM/dd" /></td>

							<td class="trial" title="${project.auditstageString}">${project.auditstageString }</td>
							<td><fmt:formatDate value="${project.auditDate }"
									pattern="yyyy/MM/dd" /></td>

							<td><i style="position: relative; width: 50%; float: left;">
									<span onclick="delect_ts('${project.id}')" title="删除"
									class="iconfont icon-shanchu"
									style="cursor: pointer; color: #BBC5D5;"></span>
									<div id="delect_fl${project.id}" class="delect">

										<form>
											<p>删除操作不可撤销</p>
											</hr>
											<p>确认删除此项目审计结果？</p>
											<p>
												<span class="del" onclick="del('${project.id}')">删除</span><span
													class="cancel" onclick="delect_ts('${project.id}')">取消</span>
											</p>
											<p class="tl">
												<img
													src="${pageContext.request.contextPath }/audit-asset/img/tooltip_arrow.png" />
											</p>
										</form>

									</div>

								</i>
								 <span title="导出" class="iconfont icon-xiazai" style="cursor: pointer;color:#BBC5D5;"></span>
								 </td>							
							</tr>							
						</c:forEach>

					</table>
					
				</div>

			</div>
		</div>
		<!--content end-->

		<!--paging start-->
		<div id="pages" class="clear" style="margin:0 auto;width:1170px;">
			<div class="pages_total fl">
				总计：<span class="span_1">${page.records }</span>条 / <span
					class="span_2">${page.total }</span>页
			</div>
			<div class="paging fl">

				<!--翻页分页按钮-->
				<c:if test="${page.total == 1}">
					<span class="disabled">&lt;</span>
				</c:if>
				<c:if test="${page.total != 1}">
					<span><a
						href="${pageContext.request.contextPath}/front/garden_audit/index?page=1">&lt;</a></span>
				</c:if>

				<%-- 当页面少于9页时 --%>
				<c:if test="${page.total < 9}">
					<c:forEach begin="1" end="${page.total }" varStatus="status">
						<c:if test="${page.page == status.index}">
							<span class="current">${page.page }</span>
						</c:if>
						<c:if test="${page.page != status.index}">
							<span><a
								href="${pageContext.request.contextPath}/front/garden_audit/index?page=${status.index}">${status.index}</a></span>
						</c:if>
					</c:forEach>
				</c:if>

				<%-- 当页面大于5页时，1、2页和倒数1、2页就不用居中 --%>
				<c:if test="${page.total >= 9}">
					<c:choose>
						<c:when test="${page.page < 3 }">
							<%-- 前2个 --%>
							<c:forEach begin="2" end="${page.page }" varStatus="status">
								<span><a
									href="${pageContext.request.contextPath}/front/garden_audit/index?page=1">1</a></span>
							</c:forEach>
							<span class="current">${page.page }</span>
							<c:forEach begin="${page.page }" end="4" varStatus="status">
								<span><a
									href="${pageContext.request.contextPath}/front/garden_audit/index?page=${status.index + 1}">${status.index + 1}</a></span>
							</c:forEach>
						</c:when>
						<c:when test="${page.total - page.page < 2 }">
							<%-- 后2个 --%>
							<%-- <c:forEach begin="0" end="${page.total - page.page + 1}" varStatus="status">
										<span><a href="${pageContext.request.contextPath}/front/garden_audit/index?page=${page.page - (3 - status.index)}">${page.page - (3 - status.index)}</a></span>
									</c:forEach>
									<span class="current">${page.page }</span>
									<c:forEach begin="1" end="${page.total - page.page}" varStatus="status">
										<span><a href="${pageContext.request.contextPath}/front/garden_audit/index?page=${status.index + page.page}">${status.index + page.page}</a></span>
									</c:forEach> --%>
							<c:forEach begin="${page.total - page.page }" end="3"
								varStatus="status">
								<span><a
									href="${pageContext.request.contextPath}/front/garden_audit/index?page=${page.page - 4 + status.index}">${page.page - 4 + status.index}</a></span>
							</c:forEach>
							<span class="current">${page.page }</span>
							<c:forEach begin="1" end="${page.total - page.page}"
								varStatus="status">
								<span><a
									href="${pageContext.request.contextPath}/front/garden_audit/index?page=${status.index + page.page}">${status.index + page.page}</a></span>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<%-- 在中间的 --%>
							<c:if test="${page.page - 2 > 0}">
								<span><a
									href="${pageContext.request.contextPath}/front/garden_audit/index?page=${page.page - 2}">${page.page - 2}</a></span>
							</c:if>
							<c:if test="${page.page - 1 > 0}">
								<span><a
									href="${pageContext.request.contextPath}/front/garden_audit/index?page=${page.page - 1}">${page.page - 1}</a></span>
							</c:if>
							<span class="current">${page.page }</span>
							<c:if test="${page.page + 1 <= page.total}">
								<span><a
									href="${pageContext.request.contextPath}/front/garden_audit/index?page=${page.page + 1}">${page.page + 1}</a></span>
							</c:if>
							<c:if test="${page.page + 2 <= page.total}">
								<span><a
									href="${pageContext.request.contextPath}/front/garden_audit/index?page=${page.page + 2}">${page.page + 2}</a></span>
							</c:if>
						</c:otherwise>

					</c:choose>

					<%--
								
							 --%>
				</c:if>

				<c:if test="${page.total == 1}">
					<span class="disabled">&gt;</span>
				</c:if>
				<c:if test="${page.total != 1}">
					<span><a
						href="${pageContext.request.contextPath}/front/garden_audit/index?page=${page.total}">&gt;</a></span>
				</c:if>
				<%--每页显示的数量 --%>
				<select name="page.pageSize" id="pageSizeSelector"
					style="width: 80px; height: 33px; border: 1px solid #D8D8D8; border-radius: 2px;">
					<option value="10" class="pageSize">10条/页</option>
					<option value="20" class="pageSize">20条/页</option>
					<option value="30" class="pageSize">30条/页</option>
				</select>

			</div>
		</div>
		<!--paging end-->
	</div>
	<script>
		function delect_ts(id) {
			var a = "#delect_fl" + id;
			$(a).toggle()
			//	$(a).css("dispaly","block")

		}

	</script>
	
	



	<!--wrap end-->

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/audit-asset/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/audit-asset/js/garden_audit.js"></script>



</body>
<script type="text/javascript">
	/* del(${project.id}) */
	function del(id) {
		//debugger;
		/* $("[onclick]").click(function(){ */
		swal(
				{
					title : "删除",
					text : "您确定要删除这条数据吗？",
					type : "warning",
					confirmButtonText : "确定",
					showCancelButton : true,
					cancelButtonText : "取消",
					closeOnConfirm : false,
					confirmButtonColor : "#ec6c62"
				},
				function() {
					//debugger;
					$.ajax({
								url : "${pageContext.request.contextPath}/front/garden_audit/del",
								data : {
									"id" : id
								},
								dataType : "json",
								type : "get",
								success : function(data) {
									if (data.status == "success") {
										swal("", "已成功删除数据！", "success");
										/* window.setTimeout("window.location.href='${pageContext.request.contextPath}/plant/list2'",1000);  */
										$("#" + id).remove();

									} else {
										swal("", "错误", "error");
									}
								},
								error : function() {
									swal("", "错误", "error");
								}
							});
				});
		
		/* 	}); */
	};
</script>
</html>
