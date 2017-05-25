$(function(){
	 $('.right').on('click', function() {
	        $('.center').addClass('search');
	        $('.right').attr('onclick','setKey("index_key");')
	         $('#keySet').attr('onclick','setKey("index_key");')
	 });
	key = window.sessionStorage.getItem('index_key');
	if(key==null){
		key = '';
	}
	getBanner();
	getActive();
})
var key = '';
/**
 * banner
 */
function getBanner(){
	$.ajax({
		url:'/active/front/bannerList.html',
		type:'POST',
		dataType:'json',
		success:function(res){
			var data = new Array();
			for(var i in res.data){
				if(res.data[i].text=='1'){
					data.push(res.data[i]);
				}
			}
			new Vue({
   				  el: '#bannerDiv',
   				  data:{banners:data}
    		})
			var mySwiper = new Swiper('.swiper-container', {
				  loop: true, //循环播放
				  autoplay: 5000,
				  lazyLoading: true, //延迟加载图片
				  lazyLoadingInPrevNext: true, //延迟加载当前图片之前和之后一张图片
				  lazyLoadingOnTransitionStart: true, //过渡一开始就加载
				  pagination: '.swiper-pagination', //导航分页
				  paginationClickable: true //导航点击切换
			});

		}
	})
}
/**
 * 活动
 */
function getActive(){
	$.ajax({
		url:'/active/front/activeList.html',
		type:'POST',
		data:'key='+key,
		dataType:'json',
		success:function(res){
			if(res.data!=null){
				for(var i in res.data){
					res.data[i].openTime = changeDate(res.data[i].openTime).substr(0,10);
				}
			}
			new Vue({
   				  el: '#activeDiv',
   				  data:{actives:res.data}
    		})
		}
	})
}
function changeDate(unixtime)  {  
	if(!isContains(unixtime,'-')){
		var timestr = new Date(parseInt(unixtime) * 1000);  
	    var datetime = timestr.toLocaleString().replace(/年|月/g, "-").replace(/日/g, " ");  
	    return datetime;  
	}else{
		return unixtime;
	}
} 
function isContains(str, substr) {
    return str.indexOf(substr) >= 0;
}
Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}