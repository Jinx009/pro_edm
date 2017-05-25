package main.entry.webapp.active;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import common.utils.UnicodeUtil;
import common.wechat.WechatData;
import common.wechat.WechatJSSign;
import common.wechat.WechatUtil;
import database.models.WechatCache;
import database.models.active.Active;
import database.models.active.ActiveUser;
import net.sf.json.JSONObject;
import service.basicFunctions.WechatCacheService;
import service.basicFunctions.active.ActiveService;
import service.basicFunctions.active.ActiveUserService;

@Controller
@RequestMapping("/active/page")
public class FrontPageController {
	
	@Autowired
	private WechatCacheService wechatCacheService;
	@Autowired
	private ActiveUserService activeUserService;
	@Autowired
	private ActiveService activeService;

	private Map<String,Object> data;

	/**
	 * 活动指南
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(path = "/guide")
	public String update(HttpServletRequest request,HttpServletResponse response) throws ClientProtocolException, IOException{
		getJsKey(request);
		return "/active/front/guide";
	}
	
	@RequestMapping(path = "/club")
	public String club(HttpServletRequest request,HttpServletResponse response) throws ClientProtocolException, IOException{
		getJsKey(request);
		return "/active/front/club";
	}
	
	/**
	 * 绑定手机号
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(path = "/bind")
	public String bind(HttpServletRequest request,HttpServletResponse response) throws ClientProtocolException, IOException{
		getJsKey(request);
		request.setAttribute("url",request.getParameter("url"));
		return checkSession(request,response,"/active/page/bind");
	}
	
	/**
	 * 首页
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(path = "/index")
	public String activeIndex(HttpServletRequest request,HttpServletResponse response) throws ClientProtocolException, IOException{
		try {
			getJsKey(request);
		} catch (Exception e) {
			System.out.println(e);
		}
		return "/active/front/index";
	}
	
	/**
	 * 活动详情
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(path = "/detail")
	public String detail(HttpServletRequest request,HttpServletResponse response) throws ClientProtocolException, IOException{
		try {
			getJsKey(request);
		} catch (Exception e) {
			System.out.println(e);
		}
		Integer id = Integer.valueOf(request.getParameter("id"));
		Active active = activeService.find(id);
		if(active!=null){
			request.setAttribute("desc",active.getName());
		}
		request.setAttribute("id",id);
		return "/active/front/detail";
	}
	
	/**
	 * 百大DJ
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(path = "/dj")
	public String join(HttpServletRequest request,HttpServletResponse response) throws ClientProtocolException, IOException{
		try {
			getJsKey(request);
		} catch (Exception e) {
			System.out.println(e);
		}
		return "/active/front/dj";
	}
	
	/**
	 * 活动
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(path = "/active")
	public String like(HttpServletRequest request,HttpServletResponse response) throws ClientProtocolException, IOException{
		try {
			getJsKey(request);
		} catch (Exception e) {
			System.out.println(e);
		}
		return "/active/front/active";
	}
	
	
	/**
	 * 微信重定向
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(path = "/status")
	public String status(HttpServletRequest request,HttpServletResponse response){
		String code = request.getParameter("code");
		String id = request.getParameter("id");
		String url = request.getParameter("url");
		System.out.println(url+"--"+id);
		ActiveUser activeUser = null;
		if (null != code && !"".equals(code)) {
			JSONObject result = WechatUtil.getUserInfoFirst(code,WechatData.APP_ID, WechatData.APP_SECRET);
			if(null!=result){
				System.out.println("第一次微信授权获取信息："+result.toString());
				String accessToken = result.get("access_token").toString();
				String openid = result.get("openid").toString();
				List<ActiveUser> list = activeUserService.findByHql(" FROM ActiveUser WHERE openId = '"+openid+"' ");
				if(list==null){
					JSONObject json = WechatUtil.getRealUserInfo(accessToken, openid);
					System.out.println("userInfo:" + json.toString());
					activeUser = new ActiveUser();
					activeUser.setAddTime(new Date());
					activeUser.setBindstatus(0);
					activeUser.setNickName(UnicodeUtil.stringToUnicode(json.getString("nickname").toString()));
					activeUser.setImg(json.getString("headimgurl").toString());
					activeUser.setOpenId(openid);
					activeUserService.save(activeUser);
					
				}else{
					activeUser = list.get(0);
				}
			}
		}
		HttpSession session = request.getSession();
		session.setAttribute("sessionUser",activeUser);
		if(0==activeUser.getBindstatus()){
			return "redirect:http://yue.wishworks.cn/active/page/bind.html?url="+url+"&id="+id;
		}
		return "redirect:"+url+"?id="+id;
	}
	
	/**
	 * session过滤器
	 * @param request
	 * @param response
	 * @param url
	 * @return
	 */
	private String checkSession(HttpServletRequest request,HttpServletResponse response,String url){
		String id = request.getParameter("id");
		request.setAttribute("id",id);
		HttpSession session = request.getSession();
//		ActiveUser activeUser = activeUserService.find(1);
//		session.setAttribute("sessionUser",activeUser);
		ActiveUser user = (ActiveUser) session.getAttribute("sessionUser");
		if(user!=null){
			String[] arr = url.split("/");
			return arr[1]+"/front/"+arr[3];
		}else{
			return "redirect:https://open.weixin.qq.com/connect/oauth2/authorize?appid="+WechatData.APP_ID+"&redirect_uri=http://yue.wishworks.cn/active/page/status.html?url="+url+".html%26id="+id+"&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect";
		}
	}
	
