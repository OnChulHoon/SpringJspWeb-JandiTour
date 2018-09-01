package com.janditour.dao;

import java.util.HashMap;
import java.util.List;

import com.janditour.vo.RentalCar;

public interface RentalCarDao {
   
	void insertRentalCar(RentalCar rentalCar);
	List<RentalCar> selectRentalCar();
	RentalCar selectRentalCarByNo(int renNo);
	int selectBoardCount();
	List<RentalCar> selectBoardWithPaging(HashMap<String, Object> params);
}
