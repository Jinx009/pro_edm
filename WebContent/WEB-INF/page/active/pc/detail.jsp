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
	  <link rel="stylesheet" type="text/css" href="/themes/pc/css/radio_pc.css?version=1.02">
	    <style type="text/css">
	   .detail-col h1{
    	font-size: 15px;
    	padding-bottom: 5px;
    }
    .detail-col p{
    	text-indent: 2em;
    	color: black;
    	font-size: 14px;
    }
	  </style>
</head>
<body>
		<input type="hidden" value="${id }" id="id" >
		<input type="hidden" value="${type }" id="type" >
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
				<li><a href="/page/index.html">首页</a></li>
				<li id="news-li"><a href="/page/list.html?type=news">资讯</a></li>
				<li id="active-li"><a  onclick="goClick('/page/list.html?type=active')"  >活动</a></li>
				<li id="dj-li" ><a href="/page/list.html?type=dj">TOP100 DJ</a></li>
				<li id="club-li"><a href="/page/list.html?type=club">TOP100 Club</a></li>
				<li><a href="/page/guide.html">帮助指南</a></li>
			</ul>
		</header>
		<div class="content-wrap">
			<div class="detail-content">
				<div class="left">
					<div class="detail-title">
						<h1 id="name" v-text="data.name" ></h1>
						<p><span></span>Global Rave </p>	
					</div>
					<div class="detail">
						<div v-for="model in materials" >
							<div class="detail-col" v-if="2===model.type"> 
								<p v-html="model.content"> </p>
							</div>	
							<img alt=""  width="747px" style="width: 747px" v-if="1===model.type" v-bind:src="model.content"  >
						</div>
					</div>
				</div>
				<div class="right">
					<h2 class="more-list-title" onclick="openUrl('/page/list.html?type=active')" >更多活动</h2>
					<ul class="more-list detail-more-list" id="actives" ></ul>
					<h2 class="more-list-title" onclick="openUrl('/page/list.html?type=news')" >更多信息</h2>
					<ul class="more-list detail-more-list" id="news">
						<li>
							<a href="javascript:;">
								<div class="more-list-left"><img src="img/more_pic.png" /></div>
								<div class="more-list-right">
									<p class="news-content">世界百大DJ巡回演出最终回，将在洛杉矶落下帷幕，届时</p>
									<p class="time">2016-10-22</p>
								</div>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<footer>©2017 GLOBALRAVE</footer>
	</div>
	<script src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    <script src="/themes/js/vue.min.js"></script>
    <script src="/themes/pc/js/detail.js?version=1.1"></script>
</body>
</html>