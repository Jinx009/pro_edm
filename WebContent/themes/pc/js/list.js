$(function(){
	getData();
	getType();
	getAddress();
	var selectType = $('#type').val();
	$('.nav li').each(function(){
		$(this).removeClass('active');
		$('#'+selectType+'-li').addClass('active');
	})
})
function getHeader(){
	$(".select-header").click(function(){
		if($(this).siblings(".a-dropdown-box-select-list").hasClass("open")){
			$(this).siblings(".a-dropdown-box-select-list").slideUp("fast");
			var evt =  new Object;  
            if ( typeof(window.event) == "undefined" ){//如果是火狐浏览器  
                evt = arguments.callee.caller.arguments[0];  
            }else{  
                evt = event || window.event;  
            }  
            evt.cancelBubble = true;  
		}else{
			$(this).siblings(".a-dropdown-box-select-list").slideDown("fast");
			//去除事件冒泡  
            var evt =  new Object;  
            if ( typeof(window.event) == "undefined" ){//如果是火狐浏览器  
                evt = arguments.callee.caller.arguments[0];  
            }else{  
                evt = event || window.event;  
            }  
            evt.cancelBubble = true;  
		}
	})
	$(".a-dropdown-box-select-list li").click(function(){  
         $(this).parent().siblings("span").text($(this).text()).end().slideUp("fast"); 
        changeType();
	})
}
var type='',month='',address='',key = '';
function getData(){
	var selectType = $('#type').val();
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
	if('active'==selectType){
		$('.sel').show();
		$.ajax({
			url:'/active/front/actives.html',
			type:'POST',
			data:'key='+key+'&address='+address+'&type='+type+'&month='+month,
			dataType:'json',
			success:function(res){
				var htmlStr = '';
				if(res.data!=null){
					for(var i in res.data){
						res.data[i].detailImg = res.data[i].detailImg.split(',')[0];
						htmlStr += '<li class="activity-item"><a href="/page/detail.html?id='+res.data[i].id+'">';
						htmlStr += '<div class="activity-img"><img src="'+res.data[i].topImg+'"></div>';
						htmlStr += '<div class="event-date"><span>'+res.data[i].detailImg+'</span></div></a></li>';
					}
				}
				$('#activeDiv').html(htmlStr);
			}
		})
	}else if('news'==selectType){
		$('#type-name').html('资讯');
		$.ajax({
			url:'/active/front/activeList.html',
			type:'POST',
			data:'key='+key,
			dataType:'json',
			success:function(res){
				if(res.data!=null){
					var htmlStr = '';
					for(var i in res.data){
						htmlStr += '<li class="activity-item"><a href="/page/detail.html?id='+res.data[i].id+'">';
						htmlStr += '<div class="activity-img"><img src="'+res.data[i].topImg+'"></div>';
						htmlStr += '<div class="hehehe"><span>'+res.data[i].name+'</span></div></a></li>';
					}
					$('#activeDiv').html(htmlStr);
				}
			}
		})
	}else if('dj'==selectType){
		$('#type-name').html('世界TOP100 DJ');
		$.ajax({
			url:'/active/front/djs.html',
			type:'POST',
			data:'key='+key,
			dataType:'json',
			success:function(res){
				var htmlStr = '';
				if(res.data!=null){
					for(var i in res.data){
						if('世界TOP100 DJ'==res.data[i].type){
							htmlStr += '<li class="activity-item"><a href="/page/detail.html?id='+res.data[i].id+'">';
							htmlStr += '<div class="activity-img"><img src="'+res.data[i].topImg+'"></div>';
							htmlStr += '<div class="hehehe"><span>'+res.data[i].name+'</span></div></a></li>';
						}
					}
				}
				$('#activeDiv').html(htmlStr);
			},error:function(res){
				$('#activeDiv').html('');
			}
		})
	}else{
		$('#type-name').html('世界TOP100 Club');
		$.ajax({
			url:'/active/front/djs.html',
			type:'POST',
			data:'key='+key,
			dataType:'json',
			success:function(res){
				if(res.data!=null){
					var htmlStr = '';
					for(var i in res.data){
						if('世界TOP100 Club'==res.data[i].type){
							htmlStr += '<li class="activity-item"><a href="/page/detail.html?id='+res.data[i].id+'">';
							htmlStr += '<div class="activity-img"><img src="'+res.data[i].topImg+'"></div>';
							htmlStr += '<div class="hehehe"><span>'+res.data[i].name+'</span></div></a></li>';
						}
					}
					$('#activeDiv').html(htmlStr);
				}
			}
		})
	}
}
function changeType(){
	var type = $('#type-span').html();
	var month = $('#month-span').html();
	var address = $('#address-span').html();
	if('活动类型'==type){
		type = '';
	}
	if('全部月份'==month){
		month = '';
	}
	if('地点'==address){
		address = '';
	}
	window.sessionStorage.setItem('type',type);
	window.sessionStorage.setItem('month',month);
	window.sessionStorage.setItem('address',address);
	getData();
}
function goClick(url){
	window.sessionStorage.setItem('type','');
	window.sessionStorage.setItem('month','');
	window.sessionStorage.setItem('address','');
	location.href = url;
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
			var htmlStr = '<li>地点</option>';
			for(var i in res.data){
				htmlStr += '<li>'+res.data[i].name+'</li>';
			}
			$('#address-ol').html(htmlStr);
			getHeader();
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
			var htmlStr = '<li>活动类型</option>';
			for(var i in res.data){
				htmlStr += '<li>'+res.data[i].name+'</li>';
			}
			$('#type-ol').html(htmlStr);
			getHeader();
		}
	})
}