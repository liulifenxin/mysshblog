/*	
 *fileName：苗木信息录入
 *author: Chen Cong Liang
 *createDate： 2018-05-03
 */

//页数显示
$(function(){
        var currentPage=Number(20);
        var pageNum=Number(50);

        //给每个button赋值（第一个默认为1）
        $("#btn2").text(currentPage-2);
        $("#btn3").text(currentPage-1);
        $("#btn4").text(currentPage);
        $("#btn5").text(currentPage+1);
        $("#btn6").text(currentPage+2);
        $("#btn7").text(pageNum);

        //可改变当前页的button样式
        $("#btn4").css("background-color","#ff6384"); 

        //先处理"上一页"和"下一页"的情况
        if(currentPage==1)  //如果当前页为首页
        {
            $("#prePage").hide();  
        }

        if(currentPage==pageNum)    //如果当前页为末页
        {
            $("#sufPage").hide();
        }

        //处理当前页小于等于3的特殊情况
        if(currentPage<=3){
            $("#prePoint").hide();
            $("#btn1").hide();
        }//当前页是4还需要hide掉第一个省略号按钮（！重要）
        else if(currentPage==4){
            $("#prePoint").hide();
        }
        //当前页是1还需要hide掉第二第三个按钮
        if(currentPage==1)
        {
            $("#btn2").hide();
            $("#btn3").hide();
        }
        //当前页是2则也需要hide掉第二个按钮（此时为-1）
        else if(currentPage==2)
        {
            $("#btn2").hide();
        }

        //最末端的特殊情况处理和最前端是一样的
        if(currentPage>=pageNum-2){
            $("#sufPoint").hide();
            $("#btn7").hide();
        }
        else if(currentPage==pageNum-3){
            $("#sufPoint").hide();
        }

        if(currentPage==pageNum)
        {
            $("#btn5").hide();
            $("#btn6").hide();
        }

        if(currentPage==pageNum-1)
        {
            $("#btn6").hide();
        }
    });
    
/* 每页显示的数量*/
//获取当前页面显示条数
var pageSize = $("input[name='rows']").val();
//获取搜索条件
var condition = $("#search").val();
$(document).ready(function(){
	$(".pageSize").each(function(){
		if($(this).val()==pageSize){
			$(this).attr("selected","selected");
			}
	})
	$("#pageSizeSelector").change(function(){
	/*	alert("value:"+$(this).attr("value"));*/
		var rows = $(this).find("option:selected").val();
		window.location.href = "list2?page=1&rows="+rows+"&condition="+condition;
	})
})



$("td_1").click(function(){
	window.location.href = '../../L1/preview.html';
});
