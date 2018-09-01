package com.janditour.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import com.janditour.common.Util;
import com.janditour.service.FoodService;
import com.janditour.service.TravelNoteService;
import com.janditour.vo.ImageFile;
import com.janditour.vo.RentalCar;
import com.janditour.vo.TravelNote;

@Controller
public class TravelNoteController {
    
	@Autowired
	@Qualifier(value="travelNoteService")
	private TravelNoteService travelNoteService;
	
	//여행기 리스트 접속(Get)
	@RequestMapping(value = { "/travelnote_list.action" }, method = RequestMethod.GET)
	public String showTravelList(@RequestParam(value="trnNo", defaultValue="1") int trnNo,Model model) {
		
		int pageSize = 3; //한 페이지에 표시할 데이터 갯수
		int from = (trnNo - 1) * pageSize + 1; // pageNo * pageSize - pageSize + 1
		int to = from + pageSize;
		
		int pagerSize = 2;//번호로 표시할 페이지 목록
		String linkUrl = "travelnote_list.action";	
		
		//목록 조회
		//List<TravelNote> noteList = travelNoteService.findTravelNoteList();
		HashMap<String, Object> params = new HashMap<>();
		params.put("from", from);
		params.put("to", to);
		List<TravelNote> noteList = travelNoteService.findTravelNoteListWithPaging(params);
		int dataCount = travelNoteService.getTravelNoteCount();
		//페이저 객체 만들기
//		RentalCarPager pager = new RentalCarPager(dataCount, pageNo, pageSize, pagerSize, linkUrl);
		TravelnNotePager pager = new TravelnNotePager(dataCount, trnNo, pageSize, pagerSize, linkUrl);
		
		//JSP에서 읽을 수 있도록 데이터 저장
		model.addAttribute("noteList", noteList);
		model.addAttribute("pager", pager);
		model.addAttribute("trnNo", trnNo);
		
		return "travelnote/trnlist";
	}
	
	//여행기 리스트 접속(Post)
	@RequestMapping(value = { "/travelnote/trnlist.action" }, method = RequestMethod.POST)
	public String TravelList() {
		return "";
	}
	

	//----------------------------------------------------
	
	//여행기 작성 접속 부분(GET(T))
	//@RequestMapping(value = { "/travelnote_writer.action" }, method = RequestMethod.GET)
	@GetMapping(value = { "/travelnote_writer.action" })
	public String showTravelWrite() {
		return "travelnote/trnwriter";
	}
	
