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
	  <link rel="stylesheet" type="text/css" href="/themes/pc/css/radio_pc.css?version=1.1">
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
	  <script type="text/javascript">
	  function goClick(url){
			window.sessionStorage.setItem('type','');
			window.sessionStorage.setItem('month','');
			window.sessionStorage.setItem('address','');
			location.href = url;
		}
	  </script>
</head>
<body>
		<input type="hidden" value="${id }" id="id" >
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
				<li id="active-li"><a onclick="goClick('/page/list.html?type=active')" >活动</a></li>
				<li id="dj-li" ><a href="/page/list.html?type=dj">TOP100 DJ</a></li>
				<li id="club-li"><a href="/page/list.html?type=club">TOP100 Club</a></li>
				<li class="active" ><a href="/page/guide.html">帮助指南</a></li>
			</ul>
		</header>
		<div class="content-wrap">
			<div class="detail-content">
				<div class="left">
					<div class="detail-title">
						<h1 id="name" >世界音乐节注意事项</h1>
						<p><span></span>Global Rave </p>	
					</div>
					<div class="detail">
						<img alt="" src="/themes/dj/img/001.png" width="1120px" >
						<img alt="" src="/themes/dj/img/002.png" width="1120px" >
						<img alt="" src="/themes/dj/img/003.png" width="1120px" >
						<img alt="" src="/themes/dj/img/004.png" width="1120px" >
						<img alt="" src="/themes/dj/img/005.png" width="1120px" >
						<img alt="" src="/themes/dj/img/006.png" width="1120px" >
						<img alt="" src="/themes/dj/img/007.png" width="1120px" >
						<img alt="" src="/themes/dj/img/008.png" width="1120px" >
						<img alt="" src="/themes/dj/img/009.png" width="1120px" >
					</div>
				</div>
			</div>
		</div>
		<footer>©2017 GLOBALRAVE</footer>
	</div>
	<script src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    <script src="/themes/js/vue.min.js"></script>
</body>
</html>