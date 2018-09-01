package com.janditour.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.janditour.service.FoodService;
import com.janditour.service.TouristService;
import com.janditour.vo.Food;
import com.janditour.vo.Stay;
import com.janditour.vo.Tourist;

import static org.springframework.web.bind.annotation.RequestMethod.*;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

@Controller
public class HomeController {
	
	@Autowired
	@Qualifier(value = "foodService")
	private FoodService foodService;
	
	@Autowired
	@Qualifier(value = "touristService")
	private TouristService touristService;
	
	@GetMapping(value = { "/", "/home.action" })
	public String home(Model model) {
		
		//////////////////////////////////////////////////////////////
		
		List<Food> foodInfos = foodService.findFoodInfos();
		List<Tourist> touristInfos = foodService.findTouristInfo();
		List<Stay> stayInfos = foodService.findStayInfo();
		
		model.addAttribute("foodInfos", foodInfos);
		model.addAttribute("touristInfos", touristInfos);
		model.addAttribute("stayInfos", stayInfos);
		
		//////////////////////////////////////////////////////////////
		
		String pos1	= "east";
		String pos2	= "west";
		String pos3	= "south";
		List<Tourist> eastIsland = touristService.findIsland(pos1);
		List<Tourist> westIsland = touristService.findIsland(pos2);
		List<Tourist> southIsland = touristService.findIsland(pos3);
		
		model.addAttribute("eastIsland", eastIsland);
		model.addAttribute("westIsland", westIsland);
		model.addAttribute("southIsland", southIsland);
		
		return "home";
	}
	
	@GetMapping(value = "/loading.action")
	public String showLoading() {
		return "include/loading";
	}

	@RequestMapping(value = "/comingsoon.action", method = GET)
	public String comingsoon() {
		return "coming-soon";
	}
	

}







