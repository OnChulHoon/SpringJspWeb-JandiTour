package com.janditour.service;

import java.util.HashMap;
import java.util.List;

import com.janditour.vo.Food;
import com.janditour.vo.ImageFile;
import com.janditour.vo.Review;
import com.janditour.vo.Stay;
import com.janditour.vo.Tourist;

public interface TouristService {

	void writeTourist(Tourist tourist);

	List<Tourist> findTourist(int from, int to, String area, String area2, String touName);

	Tourist findTouristByTouristNo(String touristNo);

	List<ImageFile> findTouristImageByTouristNo(String touristNo);

	ImageFile findTouristImgByTouristNo(String touristNo);

	void writeReview(Review review);

	List<Review> findReview(HashMap<String, Object> params);

	Review ReviewAverage(String touristNo);

	void updateAvg(int avg, String touristNo);

	int getTouristCount();

	void updateReview(Review review);

	void deleteReview(int reNo);

	void touristDelete(String touristNo);

	void updateTourist(Tourist tourist);

	void updateDeleteImage(String touristNo);

	List<Food> findFoodList(HashMap<String, Object> params2);

	List<Stay> findStayList(String citName);

	List<Tourist> findIsland(String pos);


}