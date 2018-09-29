<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>新增审计 3 查看设计结果</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/audit-asset/css/add_audit_3_vr.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/audit-asset/css/iconfont/iconfont.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/audit-asset/js/jquery-1.12.4.min.js"></script>
	<link
	href="<%=request.getContextPath()%>/sweetAlert/css/sweet-swal.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/sweetAlert/js/sweet-swal.js"></script>
		
	</head>
		<body>
		
		<!--wrap start-->
		<div class="wrap">
			<!--header start-->
			<div id="header" class="clear">
				<p class="fl">园林审计列表&nbsp;|&nbsp;</p>
				<p class="fl">查看审计结果</p>
			</div>
			<!--header end-->
			
			<!--content start-->
			<div id="content">
				<div class="operations">
					<h3>${project.projectName }</h3>
					<div><span class="iconfont icon-xinzeng" onclick="addAuditStage(${project.id})">&nbsp;新增阶段审计</span></div>
					<div><span class="iconfont icon-xiazai" onclick="exportData(${project.id})">&nbsp;全部导出</span></div>
				</div>
				<p>项目所在地：${project.projectPlace }</p>
				<p>项目日期：<fmt:formatDate type="date" 
            value="${project.startDate}" />  至 <fmt:formatDate type="date" 
            value="${project.endDate}" /></p><br />
				<p>项目地区生态特征：
					<c:if test="${project.sunshine eq 's1'}">阳性/</c:if>
					<c:if test="${project.sunshine eq 's2'}">中性/</c:if>
					<c:if test="${project.sunshine eq 's3'}">阴性/</c:if>
					<c:if test="${project.temperature eq 't1'}">炎热/</c:if>
					<c:if test="${project.temperature eq 't2'}">温暖/</c:if>
					<c:if test="${project.temperature eq 't3'}">寒冷/</c:if>
					<c:if test="${project.humidity eq 'h1'}">多雨</c:if>
					<c:if test="${project.humidity eq 'h2'}">湿润</c:if>
					<c:if test="${project.humidity eq 'h3'}">干旱</c:if>
					<script type="text/javascript">
						var ss = ${project}
						debugger;
					</script>
				</p>
			</div>
			
			<!--表格-->
			<c:if test="${not empty analysis}">
			<c:forEach items ="${analysis}" var="stage" varStatus="status">
			<c:if test="${not empty stage}">
			<div>
			<div class="table t_up">
			
				<%-- <p class="audit_phase"><span></span>审计阶段：${stage.auditStageName}</p>
				<p class="audit_date">审计日期：${project.auditDate}</p>
				<p class="result_op"><i class="iconfont icon-xiazai" onclick="exportStageData(${project.id})">&nbsp;导出</i><i class="iconfont icon-shanchu" onclick="del(${project.id},${ status.index})" >&nbsp;删除</i></p>			
				<div class="t_border"> --%>
				
			    <c:forEach items="${stage}" var="mystage">
					<c:forEach items="${mystage.key}" var="ea">
					<c:if test="${ea=='auditStageName' && not empty mystage.value}">
					   <c:forEach items="${mystage.value}" var="projectAuditInfo">
					   <p class="audit_phase"><span></span>审计阶段：${projectAuditInfo.auditStageString}</p>
				       <p class="audit_date">审计日期：${projectAuditInfo.auditDate}</p>
				       <p class="result_op"><i class="iconfont icon-xiazai" onclick="exportStageData(${project.id},${projectAuditInfo.auditStageInt})">&nbsp;导出</i><i class="iconfont icon-shanchu" onclick="del(${project.id},${projectAuditInfo.auditStageInt})" >&nbsp;删除</i></p>			
				       <div class="t_border">
				       </c:forEach>
				    </c:if>
					
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
			
		</div>
		<br />
		</c:if>
		</c:forEach>
    </c:if>
	</body>
	
	<script type="text/javascript">
		function del(projectId,stage){
			swal(
					{
						title : "删除",
						text : "您确定要删除吗？",
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
									url : "${pageContext.request.contextPath}/front/auditReportDel",
									data : {
										"projectId" : projectId,
										"stage" : stage
									},
									dataType : "json",
									type : "post",
									success : function(data) {
										/* data = JSON.stringify(data); */
										debugger;
										if (data.status == "success") {
											swal("", "已成功删除数据！", "success");
											 window.setTimeout("window.location.reload()",1500);  
											

										} else {
											swal("", "错误", "error");
										}
									},
									error : function() {
										swal("", "错误", "error");
									}
								});
					});
			
		}
		
		
		
		function exportData(projectId) {
			var auditStageStr = '${auditStageStr}';
            window.location.href="${pageContext.request.contextPath}/auditAnalysis/exportExcel.do?projectId=" + projectId + "&auditStageStr=" + auditStageStr;
		}
		
		function exportStageData(projectId, auditStageInt) {
			window.location.href="${pageContext.request.contextPath}/auditAnalysis/exportExcelgp?projectId=" + projectId + "&auditStageInt=" + auditStageInt;
		}
		
		function addAuditStage(projectId) {
			window.location.href = "${pageContext.request.contextPath}/front/addAuditStage?projectId="+projectId;
		}
		
	
		
		
	</script>
	
	
	
</html>
