$(function(){
    var menuStatus = 1;
    $('.menu-btn').on('click',function(){
        toggleMenu();
    });
    function toggleMenu(){
        if(1==menuStatus){
            $('.menu').show();
            $('.menu-btn').addClass('menu-exit');
            menuStatus = 2;
        }else{
            $('.menu').hide();
            $('.menu-btn').removeClass('menu-exit');
            menuStatus = 1;
        }
    }
})
/**
 * 跳转链接
 * @param url
 */
function goUrl(url){
	if('/active/page/active.html'==url){
		window.sessionStorage.setItem('active_key','');
		window.sessionStorage.setItem('type','');
		window.sessionStorage.setItem('month','');
		window.sessionStorage.setItem('address','');
	}
	location.href = url;
}
/**
 * 设置关键字
 */
function setKey(type){
	var key = $('#key').val();
	window.sessionStorage.setItem(type,key);
	location.reload()
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