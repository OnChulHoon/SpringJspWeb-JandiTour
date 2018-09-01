package com.janditour.dao;


import java.util.HashMap;
import java.util.List;

import com.janditour.vo.Food;
import com.janditour.vo.ImageFile;
import com.janditour.vo.Review;
import com.janditour.vo.Stay;

public interface StayDao {

	void insertStay(Stay stay);

	void insertStayImageFile(ImageFile attachment);

	List<Stay> selectStay(int from, int to, String area, String area2, String staName);

	Stay selectStayByStayNo(String staNo);

	List<ImageFile> selectStayImageByStayNo(String staNo);

	ImageFile selectStayImgByStayNo(String staNo);

	void deleteStay(String staNo);

	void deleteStayImg(String staNo);

	void insertStayReview(Review review);

	Review selectReviewAverage(String staNo);

	void updateAvg(int avg, String staNo);

	List<Review> selectReview(HashMap<String, Object> params);

	void updateStayWithImages(Stay stay);

	void deleteStayImages(String staNo);

	int selectStayCount();

	List<Food> selectFoodList(HashMap<String, Object> params2);

	List<Stay> selectTouList(String citName);

	void updateReview(Review review);

	void deleteReview(int reNo);







	

	

}