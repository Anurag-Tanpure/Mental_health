package com.mental_health.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String showHomePage() {
    	
    	System.out.println("page called");
    	return "front"; // This will resolve to front.jsp
    }
    
    // ************* mood track code *****************//

    @RequestMapping("/mood")
    public String moodtrack() {
    	
    	System.out.println("page called");
    	return "moodtrack"; // This will resolve to front.jsp
    }
    
    // ************* mood track code *****************//

    @RequestMapping("/therepist")
    public String therepist() {
    	
    	System.out.println("page called");
    	return "journal"; // This will resolve to front.jsp
    }
    
    @RequestMapping("/log")
    public String login1() {
    	
    	System.out.println("page called");
    	return "login"; // This will resolve to front.jsp
    }
    @RequestMapping("/chat")
    public String chat() {
    	
    	System.out.println("page called");
    	return "chatboat"; // This will resolve to front.jsp
    }
}
