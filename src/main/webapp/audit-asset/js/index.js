(function(){
	var $li = $(".two li");
	var $i = $(".underline i");
	
	$li.click(function(){
		var index = $(this).index();
//		alert(index);
		$li.eq(index).css({
			color:'#0BBA6B',
			opacity:'1',
			backgroundColor:'#0F1A32'
		}).siblings('li').css({
			color:'#fff',
			opacity:'0.6',
			backgroundColor:'#1D2D4D'
	 });
		
		$i.eq(index).css({
			backgroundColor:'#0BBA6B',
		}).siblings('i').css({
			backgroundColor:'#1D2D4D',
		});
		switch(index){
			case 0:
				frame.location.href = url+"/front/price/toPriceQuery";
				break;
			case 1:
				frame.location.href = url+"/front/garden_audit/index";
				break;
			case 2:
				frame.location.href = url+"/plant/list2";
				break;
			case 3:
				{
				
				frame.location.href = url+"/auditSupport/L0/design_support.html";
				
				break;}
			case 4:
				frame.location.href = url+"/front/analysis/index";
				break;
		};
	});
})();

/*
 * description: return firstPage
 * author: Cao Mingfei
 * date: 2018.5.17
 * */
/*点击logo返回首页*/
(function () {
	var $logo = $('#menu .logo');
	$logo.click(function () {
		window.location.href = url+"/front";
	})
})();

/*点击头像，弹出退出*/
(function(){
	$('.three .headPortrait').click(function(){
		$('#exit').fadeToggle()
	})
})();