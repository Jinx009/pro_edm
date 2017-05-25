<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>寰宇电音</title>
	<meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <script src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
    <link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/Swiper/3.1.7/css/swiper.min.css">
    <script type="text/javascript" src="http://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdn.bootcss.com/Swiper/3.1.7/js/swiper.jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/themes/dj/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/themes/dj/css/radio.css">
    <script src="/themes/js/vue.min.js"></script>
    <script src="/themes/dj/js/common.js"></script>
        <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript">
    wx.config({
        debug: false,
        appId: '${appId}',
        timestamp: ${timestamp},
        nonceStr: '${nonceStr}',
        signature: '${signature}',
        jsApiList: [
            'checkJsApi',
            'onMenuShareTimeline',
            'onMenuShareAppMessage',
            'onMenuShareQQ',
            'onMenuShareWeibo',
            'hideMenuItems',
            'showMenuItems',
            'hideAllNonBaseMenuItem',
            'showAllNonBaseMenuItem',
            'translateVoice',
            'startRecord',
            'stopRecord',
            'onRecordEnd',
            'playVoice',
            'pauseVoice',
            'stopVoice',
            'uploadVoice',
            'downloadVoice',
            'chooseImage',
            'previewImage',
            'uploadImage',
            'downloadImage',
            'getNetworkType',
            'openLocation',
            'getLocation',
            'hideOptionMenu',
            'showOptionMenu',
            'closeWindow',
            'scanQRCode',
            'chooseWXPay',
            'openProductSpecificView',
            'addCard',
            'chooseCard',
            'openCard'
        ]
    });

    wx.ready(function () {
        wx.onMenuShareAppMessage({
            title: '${desc}',
            desc: '${desc}',
            link: 'http://wap.globalrave.cn',
            imgUrl: 'http://wap.globalrave.cn/themes/img/wechat_logo.jpeg',
            success: function () {
                 alert('已转发');
            },
            cancel: function () {
                 alert('已取消');
            },
     });
      wx.onMenuShareTimeline({
    	  title: '${desc}',
          link: 'http://wap.globalrave.cn',
          imgUrl: 'http://wap.globalrave.cn/themes/img/wechat_logo.jpeg',
            success: function () {
                 alert("分享成功!");
            },
            cancel: function () {
                alert('已取消');
            }
       });
    });
    wx.error(function(res){
        alert(res.errMsg);
    });
    </script>
    <style type="text/css">
    .guide-content h1{
    	font-size: 15px;
    	padding-bottom: 5px;
    }
    .guide-content p{
    	text-indent: 2em;
    	color: black;
    }
    </style>
