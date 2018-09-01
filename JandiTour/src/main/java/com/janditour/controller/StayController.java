package com.janditour.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.janditour.common.Util;
import com.janditour.service.StayService;
import com.janditour.ui.ThePager2;
import com.janditour.vo.Food;
import com.janditour.vo.ImageFile;
import com.janditour.vo.Review;
import com.janditour.vo.Stay;

@Controller
public class StayController {
	
	@Autowired
	@Qualifier("stayService")
	private StayService stayService;
	
	@RequestMapping(value = { "/stay.action" }, method = GET)
	public String staylistView(
			@RequestParam(value = "pageno", defaultValue = "1") int pageNo,
			String area,
			String area2,
			String staName,
			Model model) {
		
		int pageSize = 9;
		int from = (pageNo - 1) * pageSize + 1;
		int to = from + pageSize;
		
		int pagerSize = 5;
		String linkUrl = "stay.action";	
		
		List<Stay> stays = stayService.findStay(from,to,area,area2,staName);
		int dataCount = stayService.getStayCount();
		
		ThePager2 pager = new ThePager2(dataCount, pageNo, pageSize, pagerSize, linkUrl);
		
		model.addAttribute("stays",stays);
		model.addAttribute("pager", pager);
		model.addAttribute("pageno", pageNo);
	
		return "stay/stay";
	}
	
	@RequestMapping(value = { "/stay_write.action" }, method = GET)
	public String staywriteView() {
		return "stay/stay_write";
	}
	
