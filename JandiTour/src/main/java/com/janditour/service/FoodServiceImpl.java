package com.janditour.service;

import java.util.HashMap;
import java.util.List;

import com.janditour.dao.FoodDao;
import com.janditour.vo.Food;
import com.janditour.vo.ImageFile;
import com.janditour.vo.Review;
import com.janditour.vo.Stay;
import com.janditour.vo.Tourist;

public class FoodServiceImpl implements FoodService {
	
	private FoodDao foodDao;
	
	
	public void setFoodDao(FoodDao foodDao) {
		this.foodDao = foodDao;
	}
	
	@Override
	public List<Food> findFoodInfos(){
		
		return foodDao.selectFoodInfos();
	}
	
	@Override
	public List<Tourist> findTouristInfo(){
		
		return foodDao.selectTouristInfo();
	}
	
	@Override
	public List<Stay> findStayInfo(){
		
		return foodDao.selectStayInfo();
	}

	@Override
	public void writeFood(Food food) {
		
		foodDao.insertFood(food);
		// 첨부된 이미지 파일들을 글(정보)번호를 참조하여 IMAGE 테이블에 등록한다.
		List<ImageFile> imgAttachments = food.getAttachments();
		for(ImageFile attachment : imgAttachments) {
			attachment.setImageRef(food.getFoodNo());
			foodDao.insertFoodImageFile(attachment);
		}
		
	}
	
	@Override
	public List<Food> findFoodInfo(int from, int to, String area, String area2, String foodName){
		
		return foodDao.selectFoodInfo(from, to, area, area2, foodName);
	}
	
	@Override
	public int getFoodInfoCount() {
		
		return foodDao.selectFoodInfoCount();
	}
	
	@Override
	public Food findFoodInfoByFoodNo(String foodNo) {
		
		return foodDao.selectFoodInfoByFoodNo(foodNo);
	}
	
	@Override
	public ImageFile findFoodInfoImageByFoodNo2(String foodNo) {
		
		return foodDao.selectFoodInfoImageByFoodNo2(foodNo);
	}
	
	@Override
	public List<ImageFile> findFoodInfoImageByFoodNo3(String foodNo) {
		
		return foodDao.selectFoodInfoImageByFoodNo3(foodNo);
	}
	
	@Override
	public void modifyFoodInfoWithImages(Food food){
		
		foodDao.updateFoodInfoWithImages(food);
		// 새로 첨부된 이미지 파일들을 변경된 글(정보)번호를 참조하여 IMAGE 테이블에 등록한다.
		List<ImageFile> imgAttachments = food.getAttachments();
		for(ImageFile attachment : imgAttachments) {
			attachment.setImageRef(food.getFoodNo());
			foodDao.insertFoodImageFile(attachment);
		}
		
	}
	
	@Override
	public void modifyDeleteFoodInfoImages(String foodNo){
		
		foodDao.deleteFoodInfoImages(foodNo);
	}
	
	@Override
	public void deleteFoodInfoWithImagesAndReviews(String foodNo){
		
		foodDao.deleteFoodInfoWithImagesAndReviews(foodNo);
	}
	
	@Override
	public void writeFoodReview(Review review) {
		
		foodDao.insertFoodReview(review);
				
	}
	
	@Override
	public List<Review> findFoodReviewsByFoodNo(HashMap<String, Object> params) {

		return foodDao.findFoodReviewsByFoodNo(params);
				
	}
	
	@Override
	public Review averageFoodReviewsByFoodNo(String foodNo) {
		
		Review average = foodDao.selectFoodReviewsAverage(foodNo);
		return average;
	}
	
	@Override
	public void modifyAverageFoodReviewsByFoodNo(int avg, String foodNo) {
		
		foodDao.updateAverageFoodReviewsByFoodNo(avg, foodNo);
	}
	
	@Override
	public List<Tourist> findTouristList(HashMap<String, Object> paramsList) {

		return foodDao.selectTouristList(paramsList);
				
	}
	
	@Override
	public List<Stay> findStayList(String citName) {

		return foodDao.selectStayList(citName);
	}
	
	@Override
	public void modifyFoodReview(Review review) {
		
		foodDao.updateFoodReview(review);
	}
	
	@Override
	public void deleteFoodReview(int reNo) {
		
		foodDao.deleteFoodReview(reNo);
	}
	

}
