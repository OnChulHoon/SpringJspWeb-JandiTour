package com.janditour.dao;

import java.util.HashMap;
import java.util.List;

import com.janditour.vo.Food;
import com.janditour.vo.ImageFile;
import com.janditour.vo.Review;
import com.janditour.vo.Stay;
import com.janditour.vo.Tourist;

public interface FoodDao {

	void insertFood(Food food);

	void insertFoodImageFile(ImageFile attachment);

	Food selectFoodInfoByFoodNo(String foodNo);

	ImageFile selectFoodInfoImageByFoodNo2(String foodNo);

	List<ImageFile> selectFoodInfoImageByFoodNo3(String foodNo);

	void updateFoodInfoWithImages(Food food);

	void deleteFoodInfoImages(String foodNo);
	
	void deleteFoodInfoWithImagesAndReviews(String foodNo);
	
	void insertFoodReview(Review review);

	List<Review> findFoodReviewsByFoodNo(HashMap<String, Object> params);

	Review selectFoodReviewsAverage(String foodNo);

	void updateAverageFoodReviewsByFoodNo(int avg, String foodNo);

	List<Food> selectFoodInfo(int from, int to, String area, String area2, String foodName);

	int selectFoodInfoCount();

	List<Tourist> selectTouristInfo();

	List<Stay> selectStayInfo();

	List<Food> selectFoodInfos();

	List<Tourist> selectTouristList(HashMap<String, Object> paramsList);

	List<Stay> selectStayList(String citName);

	void updateFoodReview(Review review);

	void deleteFoodReview(int reNo);

}