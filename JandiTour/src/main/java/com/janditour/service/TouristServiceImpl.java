package com.janditour.service;

import java.util.HashMap;
import java.util.List;

import com.janditour.dao.TouristDao;
import com.janditour.vo.Food;
import com.janditour.vo.ImageFile;
import com.janditour.vo.Review;
import com.janditour.vo.Stay;
import com.janditour.vo.Tourist;

public class TouristServiceImpl implements TouristService {

	private TouristDao touristDao;

	public void setTouristDao(TouristDao touristDao) {
		this.touristDao = touristDao;
	}

	@Override
	public void writeTourist(Tourist tourist) {

		touristDao.insertTourist(tourist);

		List<ImageFile> imgAttachments = tourist.getAttachments();
		for (ImageFile attachment : imgAttachments) {
			attachment.setImageRef(tourist.getTouNo());
			touristDao.insertTouristImageFile(attachment);
		}
	}

	@Override
	public List<Tourist> findTourist(int from, int to, String area, String area2, String touName) {

		List<Tourist> tourists = touristDao.selectTourist(from, to, area, area2, touName);

		return tourists;
	}

	@Override
	public Tourist findTouristByTouristNo(String touristNo) {

		Tourist tourist = touristDao.selectTouristByTouristNo(touristNo);
		// List<ImageFile> images = touristDao.selectTouristImageByTouristNo(touristNo);
		// tourist.setAttachments(images);

		return tourist;
	}

	@Override
	public List<ImageFile> findTouristImageByTouristNo(String touristNo) {

		List<ImageFile> images = touristDao.selectTouristImageByTouristNo(touristNo);

		return images;
	}

	@Override
	public ImageFile findTouristImgByTouristNo(String touristNo) {

		ImageFile image = touristDao.selectTouristImgByTouristNo(touristNo);

		return image;
	}

	@Override
	public void writeReview(Review review) {

		touristDao.insertReview(review);

	}

	@Override
	public List<Review> findReview(HashMap<String, Object> params) {

		return touristDao.selectReview(params);
	}

	@Override
	public Review ReviewAverage(String touristNo) {

		return touristDao.selectReviewAverage(touristNo);
	}

	@Override
	public void updateAvg(int avg, String touristNo) {

		touristDao.updateAvg(avg, touristNo);

	}

	@Override
	public int getTouristCount() {
		int count = touristDao.selectTouristCount();

		return count;
	}

	@Override
	public void updateReview(Review review) {

		touristDao.updateReview(review);

	}

	@Override
	public void deleteReview(int reNo) {

		touristDao.deleteReview(reNo);

	}

	@Override
	public void touristDelete(String touristNo) {

		touristDao.deleteTourist(touristNo);

	}

	@Override
	public void updateTourist(Tourist tourist) {

		touristDao.updateTourist(tourist);

		List<ImageFile> imgAttachments = tourist.getAttachments();
		for (ImageFile attachment : imgAttachments) {
			attachment.setImageRef(tourist.getTouNo());
			touristDao.insertTouristImageFile(attachment);
		}

	}

	@Override
	public void updateDeleteImage(String touristNo) {
		touristDao.updateDeleteImage(touristNo);
		
	}

	@Override
	public List<Food> findFoodList(HashMap<String, Object> params2) {
		
		return touristDao.selectFoodList(params2);
	}

	@Override
	public List<Stay> findStayList(String citName) {

		return touristDao.selectStayList(citName);
	}

	@Override
	public List<Tourist> findIsland(String pos) {

		return touristDao.selectIsland(pos);
	}

}
