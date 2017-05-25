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
</head>
<body>
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
				<li id="active-li"><a  onclick="goClick('/page/list.html?type=active')" >活动</a></li>
				<li id="dj-li" ><a href="/page/list.html?type=dj">TOP100 DJ</a></li>
				<li id="club-li"><a href="/page/list.html?type=club">TOP100 Club</a></li>
				<li><a href="/page/guide.html">帮助指南</a></li>
			</ul>
		</header>
		<div class="content-wrap">
			<div class="section-header">
				<div class="section-header-title">
					<h1 id="type-name" >活动</h1>	
				</div>
			</div>
			<div class="sel" style="display: none;" >
				<div class="sel-col">
					<div class="a-dropdown-box">
						<span class="select-header" id="type-span" >活动类型</span>
						<ol class="a-dropdown-box-select-list" id="type-ol"></ol>
					</div>
				</div>

				<div class="sel-col sel-col-right">
					<div class="a-dropdown-box">
						<span class="select-header" id="address-span" >地点</span>
						<ol class="a-dropdown-box-select-list" id="address-ol"></ol>
					</div>
				</div>

				<div class="sel-col sel-col-right">
					<div class="a-dropdown-box">
						<span class="select-header" id="month-span" >全部月份</span>
						<ol class="a-dropdown-box-select-list" id="month-ol" >
							<li>1</li>
							<li>2</li>
							<li>3</li>
							<li>4</li>
							<li>5</li>
							<li>6</li>
							<li>7</li>
							<li>8</li>
							<li>9</li>
							<li>10</li>
							<li>11</li>
							<li>12</li>
						</ol>
					</div>
				</div>
			</div>
			<ul class="activity-list" id="activeDiv" ></ul>
		</div>
		<footer>©2017 GLOBALRAVE</footer>
	</div>
	<script src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    <script src="/themes/js/vue.min.js"></script>
    <script src="/themes/pc/js/list.js?version=1.1"></script>
    	<script type="text/javascript">
		$(function(){
		
		})
	</script>
</body>
</html>