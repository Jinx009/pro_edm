package main.entry.webapp.active;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import common.helper.HttpWebIOHelper;
import database.models.active.Active;
import database.models.active.Material;
import service.basicFunctions.active.ActiveService;
import service.basicFunctions.active.MaterialService;

@Controller
@RequestMapping("/active/front")
public class FrontActiveController {

	@Autowired
	private ActiveService activeService;
	@Autowired
	private MaterialService materialService;
	
	private Map<String,Object> data;

	@RequestMapping(path = "/activeList")
	public void getIndexActive(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String key = request.getParameter("key");
		String hql = " FROM Active WHERE addUser ='0'AND name like '%"+key+"%' AND (type = '电音新闻' OR type = '电音八卦')  ORDER BY orderNum,addTime DESC ";
		List<Active> list = activeService.findByHql(hql);
		data = new HashMap<String,Object>();
		data.put("status","success");
		data.put("data",list);
		
		HttpWebIOHelper._printWebJson(data, response);
	}
	
	@RequestMapping(path = "/djs")
	public void djs(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String key = request.getParameter("key");
		String hql = " FROM Active WHERE addUser ='0'AND name like '%"+key+"%' AND (type = '世界TOP100 DJ' OR type = '世界TOP100 Club')   ORDER BY orderNum,addTime DESC  ";
		List<Active> list = activeService.findByHql(hql);
		data = new HashMap<String,Object>();
		data.put("status","success");
		data.put("data",list);
		
		HttpWebIOHelper._printWebJson(data, response);
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(path = "/actives")
	public void getActives(HttpServletRequest request,HttpServletResponse response) throws IOException, ParseException{
		String key = request.getParameter("key");
		String address = request.getParameter("address");
		String month = request.getParameter("month");
		String type = request.getParameter("type");
		String hql = " FROM Active WHERE addUser ='0'AND name like '%"+key+"%' AND address like '%"+address+"%' AND type!='电音新闻' AND type!='电音八卦' AND type!='世界TOP100 DJ' AND type!='世界TOP100 Club'  AND type like '%"+type+"%'   ORDER BY orderNum,addTime DESC  ";
		List<Active> list = activeService.findByHql(hql);
//		List<Active> actives = new ArrayList<Active>();
//		List<Active> olds = new ArrayList<Active>();
//		List<Active> news = new ArrayList<Active>();
//		if(list!=null){
//			Date date = new Date();
//			for(Active active : list){
//				if(active.getOpenTime().before(date)){
//					olds.add(active);
//				}else{
//					news.add(active);
//				}
//			}
//		}
//		if(news.size()!=0){
//			actives.addAll(news);
//		}
//		if(olds.size()!=0){
//			actives.addAll(olds);
//		}
		List<Active> lists = new ArrayList<Active>();
		if("".equals(month)||null==month){
			lists = list;
		}else{
			for(Active active : list){
				String m = String.valueOf(active.getOpenTime().getMonth()+1);
				if(m.equals(month)){
					lists.add(active);
				}
			}
		}
		if(lists!=null&&!lists.isEmpty()&&lists.size()!=0){
			for(Active active:lists){
				SimpleDateFormat dateFormat = new SimpleDateFormat("MMM d, yyyy h:m:s aa", Locale.ENGLISH);
				String date = dateFormat.format(active.getOpenTime());
				active.setDetailImg(date);
			}
		}
		data = new HashMap<String,Object>();
		data.put("status","success");
		data.put("data",lists);
		
		HttpWebIOHelper._printWebJson(data, response);
	}
	
	@RequestMapping(path = "/activeDetail")
	public void getActiveDetail(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Integer id = Integer.valueOf(request.getParameter("id"));
		Active active = activeService.find(id);
		List<Material> materials = materialService.findByHql(" FROM  Material WHERE activeId = "+id+" ORDER BY orderNum,addTime  ");
		data = new HashMap<String,Object>();
		data.put("status","success");
		data.put("data",active);
		data.put("materials", materials);
		
		HttpWebIOHelper._printWebJson(data, response);
	}
	
	
	public void setData(Map<String, Object> data) {
		this.data = data;
	}
}
