package com.janditour.service;


import java.util.List;

import com.janditour.dao.BookMarkDao;
import com.janditour.vo.BookMark;
import com.janditour.vo.Member;

public class BookMarkServiceImpl implements BookMarkService {

	private BookMarkDao bookMakrDao;
	public void setBookMakrDao(BookMarkDao bookMakrDao) {
		this.bookMakrDao = bookMakrDao;
	}
	
	@Override
	public void BookMarkWrite(BookMark bookMark) {
		bookMakrDao.insertBookMark(bookMark);
	}

	@Override
	public List<BookMark> BookMarkReadFood(BookMark bookMark) {
		List<BookMark> attachment1 = bookMakrDao.selectBookMarkFood(bookMark); 
		return attachment1;
	}

	@Override
	public List<BookMark> BookMarkReadTourist(BookMark bookMark) {
		List<BookMark> attachment2 = bookMakrDao.selectBookMarkTourist(bookMark); 
		return attachment2;
	}

	@Override
	public List<BookMark> BookMarkReadStay(BookMark bookMark) {
		List<BookMark> attachment3 = bookMakrDao.selectBookMarkStay(bookMark); 
		return attachment3;
	}

	@Override
	public void BookMarkDelete(String memNo, BookMark bookMark) {
		bookMakrDao.deleteBookMark(memNo, bookMark);
	}

	@Override
	public List<BookMark> BookMarkRead(BookMark bookMark) {
		List<BookMark> attachment = bookMakrDao.selectBookMark(bookMark); 
		return attachment;
	}

	@Override
	public List<BookMark> BookMarkCheck() {
		List<BookMark> div = bookMakrDao.selectNoAll();
		return div;
	}




	



	

	
	
	
	
	


	

}