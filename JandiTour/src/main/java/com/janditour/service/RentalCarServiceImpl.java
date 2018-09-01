package com.janditour.service;

import java.util.HashMap;
import java.util.List;

import com.janditour.dao.RentalCarDao;
import com.janditour.vo.RentalCar;

public class RentalCarServiceImpl implements RentalCarService{
 
	private RentalCarDao rentalCarDao;
	
	public void setRentalCarDao(RentalCarDao rentalCarDao) {
		this.rentalCarDao = rentalCarDao;
	}
	
	@Override
	public void writeRentalCar(RentalCar rentalCar) {
		
		rentalCarDao.insertRentalCar(rentalCar);
	}

	@Override
	public List<RentalCar> searchRentalCar() {
		return rentalCarDao.selectRentalCar();

		
	}

	@Override
	public RentalCar searchRentalCarByNo(int renNo) {
		
		return rentalCarDao.selectRentalCarByNo(renNo);
	}

	@Override
	public int getBoardCount() {
		
		return rentalCarDao.selectBoardCount();
	}

	@Override
	public List<RentalCar> findBoardWithPaging(int from, int to) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("from", from);
		params.put("to", to);
		return rentalCarDao.selectBoardWithPaging(params);
	}
	
}
