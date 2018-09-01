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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.janditour.common.Util;
import com.janditour.service.TouristService;
import com.janditour.ui.ThePager2;
import com.janditour.vo.Food;
import com.janditour.vo.ImageFile;
import com.janditour.vo.Review;
import com.janditour.vo.Stay;
import com.janditour.vo.Tourist;

@Controller
@RequestMapping(value = "/tourist/")
public class TouristController {

	@Autowired
	@Qualifier("touristService")
	private TouristService touristService;

	@RequestMapping(value = "/tourist_list.action", method = GET)
	public String showTourist_listView(
			@RequestParam(value = "pageno", defaultValue = "1") int pageNo,
			String area,
			String area2,
			String touName,
			Model model) {
		
		int pageSize = 9;
		int from = (pageNo - 1) * pageSize + 1;
		int to = from + pageSize;
		
		int pagerSize = 5;
		String linkUrl = "tourist_list.action";	
		
		List<Tourist> tourist = touristService.findTourist(from, to, area, area2, touName);
		int dataCount = touristService.getTouristCount();
		
		ThePager2 pager = new ThePager2(dataCount, pageNo, pageSize, pagerSize, linkUrl);
		
		model.addAttribute("tourists", tourist);
		model.addAttribute("pager", pager);
		model.addAttribute("pageno", pageNo);
		
		return "tourist/tourist_list";
	}

	@RequestMapping(value = "/tourist_write.action", method = GET)
	public String showTourist_writeView() {
		return "/tourist/tourist_write";
	}

