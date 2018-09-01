package com.janditour.dao;

import java.util.HashMap;
import java.util.List;

import com.janditour.mapper.RentalCarMapper;
import com.janditour.vo.RentalCar;

public class OracleRentalCarDao implements RentalCarDao {
    
	private RentalCarMapper rentalCarMapper;
	
	public void setRentalCarMapper(RentalCarMapper rentalCarMapper) {
		this.rentalCarMapper = rentalCarMapper;
	}
	
	@Override
	public void insertRentalCar(RentalCar rentalCar) {
		
		rentalCarMapper.insertRentalCar(rentalCar);
	}

	@Override
	public List<RentalCar> selectRentalCar() {
        return rentalCarMapper.selectRentalCar();
		
	}

	@Override
	public RentalCar selectRentalCarByNo(int renNo) {
		
		return rentalCarMapper.selectRentalCarByNo(renNo);
	}

	@Override
	public int selectBoardCount() {
		
		return rentalCarMapper.selectBoardCount();
	}

	@Override
	public List<RentalCar> selectBoardWithPaging(HashMap<String, Object> params) {
		
		return rentalCarMapper.selectBoardWithPaging(params);
	}
	
}
