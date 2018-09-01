package com.janditour.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.janditour.common.Util;
import com.janditour.service.RentalCarService;
import com.janditour.vo.RentalCar;

@Controller
@RequestMapping()
public class RentalCarController {
	
	@Autowired
	@Qualifier("rentalCarService")
	private RentalCarService rentalCarService;

	//@RequestMapping
	@RequestMapping("/rentalcar/detail.action")
	public String showDetail(
			@RequestParam(defaultValue="0") int renNo, Model model) {
		
		RentalCar rentalCar = rentalCarService.searchRentalCarByNo(renNo);
		model.addAttribute("rentalCar", rentalCar);
		
		return "rentalcar/rentalcar_detail";
	}
	
	@GetMapping("/rentalcar/list.action")
	public String showList(@RequestParam(value="pageno", defaultValue="1") int pageNo, Model model) {
		
		int pageSize = 3; //한 페이지에 표시할 데이터 갯수
		int from = (pageNo - 1) * pageSize + 1; // pageNo * pageSize - pageSize + 1
		int to = from + pageSize;
		
		int pagerSize = 2;//번호로 표시할 페이지 목록
		String linkUrl = "list.action";		
		
		//데이터 처리 (게시물 목록을 DB에서 조회 - 서비스 객체에 요청)		
		//List<Board> boards = service.findBoard();
		List<RentalCar> boards = rentalCarService.findBoardWithPaging(from, to);
		int dataCount = rentalCarService.getBoardCount();
		
		//페이저 객체 만들기
		//ThePager pager = new ThePager(dataCount, pageNo, pageSize, pagerSize, linkUrl);
    	RentalCarPager pager = new RentalCarPager(dataCount, pageNo, pageSize, pagerSize, linkUrl);
		
    	//List<RentalCar> rentalCarList = rentalCarService.searchRentalCar();
	    //model.addAttribute("rentalCarList", rentalCarList);
	    
		//JSP에서 데이터를 읽을 수 있도록 request 객체에 데이터 저장
		model.addAttribute("rentalCarList", boards);
		model.addAttribute("pager", pager);
		model.addAttribute("pageno", pageNo);
		
		return "rentalcar/board-list";
	}
	
	@GetMapping("/rentalcar/write.action")
	public String showWriteForm() {
		return "rentalcar/rentalcar_write";
	}
	
	@PostMapping("/rentalcar/write.action")
	//public String write(RentalCar r, @RequestParam("car_image")MultipartFile carImage) {
	public String write(MultipartHttpServletRequest req, RentalCar r) {		
		
		//form 태그의 <input type="file" name="car_image" 의 파일을 읽어서 변수에 저장
		MultipartFile carImage = req.getFile("car_image");
		
		//파일을 저장할 디렉터리 경로
		String uploadPath = 
			req.getServletContext().getRealPath("/resources/upload-image/rentalcar-info");
	
		//업로드한 파일의 원래 이름
		String fileName = carImage.getOriginalFilename();
		
		//파일에 디렉터리 경로가 붙어있는 경우 디렉터리 경로 제거 (internet explorer 때문에)
		//C:\a\b\c.png -> c.png
		if (fileName.contains("\\")) {
			fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
		}
		
		//파일이름을 고유하게 만드는 작업
		fileName = Util.getUniqueFileName(fileName);
				
		try {
			//임시파일 또는 메모리에서 목적지 경로로 파일을 이동 (저장)
			carImage.transferTo(new File(uploadPath, fileName));
			//원본이미지에 대해 작은 사이즈의 이미지를 만드는 작업
			Util.makeThumbnail(uploadPath, fileName, 150, 150);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		//파일 이름을 VO에 저장
		r.setRenPic(fileName);
		//데이터베이스에 데이터 저장 요청 (서비스 객체 사용)
		rentalCarService.writeRentalCar(r);
		
		return "redirect:list.action";		
	}
	
	@RequestMapping("/rentalcar/reply.action")
    public String showReplyForm() {
		return "rentalcar/rentalcar_reply";
	}
	
	//화면 표시
	@GetMapping(value = "/rentalcar/update.action")
	public String showUpdateForm() {
		return "rentalcar/rentalcar_update";
		
	}
	
	@PostMapping(value = "/rentalcar/update.action")
	public String update(MultipartHttpServletRequest req, RentalCar r) {
		//업데이트 처리(데이터베이스 저장)
		return "redirect:detail.action?renNo="+r.getRenNo();
		
	}
		
	@GetMapping("/rentalcar/delete.action")
	public String showDeleteForm() {
		//삭제 처리 구현
		//목록으로 이동
		return "redirect:list.action";
	}
	
}
