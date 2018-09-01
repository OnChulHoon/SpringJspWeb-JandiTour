package com.janditour.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.janditour.service.NoticeService;
import com.janditour.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	@Qualifier("noticeService")
	private NoticeService noticeService;
	
	@RequestMapping(value = "/notice_list.action", method=RequestMethod.GET)
	public String showListView(Model model) {
		
		List<Notice> notice = noticeService.findNotice();
	
		model.addAttribute("notice", notice);
		return "notice/notice_list";
		
	}
	
	
	@RequestMapping(value = "/notice_write.action", method=RequestMethod.GET)
	public String showWriteView() {
		return "notice/notice_write";
	}
	@RequestMapping(value = "/notice_write.action", method=RequestMethod.POST)
	public String noticeWrite(Notice notice) {
		
		System.out.println(notice.getNoticeNo());
		noticeService.writeNotice(notice);
		
		
		return "redirect:notice_list.action";
	}
	
	@RequestMapping(value = "/notice_delete.action", method=RequestMethod.GET)
	public String noticeDelete(int noticeNo) {
		if (noticeNo < 0) {
			return "redirect:notice_list.action";
		}
		noticeService.deleteNotice(noticeNo);
		return "redirect:notice_list.action";
	}
}
