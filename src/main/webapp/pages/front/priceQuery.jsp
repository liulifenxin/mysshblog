<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/audit-asset/css/iconfont/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/audit-asset/css/index.css">
<link rel="stylesheet" type="text/css"
	href="//at.alicdn.com/t/font_652554_flec2w9p7ousor.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/audit-asset/css/garden_audit.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/audit-asset/css/iconfont/iconfont.css" />
<link
	href="<%=request.getContextPath()%>/sweetAlert/css/sweet-swal.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/sweetAlert/js/sweet-swal.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/audit-asset/js/jquery-3.2.1.js"></script>	

<style>
/*修改浮层框*/
/* .list2{width: 100px; height: 30px; background-color: red; margin-bottom: 10px;} */
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

</style>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/audit-asset/js/jquery-3.2.1.js"></script>
<title>index</title>
</head>
<body style="overflow:hidden;">
	<div id="header_nav" style="width:100%;background-color: #1D2D4D;">
		<div id="menu">
			<div class="one">
				<div class="iconfont icon-logo"
					style="font-size:32px;opacity:0.6;float:left;cursor:pointer;">
					<span
						style="font-family: MicrosoftYaHei-Bold;font-size: 14px;letter-spacing: 1.17px;position:relative;top:-7px;margin-left:5px;">成都市温江苗木审计平台</span>
				</div>
			</div>
			<div class="two">
				<ul>
					<li style="color:#0BBA6B; background-color: #0F1A32; opacity: 1;">苗木价格查询</li>
					<li>园林审计</li>
					<li>苗木信息录入</li>
					<li>园林设计支撑</li>
					<li>统计分析</li>
				</ul>
				<div class="underline">
					<i style="background-color:#0BBA6B"></i> <i></i> <i></i> <i></i> <i></i>
				</div>
			</div>
			<div class="three">
				<div class="headPortrait">
					<img
						src="${pageContext.request.contextPath }/audit-asset/img/touxiang.png"
						style="width:36px;height:36px"> <span
						class="iconfont icon-sanjiao-xia"></span>
				</div>
				<div id="exit" style="cursor: pointer;">
					<span class="iconfont icon-tuichu" style="font-size: 18px;">&nbsp;</span><span>退出登录</span>
				</div>
			</div>
		</div>
	</div>

	<iframe
		src="${pageContext.request.contextPath }/front/price/toPriceQuery"
		frameborder="0" width="100%" id="frame" name="frame"
		onload="changeFrameHeight()" scrolling="auto"></iframe>

	<!--价格推算 start -->
	<div id="calc_cover">
		<div id="calc_table">
			<div class="c_t_wrap clear">
				<p>
					<span class="fl">此价格为系统推算后的到场价，推算规则如下：</span><span class="close fr">×</span>
				</p>
				<table class="table_1">
					<tr>
						<th>苗木类型</th>
						<th>规格类型</th>
						<th>到场价</th>
						<th>备注</th>
					</tr>
					<tr>
						<td rowspan="2" class="td_1">藤木/竹类/球根花卉/水生花卉/宿根花卉/一二年生花卉/草坪地被植物</td>
						<td>所有</td>
						<td>=地价*(1+5%+10%)</td>
						<td>经纪人10%，运输5%</td>
					</tr>
					<tr>
						<td>所有</td>
						<td>=上车价*(1+5%)</td>
						<td>运输5%</td>
					</tr>
					<tr class="height_80">
						<td rowspan="4" class="td_1">落叶针叶树/落叶阔叶树/常绿阔叶树/常绿针叶树</td>
						<td>胸径/地径/分支点粗度</td>
						<td>=地价*(1+5%+10%)+(起挖环节对应系数)+(包装环节对应系数)+(上车环节对应系数)</td>
						<td>经纪人10%，运输5%</td>
					</tr>
					<tr class="height_80">
						<td>胸径/地径/分支点粗度</td>
						<td>=上车价*(1+5%)</td>
						<td>运输5%</td>
					</tr>
					<tr class="height_80">
						<!--	<td rowspan="2" class="td_1">草坪地被植物</td>   -->
						<td>高/冠幅</td>
						<td>=地价*(1+5%+10%+10.5%)</td>
						<td>经纪人10%.运输5%,通用系数10.5%</td>
					</tr>
					<tr class="height_80">
						<td>高/冠幅</td>
						<td>=上车价*(1+5%)</td>
						<td>运输5%</td>
					</tr>
				</table>
				<table class="table_2">
					<tr>
						<th>系数名</th>
						<th>参数</th>
						<th>系数</th>
					</tr>
					<tr>
						<td>经纪人环节</td>
						<td>/</td>
						<td>*10%</td>
					</tr>
					<tr>
						<td>起挖环节</td>
						<td>3cm以下</td>
						<td>+15</td>
					</tr>
					<tr>
						<td>起挖环节</td>
						<td>4cm</td>
						<td>+25</td>
					</tr>
					<tr>
						<td>起挖环节</td>
						<td>5cm</td>
						<td>+30</td>
					</tr>
					<tr>
						<td>起挖环节</td>
						<td>6cm</td>
						<td>+40</td>
					</tr>
					<tr>
						<td>起挖环节</td>
						<td>7cm</td>
						<td>+60</td>
					</tr>
					<tr>
						<td>起挖环节</td>
						<td>8cm</td>
						<td>+70</td>
					</tr>
					<tr>
						<td>起挖环节</td>
						<td>10-12cm</td>
						<td>+110</td>
					</tr>
					<tr>
						<td>起挖环节</td>
						<td>13-15cm</td>
						<td>+200</td>
					</tr>
					<tr>
						<td>起挖环节</td>
						<td>16-20cm</td>
						<td>+300</td>
					</tr>
					<tr>
						<td>起挖环节</td>
						<td>21-25cm</td>
						<td>+500</td>
					</tr>
					<tr>
						<td>起挖环节</td>
						<td>26-30cm</td>
						<td>+700</td>
					</tr>
					<tr>
						<td>包装环节</td>
						<td>10cm以下</td>
						<td>+10</td>
					</tr>
					<tr>
						<td>包装环节</td>
						<td>11-20cm</td>
						<td>+20</td>
					</tr>
					<tr>
						<td>包装环节</td>
						<td>21-30cm</td>
						<td>+40</td>
					</tr>
					<tr>
						<td>包装环节</td>
						<td>31-40cm</td>
						<td>+100</td>
					</tr>
					<tr>
						<td>上车环节</td>
						<td>20cm以下</td>
						<td>+50</td>
					</tr>
					<tr>
						<td>上车环节</td>
						<td>21-25cm</td>
						<td>+100</td>
					</tr>
					<tr>
						<td>上车环节</td>
						<td>26-30cm</td>
						<td>+200</td>
					</tr>
					<tr>
						<td>上车环节</td>
						<td>31-40cm</td>
						<td>+300</td>
					</tr>
					<tr>
						<td>运输环节</td>
						<td>/</td>
						<td>+5%</td>
					</tr>
				</table>

			</div>
		</div>
	</div>
	<!--价格推算 end -->

	<!--收藏夹 start -->
	<div id="s_c_cover">
		<div class="s_c_list">
			<div class="s_c_l_wrap">
				<p>
					<i class="iconfont icon-shoucangjia-xianxing"></i> <span>收藏夹</span>
					<span>（<span id ="folder">14</span>）
					</span> <span class="fr close" style="font-size: 30px;" onclick="exitList()" >×</span>
				</p>
				<div class="s_c_button">
					<span style="cursor:pointer;margin-right:3px;background-color:#EEEEEE;" id="output"  onclick="outputGroup();">导出</span> 
					<span style="cursor:pointer;margin-right:3px;background-color:#EEEEEE;" id="delete01" onclick="deleteGroup();">删除</span> 
					<span style="cursor:pointer;background-color:#FFFFFF;color:#000000;" onclick="delect_all();">清空</span>
					<!-- 清空的弹窗 -->
					<div id="delect_fl" class="delect" style="top:107px;right:20px;">
						<form>
							<p style="margin-left: 20px;">是否清空收藏夹中所有苗木？</p>
							</hr>
							<p style="margin-left: 40px;margin-top: 55px;">
								<span style="background-color:#EC3F4E;cursor:pointer;" class="del" onclick="del_all('${sessionScope.user.number}');">清空</span>
								<span class="cancel" onclick="delect_all()">取消</span>
							</p>
							<p class="tl" style="margin-top: -3px;">
								<img style="margin-left: 225px;" src="${pageContext.request.contextPath }/audit-asset/img/tooltip_arrow.png" />
							</p>
						</form>
					</div>
					<!-- 删除的弹窗 -->
					<div id="delect_rf" class="delect" style="top:103px;right:105px;display:none;">
						<form>
							<p style="margin-left: 20px;">是否从收藏夹中删除苗木？</p>
							</hr>
							<p style="margin-left: 40px;margin-top: 55px;">
								<span style="background-color:#EC3F4E;cursor:pointer;" class="del" onclick="del_group()">删除</span>
								<span class="cancel" onclick="deleteGroup()">取消</span>
							</p>
							<p class="tl" style="margin-top: -3px;">
								<img style="margin-left: 225px;" src="${pageContext.request.contextPath }/audit-asset/img/tooltip_arrow.png" />
							</p>
						</form>
					</div>
					
				</div>
			</div>
			<div style="height:2%;width:100%;border-top:1px solid #EEEEEE;"></div>
			<div class="s_c_l_wrap" style="height:100%;">	
			 
			  <div style="height:100%;width:256px;overflow:hidden;font-size:14px;color:#222222;letter-spacing: 1px;">
			     <div id="s_c_l_w_list" class="iconfont" style="height:83%;width:276px;overflow-y:scroll;overflow-x:hidden;font-size:14px;color:#222222;letter-spacing: 1px;">
				 </div>
			  </div>
			</div>
		</div>
	</div>
	<!--收藏夹 end -->
	
	<!--地图 start -->
	<div id="map_cover">
		<div class="m_list" style="overflow:scroll;">
			<div class="m_l_wrap">
				<p>
					<span class="fl">中国主要城市园林植物区划</span> <span class="fr close iconfont icon-guanbi" style="font-size: 18px; color: #888;"></span>
				</p>
				<div class="map_pic">
					<img
						src="${pageContext.request.contextPath }/audit-asset/img/zone.png">
				</div>

				<table>
					<tr>
						<th>区域代号及名称</th>
						<th>区域内主要城市</th>
					</tr>
					<tr>
						<td>I区 寒温带针叶林区</td>
						<td>漠河，黑河</td>
					</tr>
					<tr>
						<td>II区 温带针阔叶混交林区</td>
						<td>哈尔滨，牡丹江，鹤岗，鸡西，双鸭山，伊春，佳木斯，长春，四平，延吉，抚顺，铁岭，本溪</td>
					</tr>
					<tr>
						<td>III区 北部暖温带落叶阔叶林区</td>
						<td>沈阳，葫芦岛，大连，丹东，鞍山，辽阳，锦州，营口，盘锦，北京，天津*，太原，临汾，长治，石家庄，秦皇岛，保定，唐山，邯郸，邢台，承德，济南，德州*，延安，宝鸡，天水</td>
					</tr>
					<tr style="height: 117px;">
						<td>IV区 南部暖温带落叶阔叶林区</td>
						<td>青岛，烟台，日照，威海，济宁，泰安，淄博，潍坊，枣庄，临沂，莱芜，东营*，新泰，滕州，郑州，洛阳，开封，新乡，焦作，安阳，咸阳，徐州，连云港，盐城，淮北，蚌埠，韩城，铜川</td>
					</tr>
					<tr style="height: 66px;">
						<td>V区 北亚热带落叶、常绿阔叶混交林区</td>
						<td>南京，扬州，镇江，南通，常州，无锡，苏州，合肥，芜湖，安庆，淮南，襄樊，十堰</td>
					</tr>
					<tr style="height: 237px;">
						<td>VI区 中亚热带常绿、落叶阔叶林区</td>
						<td>武汉，沙市，黄石，宜昌，南昌，景德镇，九江，吉安，井冈山，赣州，上海，长沙，株洲，岳阳，怀化，吉首，常德，湘潭，衡阳，邵阳，郴州，桂林，韶关，梅州，三明，南平，杭州，温州，金华，宁波，重庆，成都，都江堰，绵阳，内江，乐山，自贡，攀枝花，贵阳，遵义，六盘水，安顺，昆明，大理，泸州市，德阳市，广元市，遂宁市，资阳市，宜宾市，南充市，达州市，雅安市，广安市，巴中市，眉山市，凉山彝族自治州</td>
					</tr>
					<tr style="height: 66px;">
						<td>VII区 南亚热带常绿阔叶林区</td>
						<td>福州，厦门，泉州，漳州，广州，佛山，顺德，东莞，惠州，汕头，台北，柳州，桂平，个旧</td>
					</tr>
					<tr style="height: 92px;">
						<td>VIII区 热带季雨林及雨林区</td>
						<td>海口，三亚，琼海，高雄，台南，深圳，湛江，中山，珠海，澳门，香港，南宁，钦州，北海，茂名，景洪</td>
					</tr>
					<tr style="height: 117px;">
						<td>IX区 温带草原区</td>
						<td>兰州，平凉，阿勒泰，海拉尔，满洲里，齐齐哈尔，阜新，肇东，大庆*，西宁，银川，通辽，榆林，呼和浩特，包头，张家口，集宁，赤峰，大同，锡兰浩特</td>
					</tr>
					<tr style="height: 92px;">
						<td>X区 温带荒漠区</td>
						<td>乌鲁木齐*，石河子，克拉玛依*，哈密，喀什，武威，酒泉，玉门，嘉峪关，格尔木，库尔勒，金昌，乌海</td>
					</tr>
					<tr style="height: 66px;">
						<td>XI区 青藏高原高寒植被区</td>
						<td>拉萨，日喀则，阿坝藏族羌族自治州，甘孜藏族自治州</td>
					</tr>
				</table>
				<p style="margin-top:20px;">标*城市为土壤盐碱化较重的城市，选择园林植物应注意其耐碱性</p>
			</div>
		</div>
	</div>
	<!--地图 end -->

	<!--植物图片  -->
	<div id="botany">
		<div class="botany_p" style="overflow:scroll;">
			<div class="botany_pl">
				<p>
					<span class="fl">常绿乔木树形特征</span> <span
						class="fr close iconfont icon-guanbi"
						style="font-size: 18px; color: #888;"></span>
				</p>
				<br />
				<!-- 	<p>常绿乔木树形特征</p>
				<div class="photo">
					<p> 
						<li>一、风致型</li>
						<p>代表树种：老年油松，樟子松，马尾松</p>
						<img src="${pageContext.request.contextPath }/audit-asset/img/风致型.png">
					</p>
					<p></p>
				</div>   -->

				<table>
					<tr>
						<td>
							<li>一、风致型</li> <!--  	<p style="font-size:12px;color: #888888;letter-spacing: 1px;">代表树种：老年油松，樟子松，马尾松</p>-->
							<img
							src="${pageContext.request.contextPath }/audit-asset/img/风致型.png">
						</td>
						<td>
							<li>二、塔状园锥型</li> <!--<p style="font-size:12px;color: #888888;letter-spacing: 1px;">代表树种：老年油松，樟子松，马尾松</p>-->
							<img
							src="${pageContext.request.contextPath }/audit-asset/img/塔状园锥型.png">
						</td>
					<tr>
					<tr>
						<td>
							<li>三、倒卵型</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/倒卵型.png">
						</td>
						<td>
							<li>四、扁圆球型</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/扁圆球型.png">
						</td>
					</tr>
					<tr>
						<td>
							<li>五、圆球型</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/圆球型.png">
						</td>
						<td>
							<li>六、广圆锥型</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/广圆锥型.png"
							style="margin-left:90px;">
						</td>
					</tr>
				</table>
				<p>落叶乔木树形特征</p>
				<table>
					<tr>
						<td>
							<li>一、长卵圆型</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/长卵圆型.png"
							style="margin-left:90px;">
						</td>
						<td>
							<li>二、圆柱型</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/圆柱型.png"
							style="margin-left:115px;">
						</td>
					</tr>
					<tr>
						<td>
							<li>三、倒卵型</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/倒卵型1.png">
						</td>
						<td>
							<li>四、伞状扁球型</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/伞状扁球型.png">
						</td>
					</tr>
					<tr>
						<td>
							<li>五、圆球型</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/圆球型1.png">
						</td>
						<td>
							<li>六、广圆锥型</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/广圆锥型1.png"
							style="margin-left:110px;">
						</td>
					</tr>
					<tr>
						<td>
							<li>七、卵圆型</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/卵圆型.png">
						</td>
						<td>
							<li>八、垂枝型</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/垂枝型.png"
							style="margin-left:90px;">
						</td>
					</tr>
					<tr>
						<td>
							<li>九、广卵圆型</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/广卵圆型.png"
							style="width:100px;">
						</td>
						<td>
							<li>十、长圆球型</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/长圆球型.png"
							style="margin-left:115px;">
						</td>
					</tr>
					<tr>
						<td>
							<li>十一、半球型</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/半球型.png"
							style="width:130px;">
						</td>
						<td>
							<li>十二、长圆球型（小乔木）</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/长圆球型（小乔木）.png">
						</td>
					</tr>
				</table>
				<p>灌木树形特征</p>
				<table>
					<tr>
						<td>
							<li>一、圆球型</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/圆球型2.png"
							style="margin-left:95px;">
						</td>
						<td>
							<li>二、长圆型</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/长圆型.png"
							style="margin-left:100px;">
						</td>
					</tr>
					<tr>
						<td>
							<li>三、垂枝半球型</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/垂枝半球型.png">
						</td>
						<td>
							<li>四、半球型</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/半球型2.png">
						</td>
					</tr>
					<tr>
						<td>
							<li>五、圆球型</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/圆球型3.png">
						</td>
						<td>
							<li>六、倒卵圆型</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/倒卵圆型.png"
							style="margin-left:100px;">
						</td>
					</tr>
					<tr>
						<td>
							<li>七、圆锥型</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/圆锥型.png"
							style="margin-left:100px;">
						</td>
						<td>
							<li>八、匍匐型</li> <img
							src="${pageContext.request.contextPath }/audit-asset/img/匍匐型.png"
							style="margin-top:85px;">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		/*
		 *@description: 收藏夹
		 *@author: 覃湖广
		 *@createDate: 2018-5-22 
		 * */
		 
		 /*点击×关闭 收藏夹 */
		 /* (function(){
			 var $close = $(".s_c_l_wrap .close");
			 $close.click(function(){
				 var $s_c_cover = $("#s_c_cover");
				 $s_c_cover.css("display","none");
				 alert("123");
				 window.location.href="${pageContext.request.contextPath }/export/plantData?ids="+ids;
				 //window.location.href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?search="+"苏铁";
			 })
		 })(); */
	
		 /*点击×关闭 收藏夹 */
		function exitList() {
			 
			 //frame.window.setTimeout("window.location.reload()",0);  
			 var $s_c_cover = $("#s_c_cover");
			 $s_c_cover.css("display","none");
			 //var userID = ${sessionScope.toBackSearch};
			 //alert(userID);
			 //var searchTest = window.frames["frame"].document.getElementById('searchInput').val();
			 //alert(searchTest);
			 //frame.window.location.href="${pageContext.request.contextPath}/front/price/toPriceQueryResult?search=${sessionScope.toBackSearch}";
			 //frame.window.exitList2();
		}
		 
		var collectList;
		/*弹出收藏夹页面*/
		function showCollectList() {
			var $s_c_cover = $("#s_c_cover");
			$s_c_cover.css("display","block");
			$.ajax({
			  	/* headers: {
			        'Accept': 'application/json',
			        'Content-Type': 'application/json'
			    }, */
     			url : "${pageContext.request.contextPath}/collectItem/getList",
     			data : {
     				'userId':${sessionScope.user.number}
     			},
     			type : "post",
     			dataType:"json",
     			success : function(result) {
     				var folder = result.folder;
     				count_all = folder;
     				$("#folder").html(folder); //收藏夹的数量
					collectList = result;
					//console.info(collectList.data[0].plantId);
					//initializeCollectList();
					showList(folder);
     			},
     			error : function() {
     			}
     		});
     	}

		function showList(folder){
			//收藏夹头初始化
			ids = "";
			ids_all = "";
			opCount = 0;
			$("#output").html("导出");
			$("#delete01").html("删除");
			$("#output").removeAttr("onclick");
			$("#delete01").removeAttr("onclick");
			//改变导出按钮的颜色
			document.getElementById("output").style.backgroundColor="#EEEEEE";
			document.getElementById("output").style.color="#C5C5C5";
			//改变删除按钮的颜色
			document.getElementById("delete01").style.backgroundColor="#EEEEEE";
			document.getElementById("delete01").style.color="#C5C5C5";
			
			//收藏夹列表初始化
			if(folder == 0){
				$('#s_c_l_w_list').html('<img src="${pageContext.request.contextPath }/audit-asset/img/收藏夹为空.png" style="padding-left:12px"> ');
			}
			else {
				var nu=1;
				$('#s_c_l_w_list').html('<i id="quanxuan" onclick="selected_all()" class="iconfont icon-fuxuankuangweixuan"></i><span style="font-size:14px;padding-left:8px">全选</span></br>');	
				for(var i=0;i<collectList.data.length;i++){
					ids_all += collectList.data[i].plantId + ",";
					var plantName = collectList.data[i].plantName+"("+collectList.data[i].aliasName+")";
					if(plantName.length>14){
						plantName = plantName.substr(0,14)+'...';
					}
					$('#s_c_l_w_list').append('</br><li class="list2" id='+collectList.data[i].plantId+'><i id='+"item"+nu+' style="padding-right:8px" class="iconfont icon-fuxuankuangweixuan" onclick="selected_one(this)"></i>'+plantName+'<span onclick="deleteItem(this)" class="fr delete_item iconfont icon-shanchu"></span></li>');
					nu++;
				}
			}
		}		
		
		//opCount
		var opCount = 0;
		var count_all = 0;
		//收藏夹全选
		function selected_all(){
			if($("#s_c_l_w_list i").attr("class")=="iconfont icon-fuxuankuangweixuan"){
				$("#s_c_l_w_list i").attr("class","iconfont icon-fuxuankuangyixuan");
				//改变导出按钮的颜色
				document.getElementById("output").style.backgroundColor="#0BBA6B";
				document.getElementById("output").style.color="#FFFFFF";
				//改变删除按钮的颜色
				document.getElementById("delete01").style.backgroundColor="#FFFFFF";
				document.getElementById("delete01").style.color="#000000";
				ids = ids_all;
				opCount = count_all;
			}else if($("#s_c_l_w_list i").attr("class")=="iconfont icon-fuxuankuangyixuan"){
				$("#s_c_l_w_list i").attr("class","iconfont icon-fuxuankuangweixuan");
				//改变导出按钮的颜色
				document.getElementById("output").style.backgroundColor="#EEEEEE";
				document.getElementById("output").style.color="#C5C5C5";
				//改变删除按钮的颜色
				document.getElementById("delete01").style.backgroundColor="#EEEEEE";
				document.getElementById("delete01").style.color="#C5C5C5";
				ids = "";
				opCount = 0;
			}
			if(opCount != 0) {
				$("#output").html("导出("+opCount+")");
				$("#delete01").html("删除("+opCount+")");
				$("#output").attr("onclick","outputGroup();");
				$("#delete01").attr("onclick","deleteGroup();");
				
			}
			else {
				$("#output").html("导出");
				$("#delete01").html("删除");
				$("#output").removeAttr("onclick");
				$("#delete01").removeAttr("onclick");
			}
		}
		
		//收藏夹单选
		function selected_one(e){
			this_class = $(e).attr("class");
			this_id = $(e).attr("id");
			plant_id = $(e).parents(".list2").attr("id");
			//alert(plant_id);
			//alert(this_id);
			if(this_class=="iconfont icon-fuxuankuangweixuan"){
				document.getElementById(this_id).className='iconfont icon-fuxuankuangyixuan';
				ids += plant_id + ",";
				opCount++;
			}else if(this_class=="iconfont icon-fuxuankuangyixuan"){
				document.getElementById(this_id).className='iconfont icon-fuxuankuangweixuan';
				document.getElementById("quanxuan").className='iconfont icon-fuxuankuangweixuan';
				ids = ids.replace(plant_id + "," , "");
				opCount--;
			}
			if(opCount != 0) {
				//改变导出按钮的颜色
				document.getElementById("output").style.backgroundColor="#0BBA6B";
				document.getElementById("output").style.color="#FFFFFF";
				//改变删除按钮的颜色
				document.getElementById("delete01").style.backgroundColor="#FFFFFF";
				document.getElementById("delete01").style.color="#000000";
				$("#output").html("导出("+opCount+")");
				$("#delete01").html("删除("+opCount+")");
				$("#output").attr("onclick","outputGroup();");
				$("#delete01").attr("onclick","deleteGroup();");
			}
			else {
				$("#output").html("导出");
				$("#delete01").html("删除");
				$("#output").removeAttr("onclick");
				$("#delete01").removeAttr("onclick");
				//改变导出按钮的颜色
				document.getElementById("output").style.backgroundColor="#EEEEEE";
				document.getElementById("output").style.color="#C5C5C5";
				//改变删除按钮的颜色
				document.getElementById("delete01").style.backgroundColor="#EEEEEE";
				document.getElementById("delete01").style.color="#C5C5C5";
			}
		}
		
		//获取收藏夹已选，未完成
		function get_selected(){
			var c_item = document.getElementById("s_c_l_w_list").getElementsByTagName("li");
			var this_c;
			for(var i=1;i<c_item.length;i++){
				this_c=c_item[i].attr("")
			}
		}
		
		function delect_all() {
			//event.stopPropagation();
			$("#delect_fl").toggle();
			//$(a).css("dispaly","block")
		}
		function deleteGroup(){
			$("#delect_rf").toggle();
		}
		
		//收藏夹清空苗木
		function del_all(userId) {
			//event.stopPropagation(); //阻止事件冒泡传递
			debugger;
			$.ajax({
				url : "${pageContext.request.contextPath}/collectItem/deleteByUserId",
				data : {
					"userId" : userId
				},
				dataType : "json",
				type : "post",
				success : function(data) {
					//swal("", "已成功删除数据！", "success");
					//swal("", "错误2", "error");
					showCollectList();
					delect_all();
					frame.window.location.reload();
				},
				error : function() {
					//swal("", "已成功删除数据！", "success");
					swal("", "错误2", "error");
					showCollectList();
					delect_all();
				}
			});			
		};
		
		/************导出收藏夹内容**************/
		var ids = "";  //已选苗木id
		var ids_all = "";  //所有苗木id
		function outputGroup() {
			window.location.href="${pageContext.request.contextPath }/export/plantData?ids="+ids;
			//window.top.location.href="${pageContext.request.contextPath }/collectItem/getOutput?Ids="+ids;
		}
		/* $("#output").on('click',function(){
				alert("123");
				window.location.href="${pageContext.request.contextPath }/export/plantData?ids="+ids;
				//window.top.location.href="${pageContext.request.contextPath }/collectItem/getOutput?Ids="+ids;
			}) */
		/* var $del_item = $(".delete_item");
		   
		   $del_item.on('click',function(event){
			   alert("123");
		   }); */
		   
		   //收藏夹单个删除苗木
		   function deleteItem(e) {
			   debugger;
			   var plantId = $(e).parent(".list2").attr("id");
				$.ajax({
					url:"${pageContext.request.contextPath}/collectItem/deleteByUserIdAndPlantId",
					data:{
						'userId' :${sessionScope.user.number},
						'plantId':plantId
					},
					type:"post",
					success:function(){
						showCollectList();
						//frame.window.setTimeout("window.location.reload()",0);
						frame.window.location.reload();
					},
					error:function(){
						alert("服务器异常");
						showCollectList();
					}
				});
		   }	
		   
		   //收藏夹批量删除苗木
		   function del_group() {
				$.ajax({
					url:"${pageContext.request.contextPath}/collectItem/deleteByUserIdAndPlantIds",
					data:{
						'userId' : ${sessionScope.user.number},
						'plantIds' : ids
					},
					type:"post",
					success:function(){
						deleteGroup();
						showCollectList();
						frame.window.location.reload();
						
					},
					error:function(){
						alert("服务器异常");
						showCollectList();
					}
				});
		   }	
		   
		 /*点击×关闭地图 */
		 (function(){
			 var $close = $("#map_cover .close");
			 $close.click(function(){
				 var $map_cover = $("#map_cover");
				 $map_cover.css("display","none")
			 })
		 })();
		 
		/*弹出地图页面*/
		function showMap() {
			var $map_cover = $("#map_cover");
			$map_cover.css("display","block")
		} 
		/*弹出植物页面*/
		function showBotany() {
			var $botany = $("#botany");
			$botany.css("display","block")
		} 
		 /*点击×关闭植物页面 */
		 (function(){
			 var $close = $("#botany .close");
			 $close.click(function(){
				 var $map_cover = $("#botany");
				 $map_cover.css("display","none")
			 })
		 })();
		
		/*点击×关闭推算弹窗  */
  	(function(){
  		var $close = $("#calc_cover .close");
			
  		$close.click(function(){
  			var $calc_cover = $("#calc_cover");
  			$calc_cover.css("display","none")
  		})
  	})();
  	
  	/*点击i弹出推算价格*/
		function showCalc(){
   			var $calc_cover = $("#calc_cover");
   			$calc_cover.css("display","block")
		}
		
	/*点击logo回到首页*/
  	$(".one").click(function(){
  		window.top.location.href="${pageContext.request.contextPath }/front";
  	});
  	
  	
		</script>

	<script type="text/javascript">
			var url = "${pageContext.request.contextPath }";
			
			/*iframe自适应高度  */
	    function changeFrameHeight(){
        var ifm= document.getElementById("frame");
        ifm.height=document.documentElement.scrollHeight; 
    	}
    	$(function(){ window.onresize=function(){
        changeFrameHeight(); }}); 
			
		</script>

	<script type="text/javascript">
			$("#exit").click(function(){
				window.location.href = "${pageContext.request.contextPath }/logout";
			});
		</script>

	<script src="${pageContext.request.contextPath }/audit-asset/js/index.js"></script>
	<!--<script>
			function iframe1(){
				var $frame = $("#frame");
				frame.location.href = 'treePrice/priceQueryResult.html';
			}
		</script>-->


</body>
</html>
