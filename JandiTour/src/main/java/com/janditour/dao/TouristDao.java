package com.janditour.dao;

import java.util.HashMap;
import java.util.List;

import com.janditour.vo.Food;
import com.janditour.vo.ImageFile;
import com.janditour.vo.Review;
import com.janditour.vo.Stay;
import com.janditour.vo.Tourist;

public interface TouristDao {

	void insertTourist(Tourist tourist);

	void insertTouristImageFile(ImageFile attachment);

	List<Tourist> selectTourist(int from, int to, String area, String area2, String touName);

	Tourist selectTouristByTouristNo(String touristNo);

	List<ImageFile> selectTouristImageByTouristNo(String touristNo);

	ImageFile selectTouristImgByTouristNo(String touristNo);

	void insertReview(Review review);

	List<Review> selectReview(HashMap<String, Object> params);

	Review selectReviewAverage(String touristNo);

	void updateAvg(int avg, String touristNo);

	int selectTouristCount();

	void updateReview(Review review);

	void deleteReview(int reNo);

	void deleteTourist(String touristNo);

	void updateTourist(Tourist tourist);

	void updateDeleteImage(String touristNo);

	List<Food> selectFoodList(HashMap<String, Object> params2);

	List<Stay> selectStayList(String citName);

	List<Tourist> selectIsland(String pos);


}