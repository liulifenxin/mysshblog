	<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/audit-asset/css/priceQuery.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/audit-asset/css/iconfont/iconfont.css" />
	<link rel="stylesheet"	href="${pageContext.request.contextPath}/audit-asset/css/layui.css">	
	<script type="text/javascript" src="${pageContext.request.contextPath }/audit-asset/js/echarts.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/audit-asset/js/jquery-3.2.1.js" ></script>
	<script	src="${pageContext.request.contextPath}/audit-asset/layui/layui.js"></script>
	<script	src="${pageContext.request.contextPath}/audit-asset/layui/layui.all.js"></script>
</head>
<body >
		<!-- <div style="width: 100px; height: 5000px; background-color: red; padding-bottom: 30px; border: 10px solid blue;"></div> -->
<div id="price_info" style="padding-bottom: 80px;">
		<!--价格信息头部 start-->
		<div id="info_header" style="border-bottom: 1px solid #eee;">
			<p>
				<span>苗木价格查询</span>
				<span>|</span>
				<span>查询结果</span>
				<span>|</span>
				<span>${plant.plantName }</span>
			</p>
		</div>
		<!--价格信息头部 end-->	
		
		<!--价格信息内容 start-->
		<div id="info_content">
			<div>
				<p>${plant.plantName }</p>
				<p>
					<span ><i class="iconfont icon-yangguang" style="color:#FB7A97"></i>${plant.sunshinePrefer }</span>
					<span><i class="iconfont icon-wendu" style="color:#FA9F6D"></i>${plant.temperaturePrefer }</span>
					<span><i class="iconfont icon-shidu" style="color:#3BAEDC"></i>${plant.humidityPrefer }</span>
					<span><i class="iconfont icon-turang" style="color:#DC9151"></i>${plant.soilLike }</span>
				</p>				
				<p>别名：${plant.aliasName }</p>
				<p>描述：${plant.pDesc }</p>
				<p>
					<span>苗木类型：${plant.type }</span>
					<!-- <span>适应地区：华南、华北</span><br /> -->
					<span>观赏特征：${plant.ornamentalFeat }</span>	
					<span>用途特征：${plant.useFeat }</span>				
				</p>
				<p><span>单株生长面积：${plant.singleplantArea }㎡</span><span>规模种植产地：${plant.originPlace }</span></p>
				<p><span>常用规格类型：${plant.specType }</span><span>常用规格范围：
					<c:if test="${plant.specType eq '胸径' }">
						Φ${plant.specScope }cm
					</c:if>
					<c:if test="${plant.specType eq '基径' }">
						Φ${plant.specScope }cm
					</c:if>
					<c:if test="${plant.specType eq '地径' }">
						Φ${plant.specScope }cm
					</c:if>
					<c:if test="${plant.specType eq '冠幅' }">
						${plant.specScope }cm
					</c:if>
					<c:if test="${plant.specType eq '冠丛高' }">
						${plant.specScope }cm
					</c:if>
					<c:if test="${plant.specType eq '杆数_每丛' }">
						${plant.specScope }
					</c:if>
					<c:if test="${plant.specType eq '干高' }">
						${plant.specScope }cm
					</c:if>
					<c:if test="${plant.specType eq '藤长' }">
						${plant.specScope }cm
					</c:if>
					<c:if test="${plant.specType eq '草坪' }">
						${plant.specScope }
					</c:if>
					
				
				</span></p>
				<p><i id="map" class="iconfont icon-xinxitishi">&nbsp;</i><span>适应区域：${plant.adaptableArea }</span></p>
				<p><i id="zw"  class="iconfont icon-xinxitishi">&nbsp;</i><span>树形特征：${plant.treeFeat }</span></p>

			</div>
			<div style="float: right;">
				<img src="${pageContext.request.contextPath }${plant.photo}" /> 
				<div><a href="javascript:void(0);" onclick="more_img()" style="padding:10px;float:right;color:#1A89E8 ">更多图片></a></div>			
			</div>
		</div>
		<!--价格信息内容 end-->		
		
		<!--苗木价格 start-->		
		<div id="info_price">