	public void getJsKey(HttpServletRequest request) throws ClientProtocolException, IOException{
		try {
			// js api处理
			String url = request.getRequestURL().toString();
			String queryString = request.getQueryString();

			if (null != queryString && !"".equals(queryString)) {
				url = url + "?" + queryString;
			}
			String appId = WechatData.APP_ID;
			String appSecret = WechatData.APP_SECRET;
			WechatCache wechatCache = wechatCacheService.getByAppId(appId,"JsApi");
			String jsapi_ticket = this.checkWechatCache(appId,appSecret, wechatCache);
			Map<String, String> ret = WechatJSSign.createSign(jsapi_ticket,url, appId, appSecret);
			request.setAttribute("appId", appId);
			request.setAttribute("timestamp", ret.get("timestamp").toString());
			request.setAttribute("nonceStr", ret.get("nonceStr").toString());
			request.setAttribute("signature", ret.get("signature").toString());
			request.setAttribute("desc","寰宇电音");
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	

	/**
	 * 校验数据库微信信息
	 * @param wechatCache
	 * @return
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	public String checkWechatCache(String appId, String appSecret, WechatCache wechatCache) throws ClientProtocolException, IOException{
		String jsapi_ticket = null;
		if (getTimestamp(wechatCache.getLastTimestamp())){
			jsapi_ticket = wechatCache.getCacheValue();
		} 
		else{
			int currentTimestamp = (int) (System.currentTimeMillis() / 1000);
			jsapi_ticket = WechatUtil.getJSApiTicket(appId, appSecret);
			WechatCache wechatCache2 = wechatCacheService.getById(wechatCache.getId());
			wechatCache2.setCacheValue(jsapi_ticket);
			wechatCache2.setLastTimestamp(currentTimestamp);
			wechatCacheService.update(wechatCache2);
		}
		return jsapi_ticket;
	}
	
	public static boolean getTimestamp(int timestamp){
		int currentTimestamp = (int) (System.currentTimeMillis() / 1000);
		if ((currentTimestamp - timestamp) >= 7200){
			return false;
		}
		return true;
	}
	
	
	public Map<String, Object> getData() {
		return data;
	}
	public void setData(Map<String, Object> data) {
		this.data = data;
	}
	
	
}
