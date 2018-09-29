/*
 *@fileName: Audit_form_slider
 *@author: Cao Mingfei
 *@createDate: 2018-5-7 
 * */

/* 每页显示的数量
var pageSize="10";
$(document).ready(function(){
	$(".pageSize").each(function(){
		if($(this).val()==pageSize){
			$(this).attr("selected","selected");
			}
	})
	
	
	
	
})
*/
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
		window.location.href = "index?page=1&rows="+rows + "&condition=" + condition;
	})
})