<!-- 			<p><span>苗木价格</span><span>算法：</span><div id="ways"><span>均值法</span><span>权重法</span><span>权威法</span></div></p> -->
 			<p><i>苗木价格</i><i>算法:</i>
 				<select name ="sf" id ="suanfaID">
 					<option style="display: none">均值法</option>
					<option value="0" >均值法</option>
					<option value="1">权重法</option>
					<option value="2">权威法</option>
				</select></p>
			<c:forEach items="${plant.seedFormats}" var="seedFormat" varStatus="status">
				<p>
					<span>${seedFormat.specTypeString}:${seedFormat.spec}</span>
					<span>产地：${seedFormat.placeOrigin } 成都</span>
					<span>最近价格：<fmt:formatNumber type="number" value="${seedFormat.avgPrice}" pattern="0.00" maxFractionDigits="2"/>/株</span>					
					<span class="price_detail" onclick="show(${seedFormat.id})">历史价格&nbsp;<i id="xs${seedFormat.id}" class="iconfont icon-sanjiao-xia" style="font-size: 12px;"></i></span>
				</p>
				<ul class="clear show${seedFormat.id}" style="display: none; height: 360px;" >
					<li>
						<span>近期价格变化曲线</span>
						<span class="date_wrap" style:"margin-left:2px;">
						<input type="text" name="startDate" id="date"   lay-verify="date"	placeholder="开始日期" autocomplete="off" class="layui-input${seedFormat.id}" style="text-align:center;">
						至<input type="text" name="endDate" id="date2"  lay-verify="date"	placeholder="结束日期" autocomplete="off" class="layui-input_${seedFormat.id}" style="text-align:center;"><span class="iconfont icon-riqi"></span>
					</li>
					<li class="price_change${status.index } fl"></li>

				</ul>
				<input type="hidden" value="${seedFormat.priceListStr}" class="priceList${status.index }">
				<input type="hidden" value="${seedFormat.timeListStr}" class="timeList${status.index }">
				<input type="hidden" value="${seedFormat.priceInfos}" class="priceInfos${status.index }">
				
			</c:forEach>
			
		</div>
		
		<!-- <script>
			var countSize = "${countSize}";
			debugger;
			var bodyHeight=600;
			for(var i = 0; i < countSize ; i++){
				bodyHeight += 30
				/* if (i==countSize-1) {
					bodyHeight+=70;
				} */
			} 
			document.getElementsByTagName("body")[0].style.height = bodyHeight + "px"
		</script> -->
		
		<!--苗木价格 end-->		
	</div>
	
