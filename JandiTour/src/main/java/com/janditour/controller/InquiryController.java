package com.janditour.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.janditour.service.InquiryService;
import com.janditour.vo.Inquiry;
import com.janditour.vo.Notice;


@Controller
public class InquiryController {
	
	@Autowired
	@Qualifier("inquiryService")
	private InquiryService inquiryService;
	
	@RequestMapping(value = "/inquiry_write.action", method=RequestMethod.POST)
	public String inquiryWrite(Inquiry inquiry) {
	
		inquiryService.writeInquiry(inquiry);
		
		return "redirect:inquiry_list.action";
	}
	
	@RequestMapping(value = "/inquiry_list.action", method=RequestMethod.GET)
	public String showInquiryView(Model model) {
		
		List<Inquiry> inquiry = inquiryService.findInquiry();
		
		model.addAttribute("inquiry", inquiry);
		return "inquiry/inquiry_list";
		
	}
	@RequestMapping(value = "/inquiry_delete.action", method=RequestMethod.GET)
	public String inquiryDelete(int inqNo) {
		if (inqNo < 0) {
			return "redirect:inquiry_list.action";
		}
		inquiryService.deleteInquiry(inqNo);
		return "redirect:inquiry_list.action";
	}

}
