/*苗木数量变化趋势*/
(function(){
	var content_1 = echarts.init(document.getElementById("content_1"));
	var option = {
		title:{
			text:'苗木数量趋势',
			textStyle:{
				fontSize: 16,
				color: '#555'

			},
			left: '9%',
			top: '0.5555%'
		},
	//网格 图表位置
		grid:[
			{	
				show: true,
				width: '92.2322%',
				height: '50%',
				left: '4%',
				top: '25%',
				borderColor: '#d0d0d0',
				borderWidth: 1
			}
		],
		tooltip : {
	        trigger: 'axis'
	    },
	    grid:{
//	    	y:-10,
	    },
	    
		xAxis:[
			{
				type:'category',
				boundaryGap:false,
				axisLabel:{
					fontSize:10
				},
				data:['2018/03/19','2018/03/26','2018/04/02','2018/04/09','2018/04/16','2018/04/23','2018/04/30','2018/05/07','2018/04/14','2018/04/21']
			},
		
		],
		yAxis:[
			{
				type:'value',
				min:0,
//				max:300,
				axisLabel:{
					formatter:'{value}'
				},
//				splitLine:{
//					show: false
//				}
			},
			
		],
		series:[
			{
				name:'数量',
				type:'line',
				symbol:'none',
				itemStyle:{
					color:'#c7f1da'
				},
				lineStyle:{
					normal:{
						width:'5',
						color:'#60d7b7'
					}
				},
				 areaStyle: {normal: {  
                     color: new echarts.graphic.LinearGradient(  
                             0, 0, 0, 1,  
                             [  
                                 {offset: 0, color: '#bfefdd'},  
                                 {offset: 0.5, color: '#caf3e1'},  
                                 {offset: 1, color: '#eafbf0'}  
                             ]  
                     )  
                 }},

				data:[90, 110, 130, 148, 151, 170, 210, 219, 220, 925]
			},
			
		]
	};
    content_1.setOption(option);
})();


/*当前苗木数量*/
(function () {
	var reachValue=[55,30,33,30,15,47,25,13,18];//植物数量
	//柱状图
	var option = {
		//柱状图名称
		title:{
			text:'苗木分类统计',
			textStyle:{
				fontSize: 16,
				color: '#555'
			},
			left: '2.8%',
			top: '8.5555%'
		},
	//网格 图表位置
		grid:[
			{	
				show: true,
				width: '92.2322%',
				height: '50%',
				left: '4%',
				top: '25%',
				borderColor: '#d0d0d0',
				borderWidth: 1
			}
		],
	
	//定义x轴
     xAxis : [	     
        {
            type : 'category',//坐标轴类型
            axisLine: {show:false},	//坐标轴轴线
            axisTick: {show:false},	//坐标轴刻度
           
          	axisLabel:{		  //坐标轴刻度标签
          		color:'#555',
          		interval:0,
          		fontSize:12,
          		formatter:'{value}'
          	},
          	splitLine: {
          		lineStyle:{
          			color: '#efefef',
          			width: 1
          		},
          	},
          
            data : ['乔木','灌木','攀援藤本','竹类','棕榈类','花卉','水生植物','草坪地被','种子']//坐标轴数据
        },
  ],
	//定义y轴
    yAxis : [  
        {	
            type:'value',//坐标轴类型
            max:60,
            axisLine: {show:false},	//坐标轴轴线
            axisTick: {show:false},	//坐标轴刻度
            axisLabel:{	 //坐标轴刻度标签
            	formatter:'{value}'},
            
        },
    ],
	//系列列表    
    series : [
    	//数量柱状图 
        {
            name:'累计达成值',//图表名字
            type:'bar',		//图表类型
            barWidth:'25%',//柱状图柱宽
            itemStyle: {	//图形样式
              normal: {color: '#6eb3f7'},
            },
            data:reachValue //柱状图数据
        },  
    ]
};
	
    chartOutChar = echarts.init(document.getElementById('shown'));//获取id
    chartOutChar.setOption(option);
    
  })();