<!-- datepicker  -->	
<script>
	//查看更多图片外链
	function more_img(){
		var href1 = "https://image.baidu.com/search/index?tn=baiduimage&ipn=r&ct=201326592&cl=2&lm=-1&st=-1&fm=result&fr=&sf=1&fmq=1531278390917_R&pv=&ic=0&nc=1&z=&se=1&showtab=0&fb=0&width=&height=&face=0&istype=2&ie=utf-8&hs=2&word="+'${plant.plantName}';
		window.open(href1);  
	}
	//刷新一种规格的价格信息
	function chartInit(data_source,index){
		/* alert(data_source);
		alert(index); */
		debugger;
		var data_a = data_source.priceListStr
			//debugger;
			var data_as = data_a.split(",");
			var data = new Array();
			for (var index_2 = data_as.length-1; index_2 >= 0; index_2--) {
				data.push(parseFloat(data_as[index_2]).toFixed(2));
			}
			
			var dataTime_a =data_source.timeListStr;
			
			var dataTime_as = dataTime_a.split(",");
			var dataTime = new Array();
			for (var index_2 = dataTime_as.length-1; index_2 >= 0; index_2--) {
				dataTime.push(dataTime_as[index_2]);
			}
			
		 var c = document.getElementsByClassName("price_change"+index);
		var myChart= echarts.init(c[0]);
		var option = {
				title:{
					text:'',
					textStyle:{
						color: '#7F8FA4',
						fontSize: 14
					}
				},
				tooltip : {
			        trigger: 'axis',
				    enterable:true,
				    hideDelay:10,
				    backgroundColor: 'rgba(255,255,255,1)',//背景颜色（此时为默认色）
				    borderRadius: 5,//边框圆角
				    padding: 14,    // [5, 10, 15, 20] 内边距
				    textStyle:{
				        color:'#000'
				    },
				    /* dataSource */
				    formatter:function(params, ticket, callback) {
				    	
                        var res =  '' + params[0].name + '  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>价格      :  ￥' + params[0].value+'</b>'+'</br></hr>';
                        var month = params[0].name;
                        $.ajax({
     						url : "${pageContext.request.contextPath }/front/price/queryPriceEveryDay",
     						data : {
     							"seedformatId" : '${seedFormat.id}',
     							"month":month
     						},
     						dataType : "json",
     						type : "post",
     						success : function(data) {
     							if (data) {//成功
     								
     								for(var i=0; i<data.length;i++){
     									var da = data[i];
     									/* alert(da.price);
     									alert(da.dataSource); */
     									res+='</br>'+da.dataSource+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+da.price;
     								}
     								callback(ticket, res);
     							}
     						},
     						error : function() {
     						
     						}
     			       });
                         
                        return 'loading';
                    }
				    
			    },
			    grid:{
			    	show: true
			    },
			    calculable : true,
			    dataZoom: [
			    {
			        type: 'slider',
			        startValue: 1,
			        endValue: 2,
			        handleStyle:{color:'#d0d0d0'}
			    }, 
			    {
			        type: 'inside',
			        start:0,
			        end: 20
			   	 }],
				xAxis:[
					{
						type:'category',
						boundaryGap:false,
						axisLabel:{
							fontSize:10
						},
						data:dataTime
					},

				],
				yAxis:[
					{
						type:'value',
						name:'元',
						axisLabel:{
							formatter:'{value}'
					 },
					 splitLine:{
							show: false
						}
				},

				],
				series:[
					{
						name:'均值',
						type:'line',
						itemStyle:{
							color:'#1FCE7F'
						},
						lineStyle:{
							normal:{
								color:'#1FCE7F'
							}
						},
						areaStyle:{
							normal:{
								color:{
							    type: 'linear',
							    x: 0,
							    y: 0,		
							    x2: 0,
							    y2: 1,
							    colorStops: [{
							        offset: 0, color: 'rgba(31,206,127,0.35)' // 0% 处的颜色
							    }, {
							        offset: 1, color: 'rgba(31,206,127,0.00)' // 100% 处的颜色
							    }],
							    globalCoord: false // 缺省为 false
							}
							}
						},
						data:data
					},


				]
			};
			
	   		 myChart.setOption(option);
		
	}

	/*
	*	请求当前规格在选中时间段的价格信息
	*/
	//String seedFormatId,String startDate,String endDate,String sf
	function getPriceBySeedFormatId(id,start_date,end_date,index){
	
			//debugger;
			$.ajax({
						url : "${pageContext.request.contextPath}/front/price/priceByDateInterval",
						data : {
							"seedFormatId" : id,
							"startDate":start_date,
							"endDate":end_date,
							"sf":'${suanfa}'
						},
						dataType : "json",
						type : "get",
						success : function(data) {
							
							if (data) {//成功
								chartInit(data,index);
							}
						},
						error : function() {
						
						}
			       });
			
		
	}


	var auditStage = "";
	layui.use([ 'form', 'laydate' ], function() {
		var form = layui.form;
		var laydate = layui.laydate;
		var start_date = "";
		var end_date = ""; 
		
		 <c:forEach items="${plant.seedFormats}" var ="seedFormat" varStatus="status">
			//日期
			laydate.render({
				elem : '.layui-input${seedFormat.id}',
				done: function(value, date, endDate){//控件选择完毕后的回调---点击日期、清空、现在、确定均会触发。
					start_date = "";
					start_date = value;
					if(start_date&&end_date){
						getPriceBySeedFormatId(seedFormat.id,start_date,end_date,'${status.index}');
					}  
				  }
			});
			laydate.render({
				elem : '.layui-input_${seedFormat.id}',
				done: function(value, date, endDate){//控件选择完毕后的回调---点击日期、清空、现在、确定均会触发。
					end_date = "";
					end_date = value;
					if(start_date&&end_date){
							getPriceBySeedFormatId('${seedFormat.id}',start_date,end_date,'${status.index}');
					}  
				  }
			});
		</c:forEach>
	
	});
</script>

<script type="text/javascript">
</script> 

<script type="text/javascript">










</script>

<%-- <script src="${pageContext.request.contextPath }/audit-asset/js/priceChange.js"></script> --%>

<script>

/*
 *@fileName: 显示隐藏价格图表
 *@author: Cao Mingfei
 *@createDate: 2018-5-23 
 * */
 

	/*显示隐藏价格图表*/
	function show(id) {
		var c = '.show'+id;
		var $price_changeDetail=$(c);
		var xs = '#xs'+id;
		
			if($price_changeDetail.css('display')=='none'){
				$price_changeDetail.show();
				$(xs).removeClass("icon-sanjiao-xia").addClass("icon-sanjiao-shang");
			}else{
				$price_changeDetail.hide();
				$(xs).removeClass("icon-sanjiao-shang").addClass("icon-sanjiao-xia")
		}
	}

	/*点击i显示地图  */
	(function(){
		var $i_c_map = $("#map");
		$i_c_map.click(function(){
			parent.showMap()
		})
	})();
	
	
	/*点击i显示植物  */
	(function(){
		var $i_c_botany = $("#zw");
		$i_c_botany.click(function(){
			parent.showBotany()
		})
	})();

