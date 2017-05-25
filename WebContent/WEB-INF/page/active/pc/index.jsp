<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>寰宇电音</title>
	<meta  charset="UTF-8"/>
      <meta name="renderer" content="webkit">
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
      <meta http-equiv="Cache-Control" content="no-siteapp">
      <meta name="keywords" content="">
      <meta name="description" content="">
	  <link rel="stylesheet" type="text/css" href="/themes/pc/css/reset.css">
	  <link href="http://cdn.bootcss.com/Swiper/2.7.6/idangerous.swiper.min.css" rel="stylesheet">
	  <link rel="stylesheet" type="text/css" href="/themes/pc/css/radio_pc.css?version=1.02">
</head>
<body>
	<div class="content">
		<header>
			<div class="header-top">
				<div class="left"><img src="/themes/dj/img/new_logo.png" /></div>
				<div class="right">
					<!-- <input type="text" class="search" /> -->
					<div class="no-login"><!-- <a href="javascript:;">登陆</a>/<a href="javascript:;">注册</a> --></div>
				</div>
			</div>
			<ul class="nav">
				<li  class="active" ><a href="/page/index.html">首页</a></li>
				<li id="news-li"><a href="/page/list.html?type=news">资讯</a></li>
				<li id="active-li"><a href="/page/list.html?type=active">活动</a></li>
				<li id="dj-li" ><a href="/page/list.html?type=dj">TOP100 DJ</a></li>
				<li id="club-li"><a href="/page/list.html?type=club">TOP100 Club</a></li>
				<li><a href="/page/guide.html">帮助指南</a></li>
			</ul>
		</header>
		<!--banner	start-->
		<div class="swiper-container">
		  <div class="swiper-wrapper" id="bannerDiv" >
		    <div class="swiper-slide" v-for="model in banners" ><a v-bind:href="model.url" ><img v-bind:src="model.img" /></a></div>
		  </div>
		  <div class="pagination"></div>
		</div>
		<!--banner	end-->
		<div class="content-wrap">
			<div class="section-header">
				<div class="section-header-title">
					<h1>资讯</h1>	
				</div>
			</div>
			<div class="news">
				<div class="left">
					<ul id="news-4" ></ul>
				</div>
				<div class="right">
					<h2 class="more-list-title" onclick="openUrl('/page/list.html?type=news')" >更多信息</h2>
					<ul class="more-list" id="news-3" ></ul>
				</div>
			</div>
			<div class="section-header">
				<div class="section-header-title">
					<h1>活动</h1>	
				</div>
			</div>	
			<ul class="activity-list" id="actives"></ul>

			<div class="section-header">
				<div class="section-header-title">
					<h1>世界TOP100 Club</h1>	
				</div> 
			</div>
			<ul class="activity-list" id="clubs" ></ul>
<!-- 			<div class="club-banner">
				<div class="swiper-container swiper-container1">
				  <div class="swiper-wrapper" id="clubs" ></div>
				  <div class="pagination pagination1"></div>
				</div>
				<a href="javascript:;"><img src="/themes/pc/img/club_banner.png" /></a>
			</div> -->
			<div class="section-header">
				<div class="section-header-title">
					<h1>世界TOP100 DJ</h1>	
				</div> 
			</div>
			<ul class="activity-list" id="djs" ></ul>
		</div>
		<footer>©2017 GLOBALRAVE</footer>
	</div>
	<script src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/Swiper/2.7.6/idangerous.swiper.js"></script>
    <script src="/themes/js/vue.min.js"></script>
    <script src="/themes/pc/js/index.js?version=1.2"></script>
</body>
</html>