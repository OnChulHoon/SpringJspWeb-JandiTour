package com.janditour.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.janditour.mapper.TouristMapper;
import com.janditour.vo.Food;
import com.janditour.vo.ImageFile;
import com.janditour.vo.Review;
import com.janditour.vo.Stay;
import com.janditour.vo.Tourist;

public class OracleTouristDao implements TouristDao {
	
	private SqlSessionTemplate template;
	private TouristMapper touristMapper;

	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
	}

	public void setTouristMapper(TouristMapper touristMapper) {
		this.touristMapper = touristMapper;
	}
	
	@Override
	public void insertTourist(Tourist tourist) {
		touristMapper.insertTourist(tourist);
		
	}
	
	@Override
	public void insertTouristImageFile(ImageFile attachment) {
		
		touristMapper.insertTouristImageFile(attachment);
	}
	
	@Override
	public List<Tourist> selectTourist(int from, int to, String area, String area2, String touName) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("from", from);
		params.put("to", to);
		params.put("area", area);
		params.put("area2", area2);
		params.put("touName", touName);
		
		return touristMapper.selectTourist(params);
	}

	@Override
	public Tourist selectTouristByTouristNo(String touristNo) {
		
		Tourist tourist = touristMapper.selectTouristByTouristNo(touristNo);
	
		return tourist;
	}

	@Override
	public List<ImageFile> selectTouristImageByTouristNo(String touristNo) {
		
		List<ImageFile> images = touristMapper.selectTouristImageByTouristNo(touristNo);
		
		return images;
	}

	@Override
	public ImageFile selectTouristImgByTouristNo(String touristNo) {

		ImageFile image = touristMapper.selectTouristImgByTouristNo(touristNo);
		
		return image;
	}

	@Override
	public void insertReview(Review review) {
		touristMapper.insertReview(review);
		
	}

	@Override
	public List<Review> selectReview(HashMap<String, Object> params) {

		
		return touristMapper.selectReview(params);
	}

	@Override
	public Review selectReviewAverage(String touristNo) {

		Review average = touristMapper.selectReviewAverage(touristNo);
		
		return average;
	}

	@Override
	public void updateAvg(int avg, String touristNo) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("avg", avg);
		params.put("touristNo", touristNo);
		touristMapper.updateAvg(params);
		
	}

	@Override
	public int selectTouristCount() {
		int count = touristMapper.selectTouristCount();
		
		return count;
	}

	@Override
	public void updateReview(Review review) {
		
		touristMapper.updateReview(review);
		
	}

	@Override
	public void deleteReview(int reNo) {

		touristMapper.deleteReview(reNo);
		
	}

	@Override
	public void deleteTourist(String touristNo) {
		
		touristMapper.deleteTourist(touristNo);
		touristMapper.deleteTourist2(touristNo);
		touristMapper.deleteTourist3(touristNo);
		
	}

	@Override
	public void updateTourist(Tourist tourist) {
		
		touristMapper.updateTourist(tourist);
		
	}

	@Override
	public void updateDeleteImage(String touristNo) {
		
		touristMapper.updateDeleteImage(touristNo);
		
	}

	@Override
	public List<Food> selectFoodList(HashMap<String, Object> params2) {

		return touristMapper.selectFoodList(params2);
	}

	@Override
	public List<Stay> selectStayList(String citName) {

		return touristMapper.selectStayList(citName);
	}

	@Override
	public List<Tourist> selectIsland(String pos) {
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("pos", pos);
		
		return touristMapper.selectIsland(params);
	}


}
