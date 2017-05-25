$(function(){
	 $('.right').on('click', function() {
	        $('.center').addClass('search');
	        $('.right').attr('onclick','setKey("dj_key");')
	         $('#keySet').attr('onclick','setKey("dj_key");')
	 });
	key = window.sessionStorage.getItem('dj_key');
	if(key==null){
		key = '';
	}
	getActive();

})
var key = '';
/**
 * 活动
 */
function getActive(){
	$.ajax({
		url:'/active/front/djs.html',
		type:'POST',
		data:'key='+key,
		dataType:'json',
		success:function(res){
			new Vue({
   				  el: '#activeDiv',
   				  data:{actives:res.data}
    		})
		}
	})
}
/**
 * banner
 */
function getBanner(type){
	$.ajax({
		url:'/active/front/bannerList.html',
		type:'POST',
		dataType:'json',
		success:function(res){
			var data = new Array();
			for(var i in res.data){
				if(res.data[i].text==type){
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
