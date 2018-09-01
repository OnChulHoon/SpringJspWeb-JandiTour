package com.janditour.dao;



import java.util.HashMap;
import java.util.List;

import com.janditour.mapper.FoodMapper;
import com.janditour.vo.Food;
import com.janditour.vo.ImageFile;
import com.janditour.vo.Review;
import com.janditour.vo.Stay;
import com.janditour.vo.Tourist;

public class OracleFoodDao implements FoodDao {
	
	private FoodMapper foodMapper;
	
	public void setFoodMapper(FoodMapper foodMapper) {
		this.foodMapper = foodMapper;
	}
	
	@Override
	public List<Food> selectFoodInfos(){
		
		return foodMapper.selectFoodInfos();
	}
	
	@Override
	public List<Tourist> selectTouristInfo(){
		
		return foodMapper.selectTouristInfo();
	}
	
	@Override
	public List<Stay> selectStayInfo(){
		
		return foodMapper.selectStayInfo();
	}

	@Override
	public void insertFood(Food food) {
	
		foodMapper.insertFood(food);
	}

	@Override
	public void insertFoodImageFile(ImageFile attachment) {
						
		foodMapper.insertFoodImageFile(attachment);
	}
	
	@Override
	public List<Food> selectFoodInfo(int from, int to, String area, String area2, String foodName){
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("from", from);
		params.put("to", to);
		params.put("area", area);
		params.put("area2", area2);
		params.put("foodName", foodName);
		
		return foodMapper.selectFoodInfo(params);
	}
	
	@Override
	public int selectFoodInfoCount() {
		
		return foodMapper.selectFoodInfoCount();
	}
	
	@Override
	public Food selectFoodInfoByFoodNo(String foodNo){
		
		return foodMapper.selectFoodInfoByFoodNo(foodNo);
	}
	
	@Override
	public ImageFile selectFoodInfoImageByFoodNo2(String foodNo){
		
		return foodMapper.selectFoodInfoImageByFoodNo2(foodNo);
	}
	
	@Override
	public List<ImageFile> selectFoodInfoImageByFoodNo3(String foodNo){
		
		return foodMapper.selectFoodInfoImageByFoodNo3(foodNo);
	}
	
	@Override
	public void updateFoodInfoWithImages(Food food){
				
		foodMapper.updateFoodInfoWithImages(food);
	}
	
	@Override
	public void deleteFoodInfoImages(String foodNo){
				
		foodMapper.deleteFoodInfoImages(foodNo);
	}
	
	@Override
	public void deleteFoodInfoWithImagesAndReviews(String foodNo){
		
		foodMapper.deleteFoodInfoImages(foodNo);
		foodMapper.deleteFoodInfoReviews(foodNo);
		foodMapper.deleteFoodInfo(foodNo);
	}
	
	@Override
	public void insertFoodReview(Review review) {
	
		foodMapper.insertFoodReview(review);
	}
	
	@Override
	public List<Review> findFoodReviewsByFoodNo(HashMap<String, Object> params) {
	
		return foodMapper.selectFoodReviewsByFoodNo(params);
	}
	
	@Override
	public Review selectFoodReviewsAverage(String foodNo) {
		
		return foodMapper.selectFoodReviewsAverage(foodNo);
	}
	
	@Override
	public void updateAverageFoodReviewsByFoodNo(int avg, String foodNo) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("avg", avg);
		params.put("foodNo", foodNo);
		
		foodMapper.updateAverageFoodReviewsByFoodNo(params);
	}
	
	@Override
	public List<Tourist> selectTouristList(HashMap<String, Object> paramsList) {

		return foodMapper.selectTouristList(paramsList);
	}

	@Override
	public List<Stay> selectStayList(String citName) {

		return foodMapper.selectStayList(citName);
	}
	
	@Override
	public void updateFoodReview(Review review) {
		
		foodMapper.updateFoodReview(review);
	}
	
	@Override
	public void deleteFoodReview(int reNo) {
		
		foodMapper.deleteFoodReview(reNo);
	}
	

}
