$(function(){
	$.ajax({
		url:'/active/front/activeUser.html',
		type:'post',
		dataType:'json',
		success:function(res){
			new Vue({
 				  el: 'body',
 				  data:{user:res.data}
			})
		}
	})
})