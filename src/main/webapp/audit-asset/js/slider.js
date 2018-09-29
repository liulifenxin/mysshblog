/*
 *@fileName: Audit_form_slider
 *@author: Cao Mingfei
 *@createDate: 2018-5-5 
 * */

$.fn.extend({
	
		/*轮播往左移动*/
        bannerLeft : function (mJson) {

            var type = mJson.type || "fade",
                seamless = mJson.seamless || false,
                pic = mJson.picE,
                tab = mJson.tabE,
                btn = mJson.btnE,
                time = mJson.time,
                tabType = mJson.tabType || "click";

            var $pic = this.find(pic),
                $tab,
                $btn,
                length = $pic.length,
                index = 0;

            var $picUl,width,tabTime,
                timer1 = null,
                timer2 = null,
                clickTime = 0;

            //初始化
            this[0].onselectstart=function(){return false};
            if ( type === "fade" ){
                $pic.hide().eq(0).show();
            }else if ( type === "LRslide" ){
                    $picUl = $pic.parent();
                    width = $pic.width();
                if ( seamless ){
                    $picUl.prepend( $pic.last().clone(true,true) );
                    $picUl.append( $pic.first().clone(true,true) );
                    $picUl.width((length+10)*width).css("marginLeft",-width).parent().css("overflow" , "hidden");
                    $pic = $picUl.children();
                }else{
                    $picUl.width((length+10)*width).parent().css("overflow" , "hidden");
                }
                $pic.css({
                    width : width,
                    position : "static",
                    float : 'left'
                });
            }
            
            //关于tab
            if ( tab ){
                $tab = this.find(tab);
                tabTime = "mouseenter"?1:200;
                $tab.eq(0).addClass("on").find('.tab_cover').css({'display':'none'});
                $tab[tabType](function () {
                    var x = $(this).index();
                    if ( x !== index ){
                        clearTimeout(timer1);
                        timer1 = setTimeout(change,tabTime,x);
                    }
                });
            }


            //关于自动轮播
            if ( time ){
                this.hover(function () {
                    clearInterval(timer2);
                },auto());
                function auto() {
                    timer2 = setInterval(function () {
                        var x = index;
                        x ++;
                        change(x);
                        $pic.eq(index).siblings().css({'opacity':'1'});
                    },5000);
                    return auto;
                }
            }

            //变化函数
            function change(i) {
                var moveIndex = seamless?i+1:i;
                var ifFade = type === "fade";
                i %= length;
                if(i<0)i=length-1;
                ifFade && $pic.eq(index).stop().fadeOut();
                $tab.eq(index).removeClass("on").find('.tab_cover').css({'display':'block'});
                index = i;
                if ( ifFade ){
                    $pic.eq(index).stop().fadeIn();
                }else{
                    $pic.eq(index).css({'opacity':'1'});
                    $picUl.stop().animate({
                        marginLeft : -(moveIndex)*width
                    },500,function () {
                        if ( index === 0 || index === length-1 ){
                            $(this).css("marginLeft" , -(index+1)*width);
                        }
                    });
                }
                $tab.eq(index).addClass("on").find('.tab_cover').css({'display':'none'});
            }

        },
        
        
        /*轮播往右移动*/
        bannerRight : function (mJson) {

            var type = mJson.type || "fade",
                seamless = mJson.seamless || false,
                pic = mJson.picE,
                tab = mJson.tabE,
                btn = mJson.btnE,
                time = mJson.time,
                tabType = mJson.tabType || "click";

            var $pic = this.find(pic),
                $tab,
                $btn,
                length = $pic.length,
                index = 0;

            var $picUl,width,tabTime,
                timer1 = null,
                timer2 = null,
                clickTime = 0;

            //初始化
            this[0].onselectstart=function(){return false};
            if ( type === "fade" ){
                $pic.hide().eq(0).show();
            }else if ( type === "LRslide" ){
                    $picUl = $pic.parent();
                    width = $pic.width();
                if ( seamless ){
                    $picUl.prepend( $pic.last().clone(true,true) );
                    $picUl.append( $pic.first().clone(true,true) );
                    $picUl.width((length+10)*width).css("marginRight",-width).parent().css("overflow" , "hidden");
                    $pic = $picUl.children();
                }else{
                    $picUl.width((length+10)*width).parent().css("overflow" , "hidden");
                }
                $pic.css({
                    width : width,
                    position : "static"
                });
            }

            //关于tab
            if ( tab ){
                $tab = this.find(tab);
                tabTime = "mouseenter"?1:200;
                $tab.eq(0).addClass("on").find('.tab_cover').css({'display':'none'});
                $tab[tabType](function () {
                    var x = $(this).index();
                    if ( x !== index ){
                        clearTimeout(timer1);
                        timer1 = setTimeout(change,tabTime,x);
                    }
                });
            }

            //关于自动轮播
            if ( time ){
                this.hover(function () {
                    clearInterval(timer2);
                },auto());
                function auto() {
                    timer2 = setInterval(function () {
                        var x = index;
                        x ++;
                        change(x);
                        $pic.eq(index).siblings().css({'opacity':'1'});
                    },5000);
                    return auto;
                }
            }

            //变化函数
            function change(i) {
                var moveIndex = seamless?i+1:i;
                var ifFade = type === "fade";
                i %= length;
                if(i<0)i=length-1;
                ifFade && $pic.eq(index).stop().fadeOut();
                index = i;
                if ( ifFade ){
                    $pic.eq(index).stop().fadeIn();
                }else{
                    $pic.eq(index).css({'opacity':'1'});
                    $picUl.stop().animate({
                        marginRight : -(moveIndex)*width
                    },500,function () {
                        if ( index === 0 || index === length-1 ){
                            $(this).css("marginRight" , -(index+1)*width);
                        }
                    });
                }
            }

        },
       
       
});

/*调用左移轮播*/
$("#slider").bannerLeft({
    type : 'LRslide',
    seamless : true,
    picE : ".pic ul li",
    tabE : ".tab ul li",
    tabType : "mouseenter",
    time : 5000
});
/*调用右移轮播*/    
$("#slider").bannerRight({
    type : 'LRslide',
    seamless : true,
    picE : ".s_left ul li",
    tabE : ".tab ul li",
    tabType : "mouseenter",
    time : 5000
});