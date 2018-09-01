package com.janditour.mapper;

import java.util.HashMap;
import java.util.List;

import com.janditour.vo.Food;
import com.janditour.vo.ImageFile;
import com.janditour.vo.Review;
import com.janditour.vo.Stay;
import com.janditour.vo.Tourist;

public interface FoodMapper {
	
	void insertFood(Food food);
	
	void insertFoodImageFile(ImageFile attachment);
	
	List<Food> selectFoodInfo(HashMap<String, Object> params);
	
	Food selectFoodInfoByFoodNo(String foodNo);
	
	ImageFile selectFoodInfoImageByFoodNo2(String foodNo);
	
	List<ImageFile> selectFoodInfoImageByFoodNo3(String foodNo);
	
	void updateFoodInfoWithImages(Food food);
	
	void deleteFoodInfoImages(String foodNo);
	
	void deleteFoodInfoReviews(String foodNo);
	
	void deleteFoodInfo(String foodNo);
	
	void insertFoodReview(Review review);
	
	List<Review> selectFoodReviewsByFoodNo(HashMap<String, Object> params);
	
	List<Review> selectFoodReviewsByFoodNo(String foodNo);
	
	Review selectFoodReviewsAverage(String foodNo);
	
	void updateAverageFoodReviewsByFoodNo(HashMap<String, Object> params);
	
	int selectFoodInfoCount();
	
	List<Tourist> selectTouristInfo();
	
	List<Stay> selectStayInfo();
	
	List<Food> selectFoodInfos();
	
	List<Tourist> selectTouristList(HashMap<String, Object> paramsList);
	
	List<Stay> selectStayList(String citName);
	
	void updateFoodReview(Review review);

	void deleteFoodReview(int reNo);
	
}
