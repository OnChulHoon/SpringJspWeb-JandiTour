package com.janditour.mapper;

import java.util.HashMap;
import java.util.List;

import com.janditour.vo.Food;
import com.janditour.vo.ImageFile;
import com.janditour.vo.Review;
import com.janditour.vo.Stay;

public interface StayMapper {

	void insertStay(Stay stay);

	void insertStayImageFile(ImageFile attachment);

	List<Stay> selectStay(HashMap<String, Object> params);

	Stay selectStayByStayNo(String staNo);

	List<ImageFile> selectStayImageByStayNo(String staNo);

	ImageFile selectStayImgByStayNo(String staNo);

	void deleteStay(String staNo);

	void deleteStayImg(String staNo);

	void insertStayReview(Review review);

	Review selectReviewAverage(String staNo);

	void updateAvg(HashMap<String, Object> params);

	List<Review> selectReview(HashMap<String, Object> params);

	void updateStayWithImages(Stay stay);

	void deleteStayWithImages(String staNo);

	int selectStayCount();

	void deleteStayReview(String staNo);

	List<Food> selectFoodList(HashMap<String, Object> params2);

	List<Stay> selectTouList(String citName);

	void updateReview(Review review);

	void deleteReview(int reNo);

	



	
	
	
}
