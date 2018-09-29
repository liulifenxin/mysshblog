<!--
	作者：chen cong liang 
	时间：2018-05-04
	描述：苗木预览
-->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>新增苗木</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/audit-asset/css/newlyIncreased.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/audit-asset/css/iconfont/iconfont.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/audit-asset/layui_1/css/layui.css">
		<script src="${pageContext.request.contextPath}/audit-asset/layui_1/layui.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>	
					
		<style type="text/css">
		
			/*
				BaiGuiCai
				2018年5月8日10:15:41
				table内的输入框样式
			*/
			#table input,#table select{
				width: 100%;
				heigth:100%;
				border:0px;
			}
			/*输入框默认提示文字样式 */
			 input::-webkit-input-placeholder{
			 color:#C5C5C5;
			 font-size:14px;
			 line-height:14px;
			 letter-spacing: 1px;
			 }
			 
			/*text文本框默认提示文字 */ 
			  body{font-size:14px;}
             p,div{margin:0;padding:0}           
             .note{
             position:absolute;left: 74px;top: -84px;line-height:20px;padding:3px 5px;
             
             #table tr{font-size: 30px;}
             }	             	
		</style>
		
		<script type="text/javascript">
			
		</script>
	</head>
	<body>
		<div id="nav">					<!--整体标签-->
			<div class="wrap">
				<div id="header">
			<p>苗木信息列表 | <span style="font-weight: bold;">新增苗木</span></p>
		</div>
		
		<!--中间整体标签-->
		<div id="nav_2">	
				<div id="scend">
					<p><span class="f2">1</span><span style="font-size:18px;">苗木基本信息</span></p>
				</div>
				
		<!--给文字后的分割线设置标签-->
				<div class="f3"></div>
			
		
		<div id="F_img" style="width:150px;height:120px;border:1px solid #d8d8d8;position:absolute;top:90px;left:8px;">
			<img src="<%=request.getContextPath() %>/audit-asset/img/defaultUpload.png" style="width:100%;height:100%;">
		</div>
		<form id="add">
		<!-- json数据 -->
		<input type="hidden" name="jsonData" />
		<!--名称-->	
		<div class="name">
			<p id="name_input"><span class="l1"><span class="stars" style="color:red;">*</span>苗木名称</span><input type="text" name="plantName" style="width:260px;height:30px;" id="plantNameID" value="" placeholder="请输入" /></p>			
			<i class="iconfont icon-sousuo"></i>
			<!--搜索选择框-->
			<ul class="search_selector" id ="search_selectorID"  display="none">
				 <!-- <li>石榴（安石榴,山力叶,丹若）</li>
				<li>花石榴</li>
				<li>大果榕(…瓜,波罗果,蜜枇杷,大石榴)</li>  -->
				
			</ul>
		</div>	
		<!--别名--->
		<div class="alias">
			<p><span class="l2" style="position:relative;left:8px">别名</span>
			<input type="text" style="width:262px;height:30px; margin-left: -4px;" name="aliasName" id="aliasName" value="" placeholder="多个用逗号隔开" /></p>			
		</div>	
		
		<!--苗木类型-->
		<div class="type">
			<span class="l3"><span class="stars" style="color:red;">*</span>苗木类型</span>
			<select id="type" name="type" style="width:264px;height:34px;color:#c5c5c5;">				
			<option style="color:black;">请选择</option>
				
				<c:forEach items="${applicationScope.params['seedlingCategory']}" var="seedlingCategory" varStatus="status">
					<option style="color:black;" value="<%-- ${status.index} --%>${seedlingCategory}"> ${seedlingCategory}   	
				</c:forEach>				
			</select>
		</div>
		<!--适应地区-->
		<div class="region">
			<!-- <p> --><span class="l4"><span class="stars" style="color:red;">*</span>适应地区</span>
			<!-- <input type="text" style="width:260px;height:30px;" name="adaptableArea" id="adaptableArea" value="" placeholder="如：Ⅱ区,Ⅲ区(I区- XI区)" /></p>	 -->
			<select id="type1" name="type1" style="width:266px;height:35px;color:#c5c5c5;">
			    <option selected="selected" style="color:black;">请选择</option>
				<c:forEach items="${applicationScope.params['adaptableArea']}" var="adaptableArea" varStatus="status">
					<option style="color:black;" value="${status.index} ${adaptableArea}"> ${adaptableArea}
				</c:forEach>
			</select>
		</div>
		
		<!--树形特征-->
		<div class="tree">
			<span class="l5"><span class="stars" style="color:red;">*</span>树形特征</span>
			<select id="type2" name="type2" style="width:264px;height:34px;color:#c5c5c5;">
			 <option selected="selected" style="color:black;">请选择</option>
				<c:forEach items="${applicationScope.params['sunshinePreference']}" var="sunshinePreference" varStatus="status">
					<option style="color:black;"  value="<%-- ${status.index} --%>${sunshinePreference}"> ${sunshinePreference}
				</c:forEach>
			</select>
		</div>
		
		<!--阳光喜好-->
		<div class="sun">
			<span class="l6"><span class="stars" style="color:red;">*</span>阳光喜好</span>
			<select id="type3" name="type3" style="width:266px;height:34px;color:#c5c5c5;">
			 <option selected="selected" style="color:black;">请选择</option>
				<c:forEach items="${applicationScope.params['sunshinePreference']}" var="sunshinePreference" varStatus="status">
					<option style="color:black;"  value="<%-- ${status.index} --%>${sunshinePreference}"> ${sunshinePreference}
				</c:forEach>
			</select>
		</div>
		
		<!--温度喜好-->
		<div class="tem">
			<span class="l7"><span class="stars" style="color:red;">*</span>温度喜好</span>
			<select id="type4" name="type4" style="width:264px;height:34px;color:#c5c5c5;">
			 <option selected="selected" style="color:black;">请选择</option>
				<c:forEach items="${applicationScope.params['temperaturePreference']}" var="temperaturePreference" varStatus="status">
					<option style="color:black;" value="<%-- ${status.index} --%>${temperaturePreference}"> ${temperaturePreference}
				</c:forEach>
			</select>
		</div>
		
		<!--湿度喜好-->
		<div class="hum">
			<span class="l8"><span class="stars" style="color:red;">*</span>湿度喜好</span>
			<select id="type5" name="type5" style="width:266px;height:34px;color:#c5c5c5;">
			<option selected="selected" style="color:black;">请选择</option>
				<c:forEach items="${applicationScope.params['humidityPreference']}" var="humidityPreference" varStatus="status">
					<option style="color:black;" value="<%-- ${status.index} --%>${humidityPreference}"> ${humidityPreference}
				</c:forEach>
			</select>
		</div>
		
		<!--土壤喜好-->
		<div class="soil">
			<span class="l9"><span class="stars" style="color:red;">*</span>土壤喜好</span>
			<select id="type6" name="type6" style="width:266px;height:35px;color:#c5c5c5;">
			<option selected="selected" style="color:black;">请选择</option>
				<c:forEach items="${applicationScope.params['soilPreference']}" var="soilPreference" varStatus="status">
					<option style="color:black;" value="<%-- ${status.index} --%>${soilPreference}"> ${soilPreference}
				</c:forEach>
			</select>
		</div>	
		
		<!--观赏特征-->
		<div class="fea">
			<span class="l10" style="margin-right: 16px;position:relative;left:8px"><span class="stars" style="color:red;">*</span>观赏特征</span>
			<select name="type7" id="type7" style="width:264px;height:34px;color:#c5c5c5;">
			<option selected="selected" style="color:black;" value="">请选择</option>
				<c:forEach items="${applicationScope.params['ornamentalFeatures']}" var="ornamentalFeatures" varStatus="status">
					<option style="color:black;" value="<%-- ${status.index} --%>${ornamentalFeatures}"> ${ornamentalFeatures}
				</c:forEach>
			</select>
		</div>
		
		<!--用途特征-->
		<div class="pur_feature">
			<span class="l122" style="margin-right:6px;"><span class="stars" style="color:red;">*</span>用途特征</span>
			<select id="type8" name="type8" style="width:692px;height:35px;color:#c5c5c5;">
			<option selected="selected" style="color:black;">请选择</option>
				<c:forEach items="${applicationScope.params['useFeatures']}" var="useFeatures" varStatus="status">
					<option style="color:black;" value="<%-- ${status.index} --%>${useFeatures}"> ${useFeatures}
				</c:forEach>
			</select>
		</div>	
		
		<!--描述-->
		<span  class="des" style="position:relative;"><p style="position:relative;left:8px">描述</p><textarea class="l12" id="pDesc" name="pDesc" style="width:689px;height:70px;" onfocus="document.getElementById('note').style.display='none'" onblur="if(value=='')document.getElementById('note').style.display='block'"></textarea>
			<div id="note" class="note">
            <font id="pleaseInput" color="#C5C5C5">请输入</font>
        </div>
		</span>
	
		
		<div id="nav_3">	
				<div id="scend_1">
					<p><span class="f4">2</span><span style="font-size:18px;">苗木价格信息</span></p>
				</div>
		<div id="add_search" class="clear">
			<!--添加价格-->
				<div id="tj" class="add_audit fl"  style="cursor: pointer;">
					<span class="iconfont icon-xinzeng" style="font-size:10px;"></span>
					<span>添加价格</span>
				</div>
		<!--给文字后的分割线设置标签-->
				<div class="f5"></div>
		<!--表格-->
		<div id="table" style="height:132px;overflow: auto;margin-top: 50px; ">
			<table border="" cellspacing="0" cellpadding="0">
		     <tr>
		     	<td style="color:#7F8FA4; ">产地</td>
		     	<td style="color:#7F8FA4; ">规格类型</td>
		     	<td style="color:#7F8FA4; ">规格</td>
		     	<td style="color:#7F8FA4; ">价格类型</td>
		     	<td style="color:#7F8FA4; ">价格</td>
		     	<td style="color:#7F8FA4; ">单位</td>
		     	<td style="color:#7F8FA4; ">报价日期</td>
		     	<td style="color:#7F8FA4; ">价格来源</td>
		     </tr>
		     
		     <tr>
		     	<td><input type="text" name="placeOrigin" placeholder="请输入"/></td>
		     	<td style="position:relative;">
		     		<li class="iconfont icon-sanjiao-xia" style="position:absolute;right:4px;top:13px;color:#666666;font-size:5px;"></li>
		     		<select name="specType" class="spec" style="color:#c5c5c5;">
		     				<option style="display:none;">请选择</option>
		     			<c:forEach items="${applicationScope.params['specType']}" var="specType" varStatus="status">
							<option style="color:#222222;" value="${status.index}"> ${specType}</option>
						</c:forEach>
		     		</select>
		     	</td>
		     	<td>
		     		<%--
		     		<c:if test="${news.newsSecType ne null && !empty news.newsSecType}">
						<c:set var="newsIndex" scope="page" value="news${news.newsType}"/>
						<select name="newsSecType" class="form-control" >
							<c:forEach items="${applicationScope.params[newsIndex]}" var="neww" varStatus="status">
								<option value="${status.index }" <c:if test="${news.newsSecType == status.index}">selected</c:if>>${neww}</option>
							</c:forEach>
						</select>
					</c:if>
					 --%>
					<%-- <c:forEach items="${applicationScope.params['specType']}" var="specType" varStatus="status">
						<c:set var="specTypeIndex" scope="page" value="specType${status.index}"/>
						<select name="specSecType" class="form-control ${specTypeIndex }"  <c:if test="${status.index != 0}">style = "display:none"</c:if>>
							<c:forEach items="${applicationScope.params[specTypeIndex]}" var="specSecType" varStatus="statu">
								<option value="${statu.index }">${specSecType}</option>
							</c:forEach>
						</select>
					</c:forEach> --%>
					<input type="text" name="spec" placeholder="请输入"/>
		     	</td>
		     	<td style="position:relative;"><!-- <input type="text" name="price"/> -->
		     		<li class="iconfont icon-sanjiao-xia" style="position:absolute;right:4px;top:13px;color:#666666;font-size:5px;"></li>
		     		<select name="priceType" style="color:#c5c5c5;">
		     			<option style="display:none;">请选择</option>
		     			<c:forEach items="${applicationScope.params['priceType']}" var="priceType" varStatus="status">
							<option style="color:#222222;" value="${status.index}"> ${priceType}</option>
						</c:forEach>
		     		</select>
		     	</td>
		     	<td><input placeholder="请输入"></td>
		     	<td style="position:relative;">
		     		<li class="iconfont icon-sanjiao-xia" style="position:absolute;right:4px;top:13px;color:#666666;font-size:5px;"></li>
		     		<select name="unitType" style="color:#c5c5c5;">
		     			<option style="display:none;">请选择</option>
		     			<c:forEach items="${applicationScope.params['unitType']}" var="unitType" varStatus="status">
							<option style="color:#222222;" value="${status.index}"> ${unitType} </option>
						</c:forEach>
		     		</select>
		     	</td>		     	
		     	<td  style="position:relative;">
		     		<!-- <li class="iconfont icon-sanjiao-xia" style="position:absolute;right:4px;top:13px;color:#666666;font-size:5px;"></li> -->
		     		<input type="text" placeholder="请输入" class="layui-input-inline">
		     	 </td>
		     	<td><input type="text" placeholder="请输入"></td>
		     	
		     </tr>			
		    </table>
		</div>
		
		</form>	
			<div id="add_search_1" class="clear_1">
					<!--添加价格-->
					<div class="add_audit fl_1">
						<span id="save" onclick="return false;" style="cursor: pointer;">确认提交</span>
						<!-- <button  onclick="return false;" id="submit">提交</button> -->
					</div>
					<div id="can" class="add_audit1 fl_2">
						<span>取消</span>
					</div>
		
			</div>
		
		
		</div>
	</body>
	<script type="text/javascript">
			/*
			报价日期
		*/
		layui.use('laydate',function(){
			var laydate = layui.laydate;
			laydate.render({
				elem:'#test11',
				format:'yyyy年MM月dd日'
			});
		})
		
	</script>
	
	
	
	<script type="text/javascript">
		$(document).ready(function(){
			var tr = $("#table").find("tr").eq(1).html();
			
			$("#tj").on("click",function(){
				$("#table").find("table tbody").append("<tr>"+tr+"</tr>");
			})
		});	
		
		/*
			表格内容格式化成json
		*/
	 	tabFormatToJson = function(e){
			var obj;
	 		return obj;
	 	}
		
		/*
			切换选项
		*/
		$("#table").on("change",".spec",function(){
			var that = $(this);
			var parent = that.parent().parent();
			var value = that.val();
			$(parent).find("select[class*='specType']").css("display","none");
			$(parent).find("select[class*='specType']").prop("disabled",true);
			
			$(parent).find("select[class*='specType"+value+"']").css("display","block");
			$(parent).find("select[class*='specType"+value+"']").prop("disabled",false);
		});
	
		$("#save").click(function(){
			
			
			var plantName = $("input[name='plantName']").val(); 
	 		var aliasName = $("[name='aliasName']").val(); 
	 		var pDesc = $("[name='pDesc']").val();
	 		var type = $("select[name='type']").val(); 
	 		var type1 = $("select[name='type1']").val(); 
	 		var type2 = $("select[name='type2']").val(); 
	 		var type3 = $("select[name='type3']").val(); 
	 		var type4 = $("select[name='type4']").val(); 
	 		var type6 = $("select[name='type6']").val(); 
	 		var type7 = $("select[name='type7']").val(); 
	 		var type8 = $("select[name='type8']").val(); 
	 		var select = '请选择';
	 		var volidate = plantName==''||type==select||type1==select||type2==select||type3==select||type4==select||type6==select||type7==select   
	 		if(volidate){
	 			alert("请完善带*的苗木基本信息");
	 			return false;
	 		}
	 		
			//表格内容格式化成json
			var JsonData = {
	 				placeOrigin:"",
	 				specType:"",
	 				spec:"",
	 				price:"",
	 				unitType:"",
	 			}
 			var json = [];
	 		var table = $("#table table");
 			var tr = table.find("tr:gt(0)");
 			var flag = false;
 			tr.each(function(inde2,item2){
 				var JsonData = new Object();
 				JsonData.placeOrigin = $(item2).find("input[name='placeOrigin']").val();
 				JsonData.specType = $(item2).find("select[name='specType'] :selected").val();
 				//JsonData.spec = $(item2).find(".specType"+JsonData.specType+" :selected").val();
 				JsonData.spec = $(item2).find("input[name='spec']").val();
 				JsonData.price = $(item2).find("input[name='price']").val();
 				JsonData.unitType = $(item2).find("select[name='unitType'] :selected").val();
 				JsonData.priceType = $(item2).find("select[name='priceType'] :selected").val();//1.上车价格，2.到场价 
 				if(JsonData.placeOrigin == "" || JsonData.price == ""){
 					flag = true;
 				}
 				json.push(JsonData);
 			});
	 		var obj = JSON.stringify(json);
	 		if(flag){
	 			alert("请填写完价格表!");
	 			return false;
	 		}
	 		//放入隐藏的input域
	 		$("input[name='jsonData']").val(obj);
	 		
			$.ajax({
				type:"post",
				/*url:"${pageContext.request.contextPath}/plant/insert",*/ //添加苗木这是以前的方案
				url:"${pageContext.request.contextPath}/plant/insert2",//添加苗木方案2此方案测试中
				data: $("#add").serialize(),
				dataType:"json",
				success:function(data){
					if(data.status == "success"){
						/* window.location.href="${pageContext.request.contextPath}/plant/toList"; */
						window.history.go(-1);
					}else{
						alert("保存出错");
					}
				},
				error:function(){
					alert("服务器异常");
				}
			});
			
		});
		
		
		
		
		
	</script>
	
	<script>
	/*
	 *@description: 获取焦点弹出选择框
	 *@author: Cao Mingfei
	 *@createDate: 2018-5-23
	 * */ 
	 
	 
	
	
	 (function ($) {
         $.fn.watch = function (callback) {
             return this.each(function () {
                 //缓存以前的值  
                 $.data(this, 'originVal', $(this).val());

                 //event  
                 $(this).on('keyup paste', function () {
                     var originVal = $.data(this, 'originVal');
                     var currentVal = $(this).val();

                     if (originVal !== currentVal) {
                         $.data(this, 'originVal', $(this).val());
                         callback(currentVal);
                     }
                 });
             });
         }
     })(jQuery);
	 
	 $("#plantNameID").watch(function(value) {  
		  var reg = new RegExp("[\\u4E00-\\u9FFF]+","g");
		  if(reg.test(value)){     
			  searchPlantByName(value);
		  }
		  
		}); 
	 
	function searchPlantByName(value){
		
		$.ajax({
			type:"post",
			/* url:"${pageContext.request.contextPath}/plant/insert", *///添加苗木这是以前的方案
			url:"${pageContext.request.contextPath}/plant/searchPlantsByName",//添加苗木方案2此方案测试中
			data: {"plantName":value},
			
			dataType:"json",
			success:function(data){
				/* 
				for(var i in data){
						 var plant =　data[i];
					
						 
					} */
					
					if(data.length>0){
						
						$("#search_selectorID").show();
						var html='';
						var nick = "nick"
						$.each(data,function(i,va){
							html +="<li id='"+nick+""+i+"' onclick='plantNameClick("+i+")'>"+va.plantName+"</li>"
						});
						 
						
						 
						$("#search_selectorID").html(html);
						
					}else{
						/* $("#search_selectorID").hide(); */
					}
				 
					
			},
			error:function(){
				
			}
			
		});
	};
	
	
	/*动态改变“名称”值  */
   function	plantNameClick(i){
		var c = "#nick" + i;
		var $plantNameID = $("#plantNameID");
		var html = $(c).html();
		
//		console.log(html);
/*
	  $("input").remove("#plantNameID");
		$("#name_input").append('<input type="text" name="plantName" style="width:260px;height:30px;" id="plantNameID" value= "" />');
		$("#name_input").find("#plantNameID").val(html) 		
*/
		$plantNameID.val(html);
		 /*名称选择浮层隐藏  */
		 var $s_selector = $(".search_selector");
		 $s_selector.css({"z-index":"0","opacity":"0"});
		 /* 将搜索到的苗木回显到当前页面中 */
		 $.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/plant/getPlantByPlantName",//获取苗木信息
				data: {"plantName":html},
				
				dataType:"json",
				success:function(data){
					//debugger;
					//回显别名并标记为不可编辑
					$("#aliasName").val(data.aliasName)
					$("#aliasName").attr("disabled","disabled");
					
					//回显苗木类型并标记为不可编辑
					$.each($("#type option"),function(i,a){
						//alert(a.value)
						if(data.type == a.value){
							//alert(a.value)
							//a.selected = 'selected';
							$(a).prop("selected","selected");
							$("#type").attr("disabled","disabled");

						} 
					});
					//回显适应地区并标记为不可编辑
					/* $.each($("#type1 option"),function(i,a){
						//alert(data.adaptableArea)
						if(data.adaptableArea == a.value){
							//alert(a.value)
							a.selected = 'selected';
							$("#type1").attr("disabled","disabled");

						} 
					}); */
					$("#adaptableArea").val(data.adaptableArea);
					$("#adaptableArea").attr("disabled","disabled");
					
					//回显树形特征并标记为不可编辑
					$.each($("#type2 option"),function(i,a){
						//alert(a.value)
						if(data.type == a.value){
							//alert(i)
							//alert(a.value)
							a.selected = 'selected';
							$("#type2").attr("disabled","disabled");

						} 
					});
					//回显阳光喜好并标记为不可编辑
					$.each($("#type3 option"),function(i,a){
						//alert(a.value)
						if(data.sunshinePrefer == a.value){
							//alert(i)
							//alert(a.value)
							a.selected = 'selected';
							$("#type3").attr("disabled","disabled");

						} 
					});
					//回显温度喜好并标记为不可编辑
					$.each($("#type4 option"),function(i,a){
						//alert(a.value)
						if(data.temperaturePrefer == a.value){
							//alert(a.value)
							a.selected = 'selected';
							$("#type4").attr("disabled","disabled");

						} 
					});
					//回显湿度喜好并标记为不可编辑
					$.each($("#type5 option"),function(i,a){
						//alert(a.value)
						if(data.humidityPrefer == a.value){
							//alert(a.value)
							a.selected = 'selected';
							$("#type5").attr("disabled","disabled");

						} 
					});
					//回显观赏特征并标记为不可编辑
					$.each($("#type6 option"),function(i,a){
						//alert(a.value)
						if(data.ornamentalFeat == a.value){
							//alert(a.value)
							a.selected = 'selected';
							$("#type6").attr("disabled","disabled");

						} 
					});
					//回显土壤喜好并标记为不可编辑
					$.each($("#type7 option"),function(i,a){
						//alert(a.value)
						if(data.type == a.value){
							//alert(a.value)
							a.selected = 'selected';
							$("#type7").attr("disabled","disabled");

						} 
					});
					//回显用途特征并标记为不可编辑
					$.each($("#type8 option"),function(i,a){
						//alert(a.value)
						if(data.useFeat == a.value){
							//alert(a.value)
							a.selected = 'selected';
							$("#type8").attr("disabled","disabled");

						} 
					});
					//回显描述并标记为不可编辑
					$("#pDesc").val(data.pDesc);
					$("#pDesc").attr("disabled","disabled");
					$("#pleaseInput").css("display","none");
					
					$("#F_img img").attr("src","<%=request.getContextPath() %>/"+data.photo);
				},
				error:function(){
					
				}
				
			});
	  }

	/*名称选择浮层显示  */
	(function(){
		 var $n_input = $(".name input");
		 var $s_selector = $(".search_selector");
		 $n_input.focus(function(){
			 $s_selector.css({"display":"block","z-index":"100","opacity":"1"});
		 });
	 })();
	
	</script>
	
</html>
