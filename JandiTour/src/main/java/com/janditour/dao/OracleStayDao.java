package com.janditour.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.janditour.mapper.StayMapper;
import com.janditour.vo.Food;
import com.janditour.vo.ImageFile;
import com.janditour.vo.Review;
import com.janditour.vo.Stay;

public class OracleStayDao implements StayDao{
	
	private SqlSessionTemplate template;
	private StayMapper stayMapper;

//의존성 주입을 위한 도구 	
	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
	}

	public void setStayMapper(StayMapper stayMapper) {
		this.stayMapper = stayMapper;
	}

	@Override
	public void insertStay(Stay stay) {
		
		stayMapper.insertStay(stay);
		
	}
	public void insertStayImageFile(ImageFile attachment) {
		
		stayMapper.insertStayImageFile(attachment);
	}

	@Override
	public List<Stay> selectStay(int from, int to, String area, String area2, String staName) {
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("from",from);
		params.put("to",to);
		params.put("area",area);
		params.put("area2",area2);
		params.put("staName",staName);
		
		return stayMapper.selectStay(params);
	
	}

	@Override
	public Stay selectStayByStayNo(String staNo) {

		Stay stay = stayMapper.selectStayByStayNo(staNo);
		return stay;
	}
	
	@Override
	public List<ImageFile> selectStayImageByStayNo(String staNo) {
		
		List<ImageFile> images = stayMapper.selectStayImageByStayNo(staNo);
		
		return images;
	}
	
	@Override
	public ImageFile selectStayImgByStayNo(String staNo) {

		ImageFile image = stayMapper.selectStayImgByStayNo(staNo);
		
		return image;
	}

	@Override
	public void deleteStay(String staNo) {
		
		stayMapper.deleteStay(staNo);
		stayMapper.deleteStayReview(staNo);
		
	}

	@Override
	public void deleteStayImg(String staNo) {
		stayMapper.deleteStayImg(staNo);
		
	}

	@Override
	public void insertStayReview(Review review) {
		
		stayMapper.insertStayReview(review);
		
	}

	@Override
	public Review selectReviewAverage(String staNo) {
		
		Review average = stayMapper.selectReviewAverage(staNo); 
		
		return average;
	}

	@Override
	public void updateAvg(int avg, String staNo) {
		HashMap<String,Object> params = new HashMap<>();
		params.put("avg", avg);
		params.put("staNo",staNo);
		stayMapper.updateAvg(params);
		
	}

	@Override
	public List<Review> selectReview(HashMap<String, Object> params) {
		
		return stayMapper.selectReview(params);
	}

	@Override
	public void updateStayWithImages(Stay stay) {
		
		stayMapper.updateStayWithImages(stay);
		
	}

	@Override
	public void deleteStayImages(String staNo) {
		
		stayMapper.deleteStayImg(staNo);
		
	}

	@Override
	public int selectStayCount() {
		int count = stayMapper.selectStayCount();
		
		return count;
	}

	@Override
	public List<Food> selectFoodList(HashMap<String, Object> params2) {
		
		return stayMapper.selectFoodList(params2);
	}

	@Override
	public List<Stay> selectTouList(String citName) {
		return stayMapper.selectTouList(citName);
	}

	@Override
	public void updateReview(Review review) {
		stayMapper.updateReview(review);
		
	}

	@Override
	public void deleteReview(int reNo) {
		stayMapper.deleteReview(reNo);
		
	}

	
	




}






