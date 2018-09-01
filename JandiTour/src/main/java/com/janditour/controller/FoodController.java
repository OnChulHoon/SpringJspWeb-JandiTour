package com.janditour.controller;


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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.janditour.common.Util;
import com.janditour.service.FoodService;
import com.janditour.service.StayService;
import com.janditour.service.TouristService;
import com.janditour.ui.ThePager2;
import com.janditour.vo.Food;
import com.janditour.vo.ImageFile;
import com.janditour.vo.Review;
import com.janditour.vo.Stay;
import com.janditour.vo.Tourist;

@Controller
//@RequestMapping(value = "/food/")
public class FoodController {

	@Autowired
	@Qualifier(value = "foodService")
	private FoodService foodService;
	
	@Autowired
	@Qualifier(value = "touristService")
	private TouristService touristService;
	
	@Autowired
	@Qualifier(value = "stayService")
	private StayService stayService;
	
	@GetMapping(value = "/food_list.action")
	public String showFoodList(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, String area, String area2, String foodName, Model model) {
		
		int pageSize = 9;
		int from = (pageNo - 1) * pageSize + 1;
		int to = from + pageSize;
		
		int pagerSize = 5;
		String linkUrl = "food_list.action";
		
		List<Food> foodInfos = foodService.findFoodInfo(from, to, area, area2, foodName);
		int dataCount = foodService.getFoodInfoCount();
		
		ThePager2 pager = new ThePager2(dataCount, pageNo, pageSize, pagerSize, linkUrl);
		
		
		model.addAttribute("foodInfos",foodInfos);
		model.addAttribute("pager", pager);
		model.addAttribute("pageNo", pageNo);

		return "food/food_list";
	}

	@GetMapping(value = "/food_write.action")
	public String showWriteForm() {
		return "food/food_write";
	}


