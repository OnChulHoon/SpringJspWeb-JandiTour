package com.janditour.service;

import java.util.HashMap;
import java.util.List;

import com.janditour.vo.Food;
import com.janditour.vo.ImageFile;
import com.janditour.vo.Review;
import com.janditour.vo.Stay;
import com.janditour.vo.Tourist;

public interface FoodService {

	void writeFood(Food food);

	Food findFoodInfoByFoodNo(String foodNo);

	ImageFile findFoodInfoImageByFoodNo2(String foodNo);

	List<ImageFile> findFoodInfoImageByFoodNo3(String foodNo);

	void modifyFoodInfoWithImages(Food food);
	
	void modifyDeleteFoodInfoImages(String foodNo);

	void deleteFoodInfoWithImagesAndReviews(String foodNo);

	void writeFoodReview(Review review);

	List<Review> findFoodReviewsByFoodNo(HashMap<String, Object> params);

	Review averageFoodReviewsByFoodNo(String foodNo);

	void modifyAverageFoodReviewsByFoodNo(int avg, String foodNo);

	List<Food> findFoodInfo(int from, int to, String area, String area2, String foodName);

	int getFoodInfoCount();

	List<Tourist> findTouristInfo();

	List<Stay> findStayInfo();

	List<Food> findFoodInfos();

	List<Tourist> findTouristList(HashMap<String, Object> paramsList);

	List<Stay> findStayList(String citName);

	void modifyFoodReview(Review review);

	void deleteFoodReview(int reNo);

}