	@RequestMapping(value = "/tourist_write.action", method = POST)
	public String tourist_write(MultipartHttpServletRequest req, Tourist tourist) {
		
		//주소 계산
		String num = null;
		switch (tourist.getCitName()) {
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
		
		tourist.setCitNo(num);
		
		
		//이미지 삽입
		ImageFile imageFile = null;
		List<MultipartFile> imgFiles = req.getFiles("touristImage");
		//MultipartFile imgFile = req.getFile("touristImage");

		ArrayList<ImageFile> files = new ArrayList<>();
		int imageIdx = 0;
		
		//for(int i=0; i<=imgFiles.size(); i++) {
		for (MultipartFile imgFile : imgFiles) {
			if (!imgFile.isEmpty() && imgFile.getOriginalFilename().length() != 0) {
				ImageFile file = new ImageFile();
				imageIdx = imageIdx + 1;
				String path = req.getServletContext().getRealPath("/resources/upload-image/tourist-info");
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
		tourist.setAttachments(files);
		
		
		touristService.writeTourist(tourist);

		return "redirect:tourist_list.action";
	}
	
	@RequestMapping(value = "/tourist_detail.action", method = GET)
	public String detail(
			@RequestParam(value = "touristno", defaultValue = "-1") String touristNo,
			@RequestParam(value = "pageno", defaultValue = "1") int pageNo,
			Model model) {
		
		Tourist tourist = touristService.findTouristByTouristNo(touristNo);
		ImageFile image = touristService.findTouristImgByTouristNo(touristNo);
		List<ImageFile> images = touristService.findTouristImageByTouristNo(touristNo);
		
		HashMap<String, Object> params = new HashMap<>();
		
		params.put("touristNo", touristNo);
		params.put("from", 1);
		params.put("to", 5);
		
		List<Review> reviews = touristService.findReview(params);
		
		
		
		Review average = null;
		if(reviews != null && reviews.size()!=0) {
			int e_average1 = tourist.getTouRating();
			average = touristService.ReviewAverage(touristNo);
			int e_average2 = average.getAverage();
			
			if(average != null && e_average1 != e_average2) {
				int avg = average.getAverage();
				touristService.updateAvg(avg, touristNo);
			}
		}
		
		String inputAddress = tourist.getTouAddress();
		String citName = inputAddress.substring(0, inputAddress.indexOf(" "));
		tourist.setCitName(citName);
		
		HashMap<String, Object> params2 = new HashMap<>();
		
		params2.put("citName", citName);
		params2.put("from", 1);
		params2.put("to", 6);
		
		List<Food> foods = touristService.findFoodList(params2);
		List<Stay> stays = touristService.findStayList(citName);
		
		model.addAttribute("tourist", tourist);
		model.addAttribute("images", images);
		model.addAttribute("image", image);
		model.addAttribute("reviews", reviews);
		model.addAttribute("average", average);
		model.addAttribute("pageno", pageNo);
		model.addAttribute("foods", foods);
		model.addAttribute("stays", stays);
		
		return "tourist/tourist_detail";
	}
	
	@RequestMapping(value = "/tourist_review.action", method = POST)
	@ResponseBody
	public String review(
			@RequestParam(value = "touristno", defaultValue = "1") String touristNo,
			String memId,
			Review review) {
		
		review.setMemId(memId);
		review.setPgNo(touristNo);
		
		touristService.writeReview(review);
		
		return "success";
	}
	
	@GetMapping(value = "/findReviews.action")
	public String findReviews(String touristNo, int re_pageNo, Model model) {
		
		HashMap<String, Object> params = new HashMap<>();
		
		params.put("touristNo", touristNo);
		params.put("from", 1);
		params.put("to", 4*(re_pageNo-1)+5);
		
		List<Review> reviews = touristService.findReview(params);
		Review average = touristService.ReviewAverage(touristNo);
		int avg = average.getAverage();
		touristService.updateAvg(avg, touristNo);
		
		model.addAttribute("reviews", reviews);
		model.addAttribute("average", average);
		
		return "tourist/tourist_comments";
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
		
		touristService.updateReview(review);
		
		return "success";
	}
	
	@RequestMapping(value = "/delete_review.action", method = POST)
	@ResponseBody
	public String deleteReview(int reNo) {
		
		touristService.deleteReview(reNo);
		
		return "success";
	}
	
	@RequestMapping(value = "/tourist_delete.action", method = GET)
	public String touristDelete(String touristNo) {
		
		touristService.touristDelete(touristNo);
		
		return "redirect:tourist_list.action";
	}
	
	@RequestMapping(value = "/tourist_update.action", method = GET)
	public String showTourist_updateView(String touristNo, Model model) {
		
		Tourist tourist = touristService.findTouristByTouristNo(touristNo);
		
		String inputAddress = tourist.getTouAddress();
		String citName = inputAddress.substring(0, inputAddress.indexOf(" "));
		tourist.setCitName(citName);
		
		String outputAddress = inputAddress.substring(inputAddress.indexOf(" ")+1, inputAddress.length());
		tourist.setTouAddress(outputAddress);
		
		model.addAttribute("tourist", tourist);
		
		return "/tourist/tourist_update";
	}
	
	@RequestMapping(value = "/tourist_update.action", method = POST)
	public String tourist_update(MultipartHttpServletRequest req, Tourist tourist,
			Model model, String touristNo) {
		
		//주소 계산
		String num = null;
		switch (tourist.getCitName()) {
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
		
		tourist.setCitNo(num);
		
		tourist.setTouNo(touristNo);
		
		touristService.updateDeleteImage(tourist.getTouNo());
		
		//이미지 삽입
		ImageFile imageFile = null;
		List<MultipartFile> imgFiles = req.getFiles("touristImage");
		//MultipartFile imgFile = req.getFile("touristImage");

		ArrayList<ImageFile> files = new ArrayList<>();
		int imageIdx = 0;
		
		//for(int i=0; i<=imgFiles.size(); i++) {
		for (MultipartFile imgFile : imgFiles) {
			if (!imgFile.isEmpty() && imgFile.getOriginalFilename().length() != 0) {
				ImageFile file = new ImageFile();
				imageIdx = imageIdx + 1;
				String path = req.getServletContext().getRealPath("/resources/upload-image/tourist-info");
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
		tourist.setAttachments(files);
		
		touristService.updateTourist(tourist);
		
		model.addAttribute("tourist", tourist);

		return "redirect:tourist_detail.action?touristno=" + tourist.getTouNo();
	}
	
}