</head>
<body>
	<header>
		<a href="javascript:;" class="menu-btn"><img src="/themes/dj/img/menu.png" class="menu-icon" />
			<img src="/themes/dj/img/exit.png" class="exit" />
		</a>
        <span class="center ">
        	<img src="/themes/dj/img/new_logo.png" />
        </span>
	</header>
	<nav class="menu">
        <ul>
            <li onclick="goUrl('/active/page/index.html')"  ><b><img src="/themes/dj/img/new.png" /></b><p>资讯</p></li>
            <li onclick="goUrl('/active/page/active.html')" ><b><img src="/themes/dj/img/guide.png" /></b><p>活动</p></li>
            <li onclick="goUrl('/active/page/guide.html')" ><b><img src="/themes/dj/img/activity.png" /></b><p>注意事项</p></li>
            <li onclick="goUrl('/active/page/dj.html')" ><b><img src="/themes/dj/img/new.png" /></b><p>世界TOP100 DJ</p></li>
            <li onclick="goUrl('/active/page/club.html')" ><b><img src="/themes/dj/img/activity.png" /></b><p>世界TOP100 Club</p></li>
        </ul>
	</nav>	
	<div class="swiper-container">
		<div class="swiper-wrapper" id="bannerDiv" >
			<div class="swiper-slide" v-for="model in banners" ><a v-bind:href="model.url"><img v-bind:src="model.img" /></a></div>
		</div>
		<div class="swiper-pagination"></div>
	</div>
	<div class="smallTitle"><img src="/themes/dj/img/guide_title.png" /></div>
	<div class="guide-content">
	<img alt="" src="/themes/dj/img/wechat_001.jpeg" width="100%;" >
	<img alt="" src="/themes/dj/img/wechat_002.jpeg" width="100%;" >
	<img alt="" src="/themes/dj/img/wechat_003.jpeg" width="100%;" >
	<img alt="" src="/themes/dj/img/wechat_004.jpeg" width="100%;" >
	<img alt="" src="/themes/dj/img/wechat_005.jpeg" width="100%;" >
	<img alt="" src="/themes/dj/img/wechat_006.jpeg" width="100%;" >
	<img alt="" src="/themes/dj/img/wechat_007.jpeg" width="100%;" >
	<img alt="" src="/themes/dj/img/wechat_008.jpeg" width="100%;" >
	<img alt="" src="/themes/dj/img/wechat_009.jpeg" width="100%;" >
	<img alt="" src="/themes/dj/img/wechat_010.jpeg" width="100%;" >
	<img alt="" src="/themes/dj/img/wechat_011.jpeg" width="100%;" >
      <!--   <h1><b>所需携带：</b></h1>
        <p>• 门票</p>
        <p>• 身份证件（详情请见以下“有效证件表格”）</p>
        <p>• 适合于节日穿着的舒适衣衫</p>
        <p>• 请带上你的笑容和激情！</p>
        <h1><b>允许携带：</b></h1>
        <p>• 随身小包，单肩背包，毛绒背包，手袋等（最大尺寸不得超过40*40厘米）</p>
        <p>• 官方提供的水瓶－入场时必须为空瓶状态</p>
        <p>• 不能携带超过两个主储水囊以及一个小型储水囊的户外水袋背包－入场时需为空置状态。</p>
        <p>• 手机及其移动电源／后备电池</p>
        <p>• 腰包</p>
        <p>• 太阳眼镜以及帽子</p>
        <p>• 打火机及未开封的香烟</p>
        <p>• 电子烟</p>
        <p>• 未过期的医生开具的处方药（请在入场时咨询工作人员并出示医生开具的处方单）</p>
        <p>• 如需要，可携带耳塞</p>
        <p>• 女生可携带所需的唇膏，唇彩，及粉状粉底，卫生棉等，请必须确保所携带内容的密封性</p>
        <p>• 荧光棒，以及可发光的装饰品及首饰</p>
        <p>• 未开封的口香糖</p>
        <p>• 呼啦圈（包括带有LED灯的呼啦圈）</p>
        <p>• LED双节棍</p>
        <p>• 可充气类玩具（在入场时需为未充气状态）</p>
        <p>• 旗帜、横幅或手制的标志（不得带有集团、公司品牌名称，并且不得带入坚硬的旗杆）</p>
        <p>• 与节日相符的图腾或已装饰的池面（详情请见以下“图腾注意事项”）</p>
        <p>• 非专业运动/静物照相机，小于6寸的手持式视频设备（Sony Action Cam，GoPro等等），以及GoPro可伸缩相机杆。</p>
        <h1><b>禁止携带：</b></h1>
        <p>• 非法药品</p>
        <p>• 药物或药物用品</p>
        <p>• 按摩器</p>
        <p>• 激光笔和汽笛</p>
        <p>• 用于灯光照明的LED手套或LED小型指灯</p>
        <p>• 橡皮奶嘴、防尘口罩或防毒口罩</p>
        <p>• 眼药水（在会场内的商店可售）</p>
        <p>• 非处方药物（在会场内的商店或医疗站可售）</p>
        <p>• 液体化妆品</p>
        <p>• 未开封的卫生棉（在进入会场前）</p>
        <p>• 已开启的香烟（在进入会场前）</p>
        <p>• 玻璃杯、易拉罐、杯子或冷却容器</p>
        <p>• 室外食物或无酒精饮料（包括酒精饮品或糖果）</p>
        <p>• 马克笔，钢笔或喷漆</p>
        <p>• 大型链条或带有尖角的装饰品</p>
        <p>• 各类威胁性武器（包括口袋小刀、胡椒喷雾、烟火等）</p>
        <p>• 贴纸、海报</p>
        <p>• 球类或飞盘</p>
        <p>• 帐篷、大型雨伞、椅子或毯子</p>
        <p>• 酒囊</p>
        <p>• 大型手袋、背包或拎包（尺寸大于40*40厘米）</p>
        <p>• 填充类动物玩具或娃娃</p>
        <p>• 专业的照片、视频或声音录制设备（不带有可拆卸的镜头、三脚架、大范围变焦或商业用途的装备）</p>
        <p>• 宠物</p>
        <h1><b>音乐节规定与注意事项</b></h1>
        <p>• 每天只允许进入音乐节现场一次，中途不得离开</p>
        <p>• 不得组织野外露营（官方组织除外）</p>
        <p>• 不设退款或找换</p>
        <p>• 不得进入舞台表演区域</p>
        <p>• 不得斗舞、组织人浪或人群冲浪</p>
        <p>• 不得使用非授权或不具有资质的第三方供应商</p>
        <p>• 不得进行未经授权的请求、传单、样品、赠品等。</p>
        <p>• 不得尾随他人</p>
        <h1><b>可接受进入的身份证件及表格</b></h1>
        <p>• 由美国政府颁发的任一带有照片及出生日期的驾驶证件或身份证件</p>
        <p>• 美国政府或国外政府颁发的带有照片和出生日期的护照</p>
        <p>• 国外政府颁发的驾驶证件/身份证件的彩色复印件（21岁以上的腕带将视为无效。如需购买酒精饮品或进入VIP区域，需提供护照或身份证原件。）</p>
        <p>• 机动车驾驶管理处提供的临时文件可证明你正在更新你的驾照—仅可适用于护照与过期的驾照同时使用</p>
         <h1><b>不得作为入场凭证的证件</b></h1>
        <p>• 学生证件</p>
        <p>• 领事馆证件</p>
        <p>• 出生证明</p>
        <p>• 任何的过期证件</p>
        <p>• 任何证件的复印件（除了以上提到的除外）</p>
        <p>• 机动车驾驶管理处提供的临时文件但缺少护照和已过期的驾照</p>
        <h1><b>图腾注意事项</b></h1>
        <p>• 最高不得超过3米</p>
        <p>• 图腾必须使用材质较轻的材料（例如泡沫、PVC/非固体材料）</p>
        <p>• 可折叠伸缩镜头的延伸部分需参照以上注意事项（轻质填料、空心铝、高碳酸酯）PVC、轻质木材或铝制旗杆，直径不得大于2.5厘米</p>
        <p>• 已装饰的池面以可以易于通过安检为最佳</p>
        <p>• 附加图腾装饰的可充气玩具必须在入场前将气体释放</p>
        <p>• 任何被认为是危险的项目将会被禁止</p>
        <p>• 任何带有因图腾引发的非法活动或仇恨言论将不会被允许。请保持音乐节一贯的“PLUR”宗旨</p>
         <h1><b>安全须知</b></h1>
         <p style="color: gray;" >每一位与会者(包括媒体)之前在进入会场之前将会被搜查。在您购买门票开始，你将被默认为同意接受美国运输安全管理局的搜查,包括清空你的口袋和包,整个身体,让你所有的物品检查,并可能需要脱去您的鞋子。警方人员将在活动期间在场内外工作。严格执行所有有关毒品的法律。我们有权拒绝任何嫌疑人进入活动。
         </p>
         <h1><b>对使用或持有毒品零容忍</b></h1>
         <p style="color: gray;" >任何非法毒品的使用或占有不会容忍任何内部或外部的场所。缉毒官员将这两方面工作和执行所有与毒品有关的法律。不得将任何非法物质事件带入活动现场,违者将被追究法律责任。如果你在进入会场时被发现, 安检人员将不允许你进入会场。活动工作人员有权拒绝其入境。对你和其他参与者负责,并作出明智的选择。
         </p>
         <h1><b>安全及医疗措施</b></h1>
         <p style="color: gray;" >本公司致力于对于我们的演出,工作人员和艺术家提供一个安全的环境。在活动现场将随时提供公共和私人保安以及专业的医务人员。如果你需要帮助,请找到一个医疗或问询处的帐篷,或寻求一个治安官或事件工作人员。
          </p> -->
    </div>
    <div style="height: 20px;" ></div>
</body>
</html>