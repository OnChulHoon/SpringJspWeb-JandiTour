package com.janditour.service;

import java.util.HashMap;
import java.util.List;

import com.janditour.vo.Food;
import com.janditour.vo.ImageFile;
import com.janditour.vo.Review;
import com.janditour.vo.Stay;

public interface StayService {

	void writeStay(Stay stay);

	List<Stay> findStay(int from, int to, String area, String area2, String staName);

	Stay findStayByStayNo(String staNo);

	ImageFile findStayImgByStayNo(String staNo);

	List<ImageFile> findStayImageByStayNo(String staNo);

	void deleteStay(String staNo);

	void deleteStayImg(String staNo);

	void writeStayReview(Review review);

	Review ReviewAverage(String staNo);

	void updateAvg(int avg, String staNo);

	List<Review> findReviewsByStayNo(HashMap<String, Object> params);

	void modifyStayWithImages(Stay stay);

	void modifyDeleteStayImages(String staNo);

	int getStayCount();

	List<Food> findFoodList(HashMap<String, Object> params2);

	List<Stay> findTouList(String citName);

	void updateReview(Review review);

	void deleteReview(int reNo);




	



}
