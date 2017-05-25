function openUrl(url){
	location.href = url;
}
$(function(){
	getData();
	getActives();
	var selectType = $('#type').val();
	$('.nav li').each(function(){
		$(this).removeClass('active');
		$('#'+selectType+'-li').addClass('active');
	})
})
/**
 * 获取数据
 */
function getData(){
	$.ajax({
		url:'/active/front/activeDetail.html?id='+$('#id').val(),
		type:'POST',
		dataType:'json',
		success:function(res){
			res.data.startTime = res.data.startTime.substr(0,10);
			res.data.endTime = res.data.endTime.substr(0,10);
			res.data.openTime = res.data.openTime.substr(0,13)+'时';
			res.data.closeTime = res.data.closeTime.substr(0,13)+'时';
			new Vue({
   				  el: 'body',
   				  data:{data:res.data,materials:res.materials}
    		})
		}
	})
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
				if(length>=3){
					length = 3;
				}
				htmlStr = '';
				for(var i=0;i<length;i++){
					htmlStr += '<li><a href="/page/detail.html?id='+news[i].id+'&type=news">';
					htmlStr += '<div class="more-list-left"><img src="'+news[i].topImg+'" /></div>';
					htmlStr += '<div class="more-list-right"><p class="news-content">'+news[i].name+'</p></div></a></li>';
				}
				$('#news').html(htmlStr);
			}
			if(actives.length!=0){
				var length = actives.length;
				if(length>=3){
					length = 3;
				}
				var htmlStr = '';
				for(var i=0;i<length;i++){
					htmlStr += '<li><a href="/page/detail.html?id='+actives[i].id+'&type=active">';
					htmlStr += '<div class="more-list-left"><img src="'+actives[i].topImg+'" /></div>';
					htmlStr += '<div class="more-list-right"><p class="news-content">'+actives[i].name+'</p></div></a></li>';
				}
				$('#actives').html(htmlStr);
				
			}
		}
	})
}