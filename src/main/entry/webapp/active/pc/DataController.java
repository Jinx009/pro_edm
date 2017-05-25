package main.entry.webapp.active.pc;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import common.helper.HttpWebIOHelper;
import database.models.active.Active;
import service.basicFunctions.active.ActiveService;

@Controller
public class DataController {

	@Autowired
	private ActiveService activeService;
	
	private Map<String,Object> data;
	
	@RequestMapping(value = "/pc/activeList")
	public void pcList(HttpServletResponse response) throws IOException{
		data = new HashMap<String,Object>();
		List<Active> list = activeService.findByHql(" FROM Active ORDER BY orderNum,addTime DESC ");
		if(list!=null&&!list.isEmpty()){
			for(Active active:list){
				SimpleDateFormat dateFormat = new SimpleDateFormat("MMM d, yyyy h:m:s aa", Locale.ENGLISH);
				String date = dateFormat.format(active.getOpenTime());
				active.setDetailImg(date);
			}
		}
		data.put("status","success");
		data.put("data",list);
		HttpWebIOHelper._printWebJson(data, response);
	}

	public void setData(Map<String, Object> data) {
		this.data = data;
	}
}
