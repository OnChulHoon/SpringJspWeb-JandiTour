package com.janditour.service;

import java.util.List;

import com.janditour.vo.RentalCar;

public interface RentalCarService {
    
	void writeRentalCar(RentalCar rentalCar);
	List<RentalCar> searchRentalCar();
	RentalCar searchRentalCarByNo(int renNo);
	int getBoardCount();
	List<RentalCar> findBoardWithPaging(int from, int to);
	
}