	@PostMapping(value = "/food_write.action")
	public String writeFoodInfo(Food food, MultipartHttpServletRequest req) {
		
		//주소 계산
		String num = null;
		switch (food.getCitName()) {
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
		
		food.setCitNo(num);

		ImageFile imageFile = null;
		List<MultipartFile> imgFiles = req.getFiles("foodImage");
		ArrayList<ImageFile> files = new ArrayList<>();
		int imageIdx = 0;
		for (MultipartFile imgFile : imgFiles) {
			if(!imgFile.isEmpty() && imgFile.getOriginalFilename().length() != 0) {
				ImageFile file = new ImageFile();
				imageIdx = imageIdx + 1;
				String path = req.getServletContext().getRealPath("/resources/upload-image/food-info");
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
		food.setAttachments(files);

		foodService.writeFood(food);
		
		return "redirect:food_list.action";
	}
	
	
	@GetMapping(value = "/food_detail.action")
	public String showDetailFoodInfo(String foodNo, Model model, Food food, ImageFile imageFile) {
		
		food = foodService.findFoodInfoByFoodNo(foodNo);
		imageFile = foodService.findFoodInfoImageByFoodNo2(foodNo);
		List<ImageFile> imageFiles = foodService.findFoodInfoImageByFoodNo3(foodNo);

		HashMap<String, Object> params = new HashMap<>();
		
		params.put("foodNo", foodNo);
		params.put("from", 1);
		params.put("to", 5);
		
		List<Review> reviews = foodService.findFoodReviewsByFoodNo(params);
		
		Review average = null;
		if(reviews != null && reviews.size()!=0) {
			int e_average1 = food.getFoodRating();
			average = foodService.averageFoodReviewsByFoodNo(foodNo);
			int e_average2 = average.getAverage();
			
			if(average != null && e_average1 != e_average2) {
				int avg = average.getAverage();
				foodService.modifyAverageFoodReviewsByFoodNo(avg, foodNo);
			}
		}
		
		String inputAddress = food.getFoodAddress();
		String citName = inputAddress.substring(0, inputAddress.indexOf(" "));
		food.setCitName(citName);
		
		HashMap<String, Object> paramsList = new HashMap<>();
		
		paramsList.put("citName", citName);
		paramsList.put("from", 1);
		paramsList.put("to", 6);
		
		
		List<Tourist> touristInfos = foodService.findTouristList(paramsList);
		List<Stay> stayInfos = foodService.findStayList(citName);
		
		model.addAttribute("touristInfos",touristInfos);
		model.addAttribute("stayInfos",stayInfos);
		
		model.addAttribute("food", food);
		model.addAttribute("imageFile", imageFile);
		model.addAttribute("imageFiles", imageFiles);
		model.addAttribute("reviews", reviews);
		model.addAttribute("average", average);
	
		return "food/food_detail";
	}
	@GetMapping(value = "/food_update.action")
	public String showUpdateFormFoodInfo(String foodNo, Model model) {
		
		// 글(정보)번호 값이 없으면 목록페이지 이동시킨다.		
		if (foodNo == null) {return "redirect:food_list.action";}
		
		// DB에 저장된 정보값을 조회하여 vo에 저장한다.
		Food food = foodService.findFoodInfoByFoodNo(foodNo);
		
		// DB에서 읽어들인 정보값이 없으면 목록페이지 이동시킨다.
		if (food == null) {return "redirect:food_list.action";}
		
		// 기존에 입력한 도시 이름을 ***Address 데이터에서 추출해서 citName 변수에 저장한다.
		String inputAddress = food.getFoodAddress();
		String citName = inputAddress.substring(0, inputAddress.indexOf(" "));
		food.setCitName(citName);
		
		// 기존에 입력된 주소에서 도시이름을 제외하여 수정페이지에 표시되도록 변수값을 다시 저장한다.
		String outputAddress = inputAddress.substring(inputAddress.indexOf(" ")+1, inputAddress.length());
		food.setFoodAddress(outputAddress);
		
		// DB에서 읽어들인 기존에 입력된 데이터들을 model 객체에 담아 수정페이지로 정보를 보낸다.
		model.addAttribute("food", food);
		
		return "food/food_update";
	}
	
	@PostMapping(value = "/food_update.action")
	public String updateFoodInfo(Food food, String foodNo,
			MultipartHttpServletRequest req, Model model) {

		String num = null;
		switch (food.getCitName()) {
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
		
		food.setCitNo(num);
		// 기존 입력된 글(정보)번호와 연결된 이미지를 IMAGE 테이블에서 검색 후 모두 삭제한다. 
		foodService.modifyDeleteFoodInfoImages(food.getFoodNo());
		
		// 새로 선택한 도시이름을 새로 입력받은 주소 앞에 붙여 다시 저장한다. 
		//food.setFoodAddress(food.getCitName() + " " + food.getFoodAddress());
		
		// 기존의 글(정보)번호 중 앞 세자리 지역번호를 새로 선택한 지역번호로 변경한다. 
		//food.setFoodNo(food.getCitNo() + "-03-" + food.getFoodCheck());
		
		// 새로 선택한 이미지를 업로드한다.
		ImageFile imageFile = null;
		List<MultipartFile> imgFiles = req.getFiles("foodImage");
		ArrayList<ImageFile> files = new ArrayList<>();
		int imageIdx = 0;
		for (MultipartFile imgFile : imgFiles) {
			if(!imgFile.isEmpty() && imgFile.getOriginalFilename().length() != 0) {
				ImageFile file = new ImageFile();
				imageIdx = imageIdx + 1;
				String path = req.getServletContext().getRealPath("/resources/upload-image/food-info");
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
		food.setAttachments(files);
		
		// 새로 입력한 정보를 DB에 수정 입력한다.
		foodService.modifyFoodInfoWithImages(food);
		// 수정된 정보를 model 객체에 담아 상세페이지로 정보를 보낸다. 
		model.addAttribute("food", food);
		
		return "redirect:food_detail.action?foodNo=" + food.getFoodNo();
	}
	
	@GetMapping(value = "/food_delete.action")
	public String deleteFoodInfoWithImages(String foodNo) {
		
		foodService.deleteFoodInfoWithImagesAndReviews(foodNo);
		
		return "redirect:food_list.action";
	}
	
	@PostMapping(value = "/food_review_write.action")
	@ResponseBody
	public String writeFoodReview(Review review, String foodNo, String memId) {
				
		review.setPgNo(foodNo);
		review.setMemId(memId);
		
		foodService.writeFoodReview(review);
		
		return "success";
	}
	
	@GetMapping(value = "/find_food_review.action")
	public String findFoodReviews(String foodNo , int reviewPageNo , Model model) {
		
		HashMap<String, Object> params = new HashMap<>();
		
		params.put("foodNo", foodNo);
		params.put("from", 1);
		params.put("to", 4 * (reviewPageNo - 1) + 5);
		
		List<Review> reviews = foodService.findFoodReviewsByFoodNo(params);
		Review average = foodService.averageFoodReviewsByFoodNo(foodNo);
		
		int avg = average.getAverage();
		foodService.modifyAverageFoodReviewsByFoodNo(avg, foodNo);
		
		model.addAttribute("reviews", reviews);
		model.addAttribute("average", average);
			
		return "food/food_comments";
	}
	
	@PostMapping(value = "/modify_food_review.action")
	@ResponseBody
	public String modifyFoodReview(int reNo, int evaluation, String content, Review review) {
		
		review.setReNo(reNo);
		review.setEvaluation(evaluation);
		review.setReContent(content);
		
		foodService.modifyFoodReview(review);
		
		return "success";
	}
	
	@PostMapping(value = "/delete_food_review.action")
	@ResponseBody
	public String deleteFoodReview(int reNo) {
		
		foodService.deleteFoodReview(reNo);
		
		return "success";
	}
	
}
