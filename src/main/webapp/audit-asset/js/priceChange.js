/*
 * @fileName 近期价格变化曲线图
 * @author DengYu
 * @createDate 2018/4/23 
 */


/*近期价格变化曲线*/
(function(){
	var c = document.getElementsByClassName("price_change");
	var myChart= echarts.init(c[0]);
	var option = {
		title:{
			text:'近期价格曲线变化',
			textStyle:{
				color: "#7F8FA4",
				fontSize: 14
			}
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
						color:'#c7f1da'
					}
				},
				data:data
			},


		]
	};
   		 myChart.setOption(option);
})();