	//여행기 작성 접속 부분(POST(T))
	//@RequestMapping(value = { "/travelnote_writer.action" }, method = RequestMethod.POST)
	@PostMapping(value = { "/travelnote_writer.action" })
	public String infoTravelWrite_title(
			MultipartHttpServletRequest req, //파일 업로드가 포함된 경우 사용하는 HttpServletRequest 객체
			TravelNote travelNote) { 

		//form 태그의 <input type="file" name="travelnote_image" 의 파일을 읽어서 변수에 저장
		MultipartFile travelNoteImage = req.getFile("travelnote_image");
		
		//파일을 저장할 디렉터리 경로
		String uploadPath = 
			req.getServletContext().getRealPath("/resources/upload-image/travelnote-info");
	
		//업로드한 파일의 원래 이름
		String fileName = travelNoteImage.getOriginalFilename();
		
		//파일에 디렉터리 경로가 붙어있는 경우 디렉터리 경로 제거 (internet explorer 때문에)
		//C:\a\b\c.png -> c.png
		if (fileName.contains("\\")) {
			fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
		}
		
		//파일이름을 고유하게 만드는 작업
		fileName = Util.getUniqueFileName(fileName);
				
		try {
			//임시파일 또는 메모리에서 목적지 경로로 파일을 이동 (저장)
			travelNoteImage.transferTo(new File(uploadPath, fileName));
			//원본이미지에 대해 작은 사이즈의 이미지를 만드는 작업
			Util.makeThumbnail(uploadPath, fileName, 150, 150);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		//실제 저장된 파일 이름을 VO에 저장
		travelNote.setTrnPic(fileName);
		
		//데이터에 내용을 입력하는 구분
		travelNoteService.writeTravelNote(travelNote);

		return "redirect:travelnote_list.action";
	}
	
	
	//----------------------------------------------------
	
	//여행기 디테일 접속 부분(GET)
	//@RequestMapping(value = { "/travelnote_detail.action" }, method = RequestMethod.GET)
	@GetMapping(value = { "/travelnote_detail.action" })
	public String showTravelDedail(
			@RequestParam(defaultValue="-1") int trnNo,
			Model model) {
	        
        TravelNote travelNote = travelNoteService.findTravelNoteByTrnNo(trnNo);
        
        model.addAttribute("travelNote", travelNote);
	
		return "travelnote/trndetail";
	}
	
//	//여행기 디테일 접속 부분(POST)
//	//@RequestMapping(value = { "" }, method = RequestMethod.POST)
//	@PostMapping(value = { "/travelnote_detail.action" })
//	public String TravelDedail_title() {
//		return "redirect:travelnote_list.action";
//	}
	
	
	//----------------------------------------------------
	
	//여행기 업로드(수정) 접속 부분(GET)
	@RequestMapping(value = { "/travelnote_update.action" }, method = RequestMethod.GET)
	public String showTravelUpdate(@RequestParam(value="trnNo", defaultValue="-1") int trnNo,
			Model model) {
		
		System.out.println(trnNo);
		System.out.println();
		
		if (trnNo == -1) {
			return "redirect:travelnote_list.action";		
		}
		
		System.out.println(trnNo);
		
		TravelNote travelNote = travelNoteService.findTravelNoteByTrnNo(trnNo);
		
		model.addAttribute("travelNote", travelNote);
		
		return "travelnote/trnupdate";
	}
	
	//여행기 업로드(수정) 접속 부분(POST)
	@RequestMapping(value = { "/travelnote_update.action" }, method = RequestMethod.POST)
	public String TravelUpdate(
			MultipartHttpServletRequest req,
			TravelNote travelNote) {
		
		//form 태그의 <input type="file" name="travelnote_image" 의 파일을 읽어서 변수에 저장
		MultipartFile travelNoteImage = req.getFile("travelnote_image");
		
		//파일을 저장할 디렉터리 경로
		String uploadPath = 
			req.getServletContext().getRealPath("/resources/upload-image/travelnote-info");
	
		//업로드한 파일의 원래 이름
		String fileName = travelNoteImage.getOriginalFilename();
		
		//파일에 디렉터리 경로가 붙어있는 경우 디렉터리 경로 제거 (internet explorer 때문에)
		//C:\a\b\c.png -> c.png
		if (fileName.contains("\\")) {
			fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
		}
		
		//파일이름을 고유하게 만드는 작업
		fileName = Util.getUniqueFileName(fileName);
				
		try {
			//임시파일 또는 메모리에서 목적지 경로로 파일을 이동 (저장)
			travelNoteImage.transferTo(new File(uploadPath, fileName));
			//원본이미지에 대해 작은 사이즈의 이미지를 만드는 작업
			Util.makeThumbnail(uploadPath, fileName, 150, 150);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		//실제 저장된 파일 이름을 VO에 저장
		travelNote.setTrnPic(fileName);
		
		//데이터에 내용을 입력하는 구분
		
		travelNoteService.modifyTravelNoteInfo(travelNote);
		
		//return "redirect:travelnote_detail.action?trnNo=";
		return "redirect:travelnote_detail.action?trnNo="+ travelNote.getTrnNo();
	}
	
	//목록에 있는 글을 삭제할 수 있는 입력 구문
	@RequestMapping(value = { "/travelnote_delete.action" }, method = RequestMethod.GET)
	public String deleteTravelNoteInfo(
			@RequestParam(defaultValue="-1") int trnNo) {
		
		travelNoteService.deleteTravelNoteInfo(trnNo);
		
		return "redirect:travelnote_list.action";
		
	}
	
	/////////////////////////////////////////////////////////
	// 댓글 처리
//	
//	@PostMapping(value = "/writecomment.action")
//	public String writeComment(BoardComment comment, int pageNo) {
//		
//		boardService.writeComment(comment);
//		
//		return String.format("redirect:detail.action?boardno=%d&pageno%d",
//				comment.getBoardNo(),pageNo);
//	}
//	
//	@PostMapping(value = "/writecomment2.action")
//	@ResponseBody
//	public String writeComment2(BoardComment comment, int pageNo) {
//		
//		boardService.writeComment(comment);
//		
//		return "success";
//	}
//	
//	@GetMapping(value = "/findcomments.action")
//	public String findcomments(int boardNo, Model model) {
//		
//		List<BoardComment> comments = boardService.findcommentsByBoardNo(boardNo);
//		
//		model.addAttribute("comments", comments);
//		
//		return "board/comments";
//	}
	
	
}
