$(function(){
	getData();
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