	@RequestMapping(value = "/stay_write.action", method = POST)
	public String write(MultipartHttpServletRequest req, Stay stay) {
		
		//주소 계산
		String num = null;
		switch (stay.getCitName()) {
		case "서울특별시": num = "100"; break;
		case "인천광역시": num = "101"; break;
		case "경기도": num = "102"; break;
		case "부산광역시": num = "200"; break;
		case "울산광역시": num = "201"; break;
		case "대구광역시": num = "202"; break;
		case "경상북도": num = "203"; break;
		case "경상남도": num = "204"; break;
		case "광주광역시": num = "300"; break;
		case "전라북도": num = "301"; break;
		case "전라남도": num = "302"; break;
		case "대전광역시": num = "400"; break;
		case "충청북도": num = "401"; break;
		case "충청남도": num = "402"; break;
		case "강원도": num = "500"; break;
		case "제주도": num = "600"; break;
		}
		
		stay.setCitNo(num);
		
		
		//이미지 삽입
		ImageFile imageFile = null;
		List<MultipartFile> imgFiles = req.getFiles("stayImage");
		//MultipartFile imgFile = req.getFile("touristImage");

		ArrayList<ImageFile> files = new ArrayList<>();
		int imageIdx = 0;
		
		//for(int i=0; i<=imgFiles.size(); i++) {
		for (MultipartFile imgFile : imgFiles) {
			if (!imgFile.isEmpty() && imgFile.getOriginalFilename().length() != 0) {
				ImageFile file = new ImageFile();
				imageIdx = imageIdx + 1;
				String path = req.getServletContext().getRealPath("/resources/upload-image/stay-info");
				String savedImageFileName = imgFile.getOriginalFilename();
				savedImageFileName = Util.getUniqueFileName(savedImageFileName);
				file.setSavedImageFileName(savedImageFileName);
				file.setImageIdx(imageIdx);
				try {
					imgFile.transferTo(new File(path, savedImageFileName));
					imageFile = new ImageFile();
					imageFile.setSavedImageFileName(savedImageFileName);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (Exception e) {

					e.printStackTrace();
				}
				
				files.add(file);
			}
		}

		//ArrayList<ImageFile> imgAttachments = new ArrayList<>();
		//imgAttachments.add(imageFile);
		stay.setAttachments(files);
		
		
		stayService.writeStay(stay);

		return "redirect:stay.action";
	}
	
	
	@RequestMapping(value = { "/stay_detail.action" }, method = RequestMethod.GET)
	public String staydetailView(
			@RequestParam(value="staNo",defaultValue="-1") String staNo,
			@RequestParam(value = "pageno", defaultValue = "1") int pageNo,
								Model model) {
		
		Stay stay = stayService.findStayByStayNo(staNo);
		ImageFile image = stayService.findStayImgByStayNo(staNo);
		
		List<ImageFile> images = stayService.findStayImageByStayNo(staNo);
		
		HashMap<String, Object> params = new HashMap<>();
		
		params.put("staNo", staNo);
		params.put("from", 1);
		params.put("to", 5);
		
		List<Review> reviews = stayService.findReviewsByStayNo(params);
		
		
		Review average = null;
		if(reviews != null && reviews.size()!=0) {
			int e_average1 = stay.getStaRating();
			average = stayService.ReviewAverage(staNo);
			int e_average2 = average.getAverage();
			
			if(average != null && e_average1 != e_average2) {
				int avg = average.getAverage();
				stayService.updateAvg(avg, staNo);
			}
		}
		
		String inputAddress = stay.getStaAddress();
		String citName = inputAddress.substring(0, inputAddress.indexOf(" "));
		stay.setCitName(citName);
		
		HashMap<String, Object> params2 = new HashMap<>();
		
		params2.put("citName", citName);
		params2.put("from", 1);
		params2.put("to", 6);
		
		List<Food> foods = stayService.findFoodList(params2);
		List<Stay> tourists = stayService.findTouList(citName);
		
		model.addAttribute("stay",stay);
		model.addAttribute("image",image);
		model.addAttribute("images",images);
		model.addAttribute("reviews", reviews);
		model.addAttribute("average", average);
		
		model.addAttribute("pageno",pageNo);
		model.addAttribute("foods", foods);
		model.addAttribute("tourists", tourists);
		
		
		return "stay/stay_detail";
	}
	
	@RequestMapping(value = { "/stay_delete.action" }, method = RequestMethod.GET)
	public String staydelete(String staNo) {
		
		stayService.deleteStay(staNo);
		stayService.deleteStayImg(staNo);
		
		return "redirect:stay.action";
	}
	
	@RequestMapping(value = { "/stay_update.action" }, method = RequestMethod.GET)
	public String stayupdateView(@RequestParam(value="staNo",defaultValue="-1") String staNo,
							 Model model) {
		
		// 글(정보)번호 값이 없으면 목록페이지 이동시킨다.		
		if (staNo == null) {return "redirect:stay_list.action";}
		
		Stay stay = stayService.findStayByStayNo(staNo);
		
		// DB에서 읽어들인 정보값이 없으면 목록페이지 이동시킨다.
		if (stay == null) {return "redirect:stay_list.action";}
		
		// 기존에 입력한 도시 이름을 ***Address 데이터에서 추출해서 citName 변수에 저장한다.
		String inputAddress = stay.getStaAddress();
		String citName = inputAddress.substring(0, inputAddress.indexOf(" "));
		stay.setCitName(citName);
		
		// 기존에 입력된 주소에서 도시이름을 제외하여 수정페이지에 표시되도록 변수값을 다시 저장한다.
		String outputAddress = inputAddress.substring(inputAddress.indexOf(" ")+1, inputAddress.length());
		stay.setStaAddress(outputAddress);
		
		// DB에서 읽어들인 기존에 입력된 데이터들을 model 객체에 담아 수정페이지로 정보를 보낸다.
		model.addAttribute("stay", stay);
	
		
		return "stay/stay_update";
	}
	
	@RequestMapping(value = "/stay_update.action", method = POST)
	public String updateStay(Stay stay,
			@RequestParam(value="staNo", defaultValue="-1") String staNo,
			MultipartHttpServletRequest req, Model model) {

		String num = null;
		switch (stay.getCitName()) {
		case "서울특별시": num = "100"; break;
		case "인천광역시": num = "101"; break;
		case "경기도": num = "102"; break;
		case "부산광역시": num = "200"; break;
		case "울산광역시": num = "201"; break;
		case "대구광역시": num = "202"; break;
		case "경상북도": num = "203"; break;
		case "경상남도": num = "204"; break;
		case "광주광역시": num = "300"; break;
		case "전라북도": num = "301"; break;
		case "전라남도": num = "302"; break;
		case "대전광역시": num = "400"; break;
		case "충청북도": num = "401"; break;
		case "충청남도": num = "402"; break;
		case "강원도": num = "500"; break;
		case "제주도": num = "600"; break;
		}
		
		stay.setCitNo(num);
		// 기존 입력된 글(정보)번호와 연결된 이미지를 IMAGE 테이블에서 검색 후 모두 삭제한다. 
		stayService.modifyDeleteStayImages(stay.getStaNo());
		
		// 새로 선택한 이미지를 업로드한다.
		ImageFile imageFile = null;
		List<MultipartFile> imgFiles = req.getFiles("stayImage");
		ArrayList<ImageFile> files = new ArrayList<>();
		int imageIdx = 0;
		for (MultipartFile imgFile : imgFiles) {
			if(!imgFile.isEmpty() && imgFile.getOriginalFilename().length() != 0) {
				ImageFile file = new ImageFile();
				imageIdx = imageIdx + 1;
				String path = req.getServletContext().getRealPath("/resources/upload-image/stay-info");
				String savedImageFileName = imgFile.getOriginalFilename();
				savedImageFileName = Util.getUniqueFileName(savedImageFileName);
				file.setSavedImageFileName(savedImageFileName);
				file.setImageIdx(imageIdx);
					try {
						imgFile.transferTo(new File(path, savedImageFileName));
						imageFile = new ImageFile();
						imageFile.setSavedImageFileName(savedImageFileName);	
					} catch (Exception e) {e.printStackTrace();}
					files.add(file);
			}
		}
		stay.setAttachments(files);
		
		// 새로 입력한 정보를 DB에 수정 입력한다.
		stayService.modifyStayWithImages(stay);
		// 수정된 정보를 model 객체에 담아 상세페이지로 정보를 보낸다. 
		model.addAttribute("stay", stay);
		
		return "redirect:stay_detail.action?staNo=" + stay.getStaNo();
	}
	
	@PostMapping(value = "/stay_review.action")
	@ResponseBody
	public String stayReview(String staNo,String memId,Review review) {
		
		review.setMemId(memId);
		review.setPgNo(staNo);
		
		stayService.writeStayReview(review);
		

		return "success";
	}
	
	@GetMapping(value = "/findreviews.action")
	public String findReview(String staNo, int pageNo, Model model) {
		
		HashMap<String, Object> params = new HashMap<>();
		
		params.put("staNo", staNo);
		params.put("from", 1);
		params.put("to", 4*(pageNo-1)+5);
		
		List<Review> reviews = stayService.findReviewsByStayNo(params);
		Review average = stayService.ReviewAverage(staNo);
		
		int avg = average.getAverage();
		stayService.updateAvg(avg, staNo);
		
		model.addAttribute("reviews", reviews);
		model.addAttribute("average", average);
		
		return "stay/stay_comments";
	}
	
	@RequestMapping(value = "/update_review.action", method = POST)
	@ResponseBody
	public String updateReview(
			int reNo,
			int evaluation,
			String content,
			Review review) {
		
		review.setReNo(reNo);
		review.setEvaluation(evaluation);
		review.setReContent(content);
		
		stayService.updateReview(review);
		
		return "success";
	}
	@RequestMapping(value = "/delete_review.action", method = POST)
	@ResponseBody
	public String deleteReview(int reNo) {
		
		stayService.deleteReview(reNo);
		
		return "success";
	}
	
}







