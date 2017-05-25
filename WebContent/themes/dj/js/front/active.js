$(function(){
	 $('.right').on('click', function() {
	        $('.center').addClass('search');
	        $('.right').attr('onclick','setKey("active_key");')
	         $('#keySet').attr('onclick','setKey("active_key");')
	 });
	key = window.sessionStorage.getItem('active_key');
	type = window.sessionStorage.getItem('type');
	month = window.sessionStorage.getItem('month');
	address = window.sessionStorage.getItem('address');
	if(key==null){
		key = '';
	}
	if(address==null){
		address = '';
	}
	if(month==null){
		month = '';
	}
	if(type==null){
		type = '';
	}
	getBanner()
	getAddress();
	getType();
	getActive();
	
})
var key = '',type='',month='',address='';

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
				if(res.data[i].text=='2'){
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
		url:'/active/front/actives.html',
		type:'POST',
		data:'key='+key+'&address='+address+'&type='+type+'&month='+month,
		dataType:'json',
		success:function(res){
			if(res.data!=null){
				for(var i in res.data){
					res.data[i].detailImg = res.data[i].detailImg.split(',')[0];
				}
			}
			new Vue({
   				  el: '#activeDiv',
   				  data:{actives:res.data}
    		})
		}
	})
}

/**
 * 地址
 */
function getAddress(){
	$.ajax({
		url:'/active/front/address.html',
		type:'POST',
		data:'fatherId=1',
		dataType:'json',
		success:function(res){
			var htmlStr = '<option value="" >活动区域</option>';
			for(var i in res.data){
				if(address!=''&&address!=null&&address==res.data[i].name){
					htmlStr += '<option value="'+res.data[i].name+'" selected=selected >'+res.data[i].name+'</option>';
				}else{
					htmlStr += '<option value="'+res.data[i].name+'" >'+res.data[i].name+'</option>';
				}
			}
			var html = '<option value="" >所有月份</option>';
			for(var i = 1;i<=12;i++){
				if(i==month){
					html += '<option value='+i+' selected=selected >'+i+'月份</option>';
				}else{
					html += '<option value='+i+' >'+i+'月份</option>';
				}
			}
			$('#month').html(html);
			$('#address').html(htmlStr);
		}
	})
}
/**
 * 分类
 */
function getType(){
	$.ajax({
		url:'/active/front/categoryList.html',
		type:'POST',
		dataType:'json',
		success:function(res){
			var htmlStr = '<option value="" >活动类型</option>';
			for(var i in res.data){
				if(type!=''&&type!=null&&type==res.data[i].name){
					htmlStr += '<option value="'+res.data[i].name+'" selected=selected >'+res.data[i].name+'</option>';
				}else{
					htmlStr += '<option value="'+res.data[i].name+'" >'+res.data[i].name+'</option>';
				}
			}
			$('#type').html(htmlStr);
		}
	})
}
/**
 * 设置查询参数
 */
function setType(){
	address = $('#address').val();
	type = $('#type').val();
	month = $('#month').val();
	window.sessionStorage.setItem('address',address);
	window.sessionStorage.setItem('type',type);
	window.sessionStorage.setItem('month',month);
	location.reload();
}
