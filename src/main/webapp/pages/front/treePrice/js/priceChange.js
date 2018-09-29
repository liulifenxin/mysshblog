/*
 * @fileName 近期价格变化曲线图
 * @author DengYu
 * @createDate 2018/4/23 
 */


/*近期价格变化曲线*/
(function(){
	var myChart= echarts.init(document.getElementById("price_change"));
	var option = {
		title:{
			text:'近期价格曲线变化'
		},
		tooltip : {
	        trigger: 'axis'
	    },
	    grid:{
	    	
	    },
	    calculable : true,
	    
		xAxis:[
			{
				type:'category',
				boundaryGap:false,
				axisLabel:{
					fontSize:10
				},
				data:['2018/03/19','2018/03/26','2018/04/02','2018/04/09','2018/04/16','2018/04/23','2018/04/30']
			},

		],
		yAxis:[
			{
				type:'value',
				name:'万元',
				axisLabel:{
					formatter:'{value}'
				},
			},

		],
		series:[
			{
				name:'目标值',
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
						color:'#c7f1da'
					}
				},
				data:[70000, 85000, 78000, 83000, 80000, 90000, 80000]
			},


		]
	};
   		 myChart.setOption(option);
})();