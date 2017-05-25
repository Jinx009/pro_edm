$(function(){
	getData();
	getFatherAddress();
})
var sonAddress = '',fatherAddress = '';
function getData(){
	$.ajax({
		url:'/active/front/activeUser.html',
		type:'post',
		dataType:'json',
		success:function(res){
			if(res.data.name == null){
				res.data.name = '';
			}
			if(res.data.address==null){
				sonAddress = '';
				fatherAddress = '';
			}else{
				sonAddress = res.data.address.id;
				fatherAddress = res.data.address.fatherId;
			}
			if(res.data.sex == null){
				res.data.sex = '男';
			}
			new Vue({
				  el: 'body',  
				  data:{user:res.data}
			})
		}
	})
}

function getFatherAddress(){
	$.ajax({
		url:'/active/front/fatherAddress.html',
		type:'get',
		dataType:'json',
		success:function(res){
			var htmlStr = '';
			for(var i = 0;i<res.data.length;i++){
				if(res.data[i].id == fatherAddress){
					htmlStr += '<option value="'+res.data[i].id+'" selected="selected" >'+
					res.data[i].name+'</option>';
				}else{
					htmlStr += '<option value="'+res.data[i].id+'">'+
					res.data[i].name+'</option>';
				}
			}
			$('#fatherAddress').html(htmlStr);
			getAddress();
		}
	})
}

function getAddress(){
	var id = $('#fatherAddress').val();
	$.ajax({
		url:'/active/front/address.html?fatherId='+id,
		type:'get',
		dataType:'json',
		success:function(res){
			var htmlStr = '';
			for(var i = 0;i<res.data.length;i++){
				if(res.data[i].id == sonAddress){
					htmlStr += '<option value="'+res.data[i].id+'" selected="selected" >'+
					res.data[i].name+'</option>';
				}else{
					htmlStr += '<option value="'+res.data[i].id+'">'+
					res.data[i].name+'</option>';
				}
			}
			$('#address').html(htmlStr);
		}
	})
}

function update(){
	var params = 'name='+$('#name').val()+'&sex='+$('#sex').val()+'&id='+$('#address').val()+'&email='+$('#email').val();
	$.ajax({
		url:'/active/front/updateUser.html',
		type:'post',
		dataType:'json',
		data:params,
		success:function(res){
			if('success'==res.status){
				alert('保存成功！');
				location.reload();
			}
		}
	})
}