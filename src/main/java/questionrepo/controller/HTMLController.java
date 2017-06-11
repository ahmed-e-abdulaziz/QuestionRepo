package questionrepo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HTMLController {

	@RequestMapping({"/","/index"})
	public String index(){	
		return "index";
	}
	
	@RequestMapping("/form")
	public String form(){
		
		return "questionrepo/form";
	}
	

	@RequestMapping("/settings")
	public String settings(){
		
		return "questionrepo/settings";
	}

	
}
