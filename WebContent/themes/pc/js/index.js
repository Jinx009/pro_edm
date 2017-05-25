$(function(){
	$(".more-list li").each(function(i){
	    var $nc = $($(".news-content")[i]);
	    var $newsContent = $($(".news-content")[i]).height();
	    if ($newsContent > 72&&$nc.html().length>33) {
	    	$($(".news-content")[i]).css("height","72px");
	    	$nc.html($nc.html().substring(0,33).replace(/(\s)*([a-zA-Z0-9]+|\W)(\.\.\.)?$/, "..."));
	    }
	});	
	getBanner();
	getActives();
	userAgent();
})
function  userAgent(){
	var browser = {
			versions:function(){ 
			var u = navigator.userAgent, app = navigator.appVersion; 
			return {//移动终端浏览器版本信息 
				trident: u.indexOf("Trident") > -1, //IE内核
				presto: u.indexOf("Presto") > -1, //opera内核
				webKit: u.indexOf("AppleWebKit") > -1, //苹果、谷歌内核
				gecko: u.indexOf("Gecko") > -1 && u.indexOf("KHTML") == -1, //火狐内核
				mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
				ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
				android: u.indexOf("Android") > -1 || u.indexOf("Linux") > -1, //android终端或者uc浏览器
				iPhone: u.indexOf("iPhone") > -1 , //是否为iPhone或者QQHD浏览器
				iPad: u.indexOf("iPad") > -1, //是否iPad
				webApp: u.indexOf("Safari") == -1 //是否web应该程序，没有头部与底部
				};
			}(),
			language:(navigator.browserLanguage || navigator.language).toLowerCase()
		} 
	
	if(browser.versions.mobile||browser.versions.ios||browser.versions.android||browser.versions.iPhone||browser.versions.iPad){
		location.href="http://wap.globalrave.cn/active/page/index.html";
	}
	
}
function getBanner(){
	$.ajax({
		url:'/active/front/bannerList.html',
		type:'post',
		dataType:'json',
		success:function(res){
			var banners = new Array();
			if(res.data!=null&&''!=res.data){
				for(var i in res.data){
					if(res.data[i].text=='5'){
						banners.push(res.data[i]);
					}
				}
			}
			if(banners.length==0){
				var banner = {};
				banner.img = '/themes/img/banner.png';
				banner.url = '#';
				banners.push(banner);
			}
			new Vue({
 				  el: '#bannerDiv',
 				  data:{banners:banners}
			})
			var mySwiper = new Swiper('.swiper-container',{
				loop: true, //循环播放
				autoplay: 5000,
				pagination: '.pagination',
				paginationClickable: true
			 });
		}
	})
}
function openUrl(url){
	location.href = url;
}
function goClick(url){
	window.sessionStorage.setItem('type','');
	window.sessionStorage.setItem('month','');
	window.sessionStorage.setItem('address','');
	location.href = url;
}
function getActives(){
	$.ajax({
		url:'/pc/activeList.html',
		type:'post',
		dataType:'json',
		success:function(res){
			var news = new Array();
			var actives = new Array();
			var djs = new Array();
			var clubs = new Array();
			if(res.data!=null&&''!=res.data){
				for(var i in res.data){
					if('电音新闻'==res.data[i].type||'电音八卦'==res.data[i].type){
						news.push(res.data[i]);
					}else if('世界TOP100 DJ'==res.data[i].type){
						djs.push(res.data[i]);
					}else if('世界TOP100 Club'==res.data[i].type){
						clubs.push(res.data[i]);
					}else{
						actives.push(res.data[i]);
					}
				}
			}
			if(news.length!=0){
				var length = news.length;
				if(length>=4){
					length = 4;
				}
				var htmlStr = '';
				for(var i = 0;i<length;i++){
					htmlStr += '<li style="height:266px;" ><a href="/page/detail.html?id='+news[i].id+'&type=news"><img src="'+news[i].topImg+'" /></a></li>';
				}
				$('#news-4').html(htmlStr);
				if(length>=3){
					length = 3;
				}
				htmlStr = '';
				for(var i = 0;i<length;i++){
					htmlStr += '<li><a href="/page/detail.html?id='+news[i].id+'&type=news"><div class="more-list-left"><img src="'+news[i].topImg+'" /></div>';
					htmlStr += '<div class="more-list-right"><p class="news-content">'+news[i].name+'</p><p class="time"></p></div></a></li>';
				}
				$('#news-3').html(htmlStr);
			}
			if(clubs.length!=0){
				var length = clubs.length;
				if(length>=4){
					length = 4;
				}
				var htmlStr = '';
				for(var i =0;i<length;i++){
					htmlStr += '<li class="activity-item"><a href="/page/detail.html?id='+clubs[i].id+'&type=club">';
					htmlStr += '<div class="activity-img"><img src="'+clubs[i].topImg+'"></div>';
					htmlStr += '<div class="hehehe" >'+clubs[i].name+'</div></a></li>';
				}
				$('#clubs').html(htmlStr);
//				var mySwiper = new Swiper('.swiper-container1',{
//					loop: true, //循环播放
//					autoplay: 5000,
//					pagination: '.pagination1',
//					paginationClickable: true
//				 });
			}
			if(djs.length!=0){
				var length = djs.length;
				if(length>=4){
					length = 4;
				}
				var htmlStr = '';
				for(var i=0;i<length;i++){
					htmlStr += '<li class="activity-item"><a href="/page/detail.html?id='+djs[i].id+'&type=dj">';
					htmlStr += '<div class="activity-img"><img src="'+djs[i].topImg+'"></div>';
					htmlStr += '<div class="hehehe" >'+djs[i].name+'</div></a></li>';
				}
				$('#djs').html(htmlStr);
				
			}
			if(actives.length!=0){
				var length = actives.length;
				if(length>=4){
					length = 4;
				}
				var htmlStr = '';
				for(var i=0;i<length;i++){
					actives[i].detailImg = actives[i].detailImg.split(',')[0];
					htmlStr += '<li class="activity-item"><a href="/page/detail.html?id='+actives[i].id+'&type=active">';
					htmlStr += '<div class="activity-img"><img src="'+actives[i].topImg+'"></div>';
					htmlStr += '<div class="event-date"><span>'+actives[i].detailImg+'</span></div></a></li>';
				}
				$('#actives').html(htmlStr);
				
			}
		}
	})
}