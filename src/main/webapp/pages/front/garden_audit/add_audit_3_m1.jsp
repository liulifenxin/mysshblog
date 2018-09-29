<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增审计 3</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/audit-asset/css/add_audit_3.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/audit-asset/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		// $("#next_step").click(function() {
			//window.open("${pageContext.request.contextPath}/upfiles/downlingInformation2018.xlsx");
			/* /AuditPlatform/WebRoot/upfiles/downlingInformation201802.xls */
		//}); 
	});
</script>

</head>
<body>

	<!--wrap start-->
	<div class="wrap">
		<!--header start-->
		<div id="header" class="clear">
			<p class="fl">园林审计列表&nbsp;|&nbsp;</p>
			<p class="fl">新增审计</p>
		</div>
		<!--header end-->

		<!--content start-->
		<div id="content">
			<!--面包屑-->
			<div class="crumbs_step clear" style="color: #fff;">
				<p>1 录入项目基本信息</p>
				<p>2 导入苗木数据</p>
				<p>3 生成审计结果</p>
			</div>
		</div>

		<!--表格-->
		<div>
			<div class="table t_up">
				<p>
					<span></span>审计阶段:项目设计阶段  
					<input id="projectId" type="hidden" value="${projectId}"/>
				</p>
				<div class="t_border">
					<p>经济性分析结果</p>
					<table border="" cellspacing="" cellpadding="">
						<tr>
							<th>行数</th>
							<th>苗木名称</th>
							<th>苗木规格</th>
							<th>疑点百分比</th>
							<th>平台价格</th>
							<th>项目价格</th>
							<th>偏差百分比</th>
							<th>超支占比</th>
						</tr>
						<c:if test="${!empty economicAnalysises}">
						
							<c:forEach items="${ economicAnalysises}" var="economicAnalysis">
								<tr>
									<td> ${economicAnalysis.rowIndex } </td>
									<td>${economicAnalysis.plantName }</td>
									<td style="position:relative;/* left:-40px; */">${economicAnalysis.plantSeedFormat }</td>
									<td>${economicAnalysis.doubt  }%</td>
									<td><fmt:formatNumber type="number" value="${economicAnalysis.platformPrice}" pattern="0.00" maxFractionDigits="2"/> </td>
									<td>${economicAnalysis.projectPrice }</td>
									<td><fmt:formatNumber type="number" value="${economicAnalysis.deviation}" pattern="0.00" maxFractionDigits="2"/>%</td>
									<td><fmt:formatNumber type="number" value="${economicAnalysis.overspending }" pattern="0.00000%" maxFractionDigits="5"/></td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
					
					
					<p>项目面积分析结果</p>
					<table border="" cellspacing="" cellpadding="">
						<tr>
							<th>项目占地面积</th>
							<th>苗木覆盖面积</th>
						</tr>
						
							<c:if test = "${not empty area}">
								<tr>
									<td><fmt:formatNumber type="number" value="${area.area1}" pattern="0.00" maxFractionDigits="2"/>㎡</td>

									<td><fmt:formatNumber type="number" value="${area.area2}" pattern="0.00" maxFractionDigits="2"/>㎡</td>
									
								</tr>
							</c:if>
						
					</table> 
					
					
					
					<p>合理性分析结果</p>
					<table border="" cellspacing="" cellpadding="">
						<tr>
							<th>苗木名称</th>
							<th>疑点类型</th>
							<th>优先级</th>
							<th>疑点内容</th>
						</tr>
						<c:forEach var="ele" items="${analyseList}">
							<c:if test = "${ele.result == '0'}">
								<tr>
									<td>${ele.plantName}</td>
									<td>${ele.analysisContent}</td>
									
									<c:if test="${ele.priority  eq '高'}">
										<td style="color:red;">&nbsp&nbsp${ele.priority}&nbsp&nbsp</td>
									</c:if>
									<c:if test="${ele.priority  eq '低'}">
										<td>&nbsp&nbsp${ele.priority}&nbsp&nbsp</td>
									</c:if>
									<c:if test="${empty ele.priority}">
										<td>&nbsp&nbsp${ele.priority}&nbsp&nbsp</td>
									</c:if>
									<td><span style="position: relative; left: -40px;"><span style="position: relative; left: -25px;">${ele.doubtfulContent}</span> </span></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
					
					
					
				</div>
			</div>
			<!--content end-->
		</div>
		<!--wrap end-->

		<!--step start-->
		<div id="step" class="clear">
			<a href="${pageContext.request.contextPath}/front/garden_audit/add_audit_1"><div id="pre_step" class="fl">上一步</div></a>
			<!-- <a href="${pageContext.request.contextPath}/front/auditReport?projectId="+projectid><div id="finish_step" class="fl">完成</div></a> -->
			<div id="finish_step" onclick="toAnalysis();" class="fl">完成</div>
			<div id="next_step" class="fl" onclick="exportExcel();">导出</div>
		</div>
		<!--step end-->
	</div>
	<script type="text/javascript"></script>

	<script type="text/javascript">
	
	    //请求分析结果页面
	    function toAnalysis(){
	    	var projectId = $("#projectId").val();
		    window.location.href = "${pageContext.request.contextPath}/front/auditReport?projectId="+projectId;
	    }
	    
        function exportExcel(){
            var projectId = $("#projectId").val();
            window.location.href="${pageContext.request.contextPath}/auditAnalysis/exportExcel.do?projectId="+projectId;
        }
	</script>



</body>
</html>
