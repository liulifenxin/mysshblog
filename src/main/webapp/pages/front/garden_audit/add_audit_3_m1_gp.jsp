<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增审计 3 gp</title>
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
			<c:if test="${not empty analysis}">
			<c:forEach items ="${analysis}" var="stage" varStatus="status">
			<c:if test="${not empty stage}">
			<div>
			<div class="table t_up">
			
				<p class="audit_phase"><span></span>审计阶段：${stage.auditStageName}</p>			
				<div class="t_border">
				
			    <c:forEach items="${stage}" var="mystage">
					<c:forEach items="${mystage.key}" var="ea">
					
					<!-- 经济性分析结果 -->
					<c:if test="${ea=='eas' && not empty mystage.value}">
					<p>经济性分析结果</p>
					<table border="" cellspacing="" cellpadding="">
					
						<tr>
							<th>行数</th>
							<th>苗木名称</th>
							<th>苗木规格</th>
							<th>疑点百分比</th>
							<th>平台价格(/元)</th>
							<th>项目价格(/元)</th>
							<th>偏差百分比</th>
							<th>超支价格占比</th>
							
						</tr>
						
						<c:forEach items="${mystage.value}" var="economicAnalysis">
							<tr>
								<td>${economicAnalysis.rowIndex }</td>
								<td>${economicAnalysis.plantName }</td>
								<td style="position:relative;/* left:-40px */;">${economicAnalysis.plantSeedFormat }</td>
								<td><fmt:formatNumber type="number" value="${economicAnalysis.doubt}" pattern="0.00" maxFractionDigits="2"/>  </td>
								<td><fmt:formatNumber type="number" value="${economicAnalysis.platformPrice }" pattern="0.00" maxFractionDigits="2"/></td>
								<td>${economicAnalysis.projectPrice }</td>
								<td><fmt:formatNumber type="number" value="${economicAnalysis.deviation }" pattern="0.00" maxFractionDigits="2"/>%</td>
								<td><fmt:formatNumber type="number" value="${economicAnalysis.overspending }" pattern="0.00000%" maxFractionDigits="5"/></td>
							</tr>
							</c:forEach>
					</table>
				</c:if>
				
				
				<!-- 项目面积分析结果 -->
				 <c:if test="${ea=='area' && not empty mystage.value}"> 
					<p>项目面积分析结果</p>
				<table border="" cellspacing="" cellpadding="">
					<tr>
						<th>项目占地面积</th>
						<th>苗木覆盖面积</th>
						
					</tr>
					<tr>
					<c:forEach  items="${mystage.value}" var="area" varStatus="status">
						<c:choose>
							<c:when test="${ status.index ==1}">
								<td><fmt:formatNumber type="number" value="${area}" pattern="0.00" maxFractionDigits="2"/>㎡</td>
							</c:when>
							<c:otherwise>
								<td>${area}㎡</td>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					</tr>
				</table>
				</c:if> 
				
				
				<!-- 合理性分析结果 -->
				<c:if test="${ea=='ras' && not empty mystage.value}">
					<p>合理性分析结果</p>
				<table border="" cellspacing="" cellpadding="">
					<tr>
						<th>苗木名称</th>
						<th>疑点类型</th>
						<th>优先级</th>
						<th>疑点内容</th>
					</tr>
					<c:forEach items="${mystage.value}" var="reasonablenessAnalysis">
					<tr>
						<td>${reasonablenessAnalysis.plantName}</td>
						<td>${reasonablenessAnalysis.analysisContent}</td>
						
						<c:if test="${reasonablenessAnalysis.priority eq '高'}">
							<td style="color:red;">&nbsp&nbsp${reasonablenessAnalysis.priority}&nbsp&nbsp</td>
						</c:if>
						<c:if test="${reasonablenessAnalysis.priority eq '低'}">
							<td>&nbsp&nbsp${reasonablenessAnalysis.priority}&nbsp&nbsp</td>
						</c:if>
						<c:if test="${empty reasonablenessAnalysis.priority}">
							<td>&nbsp&nbsp${reasonablenessAnalysis.priority}&nbsp&nbsp</td>
						</c:if>
						
						<td><span  style="position:relative;/* left:-140px; */"><span style="position:relative;left:-25px;">${reasonablenessAnalysis.doubtfulContent}</span> <br /> <%-- <span style="position:relative;left:0px;">数据库值：${reasonablenessAnalysis.dBValue}<!-- 苗木实际用途：庭院观赏，盆景 --></span> --%></td>
					</tr>
					</c:forEach>
				</table>
				</c:if>
				
				
					</c:forEach>
			
				</c:forEach>
				
				</div>
			
			</div>
			<br />
		</div>
		</c:if>
		</c:forEach>
    </c:if>

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
	    	var projectId = ${project.id};
		    window.location.href = "${pageContext.request.contextPath}/front/auditReportgp?projectId="+projectId;
	    }
	    
        function exportExcel(){
            var projectId = ${project.id};
            var auditStageStr = '${auditStageStr}';
            window.location.href="${pageContext.request.contextPath}/auditAnalysis/exportExcel.do?projectId=" + projectId + "&auditStageStr=" + auditStageStr;
        }
	</script>



</body>
</html>
