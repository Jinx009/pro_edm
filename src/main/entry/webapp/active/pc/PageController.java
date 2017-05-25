package main.entry.webapp.active.pc;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

	@RequestMapping(value = "/page/index")
	 public String index(){
		 return "/active/pc/index";
	 }
	
	@RequestMapping(value = "/page/list")
	 public String list(HttpServletRequest req){
		req.setAttribute("type",req.getParameter("type"));
		 return "/active/pc/list";
	 }

	@RequestMapping(value = "/page/detail")
	 public String detail(HttpServletRequest req){
		req.setAttribute("type",req.getParameter("type"));
		req.setAttribute("id",req.getParameter("id"));
		 return "/active/pc/detail";
	 }
	
	@RequestMapping(value = "/page/guide")
	 public String guide(){
		 return "/active/pc/guide";
	 }

	
}
