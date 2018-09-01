package com.janditour.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.janditour.dao.StayDao;
import com.janditour.vo.Food;
import com.janditour.vo.ImageFile;
import com.janditour.vo.Review;
import com.janditour.vo.Stay;

public class StayServiceImpl implements StayService {
	
	private StayDao stayDao;
	public void setStayDao(StayDao stayDao) {
		this.stayDao = stayDao;	
	}
	
	@Override
	public void writeStay(Stay stay) {
	
		stayDao.insertStay(stay);
		
		List<ImageFile> imgAttachments = stay.getAttachments();
		for(ImageFile attachment : imgAttachments) {
			attachment.setImageRef(stay.getStaNo());
			stayDao.insertStayImageFile(attachment);
		}
	}
	
	@Override
	public List<Stay> findStay(int from, int to, String area, String area2, String staName) {
		//데이터베이스에서 게시물 목록 조회 (DAO 객체에 요청)
		List<Stay> stays = stayDao.selectStay(from, to, area, area2, staName);
		
		//조회 결과 반환
		return stays;
	}

	@Override
	public Stay findStayByStayNo(String staNo) {
		Stay stay = stayDao.selectStayByStayNo(staNo);
		
		return stay;
	}
	
	@Override
	public List<ImageFile> findStayImageByStayNo(String staNo) {
		
		List<ImageFile> images = stayDao.selectStayImageByStayNo(staNo);
		
		for(ImageFile f : images) {
			System.out.println(f.getSavedImageFileName());
		}
		
		return images;
	}

	@Override
	public ImageFile findStayImgByStayNo(String staNo) {
		
		ImageFile image = stayDao.selectStayImgByStayNo(staNo);
		
		return image;
	}

	@Override
	public void deleteStay(String staNo) {
		stayDao.deleteStay(staNo);
		
	}

	@Override
	public void deleteStayImg(String staNo) {
		stayDao.deleteStayImg(staNo);
		
	}

	@Override
	public void writeStayReview(Review review) {
		
		stayDao.insertStayReview(review);
		
	}

	@Override
	public Review ReviewAverage(String staNo) {
		
		return stayDao.selectReviewAverage(staNo);
	}

	@Override
	public void updateAvg(int avg, String staNo) {
	
		stayDao.updateAvg(avg,staNo);
		
	}

	@Override
	public List<Review> findReviewsByStayNo(HashMap<String, Object> params) {
		
		return stayDao.selectReview(params);
	}

	@Override
	public void modifyStayWithImages(Stay stay) {
		
		stayDao.updateStayWithImages(stay);
		// 새로 첨부된 이미지 파일들을 변경된 글(정보)번호를 참조하여 IMAGE 테이블에 등록한다.
		List<ImageFile> imgAttachments = stay.getAttachments();
		for(ImageFile attachment : imgAttachments) {
			attachment.setImageRef(stay.getStaNo());
			stayDao.insertStayImageFile(attachment);
		}
		
	}

	@Override
	public void modifyDeleteStayImages(String staNo) {
		stayDao.deleteStayImages(staNo);
		
	}

	@Override
	public int getStayCount() {
	int count = stayDao.selectStayCount();
		
		return count;
	}

	@Override
	public List<Food> findFoodList(HashMap<String, Object> params2) {
		
		return stayDao.selectFoodList(params2);
	}

	@Override
	public List<Stay> findTouList(String citName) {
		
		return stayDao.selectTouList(citName);
	}

	@Override
	public void updateReview(Review review) {
		stayDao.updateReview(review);
		
	}

	@Override
	public void deleteReview(int reNo) {
		stayDao.deleteReview(reNo);
		
	}



	
	

	
	
}








