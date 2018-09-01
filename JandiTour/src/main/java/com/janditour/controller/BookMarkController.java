package com.janditour.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.janditour.service.BookMarkService;
import com.janditour.vo.BookMark;

@Controller
public class BookMarkController{
	
	@Autowired
	@Qualifier("bookMarkService")
	private BookMarkService bookMarkService;
	
	@RequestMapping(value = {"bookMark.action"}, method = {RequestMethod.GET ,RequestMethod.POST})
	@ResponseBody
	public String bookMark(
			String staNo, String staName, String staAddress, String staListCon, String foodNo, String foodName, String foodAddress, 
			String foodListContent, String touNo, String touName, String touAddress, String touListCon, String memNo,
			BookMark bookMark, Model model) {
		
		bookMark.setMemNo(memNo);
		
		if(!foodNo.isEmpty()) {
			bookMark.setBookDiv(foodNo);
			bookMark.setBookName(foodName);
			bookMark.setBookAddress(foodAddress);
			bookMark.setBookListCon(foodListContent);
		} else if(!staNo.isEmpty()) {
			bookMark.setBookDiv(staNo);
			bookMark.setBookName(staName);
			bookMark.setBookAddress(staAddress);
			bookMark.setBookListCon(staListCon);
		} else if(!touNo.isEmpty()) {
			bookMark.setBookDiv(touNo);
			bookMark.setBookName(touName);
			bookMark.setBookAddress(touAddress);
			bookMark.setBookListCon(touListCon);
		} else {
			System.out.println("받아오는값 없음");
		}
		
		bookMarkService.BookMarkWrite(bookMark);
		return "success";
	}
	
	@RequestMapping(value = {"bookMarkRead.action"}, method = {RequestMethod.GET , RequestMethod.POST})
	public String bookMarkRead(Model model, BookMark bookMark, String memNo) {
		bookMark.setMemNo(memNo);
		List<BookMark> attachmentFoo = bookMarkService.BookMarkReadFood(bookMark);
		List<BookMark> attachmentTou = bookMarkService.BookMarkReadTourist(bookMark);
		List<BookMark> attachmentSta = bookMarkService.BookMarkReadStay(bookMark);
		List<BookMark> attachment = bookMarkService.BookMarkRead(bookMark);
		
		model.addAttribute("attachmentFoo", attachmentFoo);
		model.addAttribute("attachmentTou", attachmentTou);
		model.addAttribute("attachmentSta", attachmentSta);
		model.addAttribute("attachment", attachment);
		return "/bookmark/bookmark_list";
	}
	
	@PostMapping(value = {"bookMarkDelete.action"})
	@ResponseBody
	public String bookMarkDelete(String staNo, String foodNo, String touNo, String memNo, BookMark bookMark){
		
		if(!foodNo.isEmpty()) {
			bookMark.setBookDiv(foodNo);
		} else if(!staNo.isEmpty()) {
			bookMark.setBookDiv(staNo);
		} else if(!touNo.isEmpty()) {
			bookMark.setBookDiv(touNo);
		} else {
			System.out.println("받아오는값 없음");
		}
		
		bookMarkService.BookMarkDelete(memNo, bookMark);
		return "success";
	}
	
	@RequestMapping(value = {"bookMarkCheck.action"})
	@ResponseBody
	public String bookMarkCheck(
			String staNo, String foodNo, String touNo, BookMark bookMark, Model model) {
		
		String call=null;
		String reqDiv = null;
		List<BookMark> div = bookMarkService.BookMarkCheck();
		
		if(!foodNo.isEmpty()) {
			reqDiv = foodNo;
		} else if(!staNo.isEmpty()) {
			reqDiv = staNo;
		} else if(!touNo.isEmpty()) {
			reqDiv = touNo;
		} else {
			System.out.println("받아오는값 없음");
		}
		
		for(BookMark book : div) {
			if(reqDiv.equals(book.getBookDiv3()) == true) {
				String sub = book.getBookDiv3().substring(4, 6);
				if(sub.equals("01")){	//01  tourist
					call="successTou";
					break;
				}else if(sub.equals("02")){	//02  stay
					call="successSta";
					break;
				}else if(sub.equals("03")){	//03  food
					call="successFoo";
					break;
				}
			}else {
				call="fail";
			}
		}
		return call;
	}
	
}