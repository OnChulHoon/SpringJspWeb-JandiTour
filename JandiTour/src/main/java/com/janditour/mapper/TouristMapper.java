package com.janditour.mapper;

import java.util.HashMap;
import java.util.List;

import com.janditour.vo.Food;
import com.janditour.vo.ImageFile;
import com.janditour.vo.Review;
import com.janditour.vo.Stay;
import com.janditour.vo.Tourist;

public interface TouristMapper {

	void insertTourist(Tourist tourist);
	
	void insertTouristImageFile(ImageFile attachment);

	List<Tourist> selectTourist(HashMap<String, Object> params);

	Tourist selectTouristByTouristNo(String touristNo);

	List<ImageFile> selectTouristImageByTouristNo(String touristNo);

	ImageFile selectTouristImgByTouristNo(String touristNo);

	void insertReview(Review review);

	List<Review> selectReview(HashMap<String, Object> params);

	Review selectReviewAverage(String touristNo);

	void updateAvg(HashMap<String, Object> params);

	int selectTouristCount();

	void updateReview(Review review);

	void deleteReview(int reNo);

	void deleteTourist(String touristNo);

	void deleteTourist2(String touristNo);

	void deleteTourist3(String touristNo);

	void updateTourist(Tourist tourist);

	void updateDeleteImage(String touristNo);

	List<Food> selectFoodList(HashMap<String, Object> params2);

	List<Stay> selectStayList(String citName);

	List<Tourist> selectIsland(HashMap<String, Object> params);



}
