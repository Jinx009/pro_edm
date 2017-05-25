<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>寰宇电音</title>
	<meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/Swiper/3.1.7/css/swiper.min.css">
    <script type="text/javascript" src="http://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdn.bootcss.com/Swiper/3.1.7/js/swiper.jquery.min.js"></script>
    <script src="/themes/js/vue.min.js"></script>
    <script src="/themes/dj/js/front/index.js"></script>
    <script src="/themes/dj/js/common.js"></script>
     <script src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
    <link rel="stylesheet" type="text/css" href="/themes/dj/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/themes/dj/css/radio.css">
        <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript">
    wx.config({
        debug: false,
        appId: '${appId}',
        timestamp: ${timestamp},
        nonceStr: '${nonceStr}',
        signature: '${signature}',
        jsApiList: [
            'checkJsApi',
            'onMenuShareTimeline',
            'onMenuShareAppMessage',
            'onMenuShareQQ',
            'onMenuShareWeibo',
            'hideMenuItems',
            'showMenuItems',
            'hideAllNonBaseMenuItem',
            'showAllNonBaseMenuItem',
            'translateVoice',
            'startRecord',
            'stopRecord',
            'onRecordEnd',
            'playVoice',
            'pauseVoice',
            'stopVoice',
            'uploadVoice',
            'downloadVoice',
            'chooseImage',
            'previewImage',
            'uploadImage',
            'downloadImage',
            'getNetworkType',
            'openLocation',
            'getLocation',
            'hideOptionMenu',
            'showOptionMenu',
            'closeWindow',
            'scanQRCode',
            'chooseWXPay',
            'openProductSpecificView',
            'addCard',
            'chooseCard',
            'openCard'
        ]
    });

    wx.ready(function () {
        wx.onMenuShareAppMessage({
            title: '${desc}',
            desc: '${desc}',
            link: 'http://wap.globalrave.cn',
            imgUrl: 'http://wap.globalrave.cn/themes/img/wechat_logo.jpeg',
            success: function () {
                 alert('已转发');
            },
            cancel: function () {
                 alert('已取消');
            },
     });
      wx.onMenuShareTimeline({
    	  title: '${desc}',
          link: 'http://wap.globalrave.cn',
          imgUrl: 'http://wap.globalrave.cn/themes/img/wechat_logo.jpeg',
            success: function () {
                 alert("分享成功!");
            },
            cancel: function () {
                alert('已取消');
            }
       });
    });
    wx.error(function(res){
        alert(res.errMsg);
    });
    </script>
</head>
<body>
	<header>
		<a href="javascript:;" class="menu-btn"><img src="/themes/dj/img/menu.png" class="menu-icon" />
			<img src="/themes/dj/img/exit.png" class="exit" />
		</a>
        <span class="center ">
        	<img src="/themes/dj/img/new_logo.png" />
        	<input type="text" placeholder="输入关键字搜索" id="key" />
        </span>
        <a class="right"><img src="/themes/dj/img/search.png" id="keySet" /></a>
	</header>
	<nav class="menu">
        <ul>
            <li onclick="goUrl('/active/page/index.html')"  ><b><img src="/themes/dj/img/new.png" /></b><p>资讯</p></li>
            <li onclick="goUrl('/active/page/active.html')" ><b><img src="/themes/dj/img/guide.png" /></b><p>活动</p></li>
            <li onclick="goUrl('/active/page/guide.html')" ><b><img src="/themes/dj/img/activity.png" /></b><p>注意事项</p></li>
            <li onclick="goUrl('/active/page/dj.html')" ><b><img src="/themes/dj/img/new.png" /></b><p>世界TOP100 DJ</p></li>
            <li onclick="goUrl('/active/page/club.html')" ><b><img src="/themes/dj/img/activity.png" /></b><p>世界TOP100 Club</p></li>
        </ul>
	</nav>	
	<div class="swiper-container">
		<div class="swiper-wrapper" id="bannerDiv" >
			<div class="swiper-slide" v-for="model in banners" ><a v-bind:href="model.url"><img v-bind:src="model.img" /></a></div>
		</div>
		<div class="swiper-pagination"></div>
	</div>
	<div class="smallTitle"><img src="/themes/dj/img/news_title.png" /></div>
	<ul class="news-nav">
		<li class="active">电音新闻</li>
		<li>电音八卦</li>
	</ul>
	<div class="news-content" id="activeDiv" >
	<!--资讯	start-->
		<div class="news-list">
			<div class="new-item" onclick="goUrl('/active/page/detail.html?id={{model.id}}')" v-for="model in actives" v-if="'电音新闻'===model.type" >
				<div class="item-left"><img v-bind:src="model.topImg" /></div>
				<div class="item-right">
					<p class="item-title" v-text="model.name" ></p>
					<p class="time"><span v-text="model.detailAddress" ></span></p>
					<p class="time"></p>
					<p class="label"><img src="/themes/dj/img/news_label.png" /><span>新闻</span></p>
				</div>
			</div>
		</div>
	<!--资讯	end-->
	<!--活动	start-->
		<div class="news-list" style="display: none">
			<div class="new-item"  onclick="goUrl('/active/page/detail.html?id={{model.id}}')" v-for="model in actives" v-if="'电音八卦'===model.type"  >
				<div class="item-left"><img  v-bind:src="model.topImg"  /></div>
				<div class="item-right">
					<p class="item-title" v-text="model.name" ></p>
					<p class="time"><span v-text="model.detailAddress" ></span></span></p>
					<p class="time"></p>
					<p class="label"><img src="/themes/dj/img/activity_label.png" /><span>八卦</span></p>
				</div>
			</div>
		</div>
	<!--活动	end-->
	</div>
	<script type="text/javascript">
		$(function(){
			$(".news-nav li").on("click",function(){
				var index = $(this).index();
				$(this).addClass('active').siblings().removeClass('active');
				$(".news-content .news-list").hide();
				$(".news-content .news-list").eq(index).show();
			});
		});
	</script>
</body>
</html>