</script>
<script type="text/javascript">


    
	$(document).ready(function(){

		/**
		* 均值法，权重法qi
		*/
		var selector =	$("#suanfaID");

	      var sf =   '${suanfa}';
		selector.find('option[value='+sf+']').attr("selected",true);
		
		selector.change(function(){
		    var opt=$(this).val();
		  
		    console.info(opt);
		   	if(opt=='2')return;
		    window.location.href="${pageContext.request.contextPath }/front/price/priceInfo?plantId=${plant.plantId}&sf="+opt
		}); 
		
		
		var qq=20;
		var count = "${fn:length(plant.seedFormats)}";
		
		
		if(count != undefined && count > 0){
			<c:forEach items="${plant.seedFormats}" var="seedFormat" varStatus="status" >
			var data_a = "${seedFormat.priceListStr}"
			//debugger;
			var data_as = data_a.split(",");
			var data = new Array();
			for (var index_2 = data_as.length-1; index_2 >= 0; index_2--) {
				data.push(parseFloat(data_as[index_2]).toFixed(2));
			}
			
			
			var dataTime_a ="${seedFormat.timeListStr}"
			
			var dataTime_as = dataTime_a.split(",");
			var dataTime = new Array();
			for (var index_2 = dataTime_as.length-1; index_2 >= 0; index_2--) {
				dataTime.push(dataTime_as[index_2]);
			}
			//var data = [1,2,3,4,5];
			//var  dataTime = ['a','b','c','d','e'];
			
			console.log(dataTime);
			console.log(eval(dataTime));
			var c = document.getElementsByClassName("price_change"+'${status.index}');
			
			var myChart= echarts.init(c[0]);
			
			
			var option = {
				title:{
					text:'',
					textStyle:{
						color: '#7F8FA4',
						fontSize: 14
					}
				},
				tooltip : {
			        trigger: 'axis',
				    enterable:true,
				    hideDelay:10,
				    backgroundColor: 'rgba(255,255,255,1)',//背景颜色（此时为默认色）
				    borderRadius: 5,//边框圆角
				    padding: 14,    // [5, 10, 15, 20] 内边距
				    textStyle:{
				        color:'#000'
				    },
				    /* dataSource */
				    formatter:function(params, ticket, callback) {
				    	
                        var res =  '' + params[0].name + '  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>价格      :  ￥' + params[0].value+'</b>'+'</br></hr>';
                        var month = params[0].name;
                        $.ajax({
     						url : "${pageContext.request.contextPath }/front/price/queryPriceEveryDay",
     						data : {
     							"seedformatId" : '${seedFormat.id}',
     							"month":month
     						},
     						dataType : "json",
     						type : "post",
     						success : function(data) {
     							if (data) {//成功
     								
     								for(var i=0; i<data.length;i++){
     									var da = data[i];
     									/* alert(da.price);
     									alert(da.dataSource); */
     									res+='</br>'+da.dataSource+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+da.price;
     								}
     								callback(ticket, res);
     							}
     						},
     						error : function() {
     						
     						}
     			       });
                         
                        return 'loading';
                    }
				    	
				    /* function (params, ticket, callback) {
				    	var month =  params[0].axisValue;
				    	
				       
				        
				        return 'Loading';
				    }  */

				    /* '{b} '+'    ￥{c}'+'/株'+'<hr/>'+'价格计算来源'+'<br/>'+'<c:forEach items ="${seedFormat.everyDaypriceInfos[status.index].everDayPriceInfo}" var="priceInfo" varStatus="status"> "${priceInfo.dataSource}      ￥${priceInfo.price}"  </br> </c:forEach>' */ 
				    
			    },
			    grid:{
			    	show: true
			    },
			    calculable : true,
			    dataZoom: [
			    {
			        type: 'slider',
			        startValue: 1,
			        endValue: 2,
			        handleStyle:{color:'#d0d0d0'}
			    }, 
			    {
			        type: 'inside',
			        start:0,
			        end: 20
			   	 }],
				xAxis:[
					{
						type:'category',
						boundaryGap:false,
						axisLabel:{
							fontSize:10
						},
						data:dataTime
					},

				],
				yAxis:[
					{
						type:'value',
						name:'元',
						axisLabel:{
							formatter:'{value}'
					 },
					 splitLine:{
							show: false
						}
				},

				],
				series:[
					{
						name:'均值',
						type:'line',
						itemStyle:{
							color:'#1FCE7F'
						},
						lineStyle:{
							normal:{
								color:'#1FCE7F'
							}
						},
						areaStyle:{
							normal:{
								color:{
							    type: 'linear',
							    x: 0,
							    y: 0,		
							    x2: 0,
							    y2: 1,
							    colorStops: [{
							        offset: 0, color: 'rgba(31,206,127,0.35)' // 0% 处的颜色
							    }, {
							        offset: 1, color: 'rgba(31,206,127,0.00)' // 100% 处的颜色
							    }],
							    globalCoord: false // 缺省为 false
							}
							}
						},
						data:data
					},


				]
			};
			
	   		 myChart.setOption(option);
			</c:forEach>
			}
	});
</script>
</body>
</html>
