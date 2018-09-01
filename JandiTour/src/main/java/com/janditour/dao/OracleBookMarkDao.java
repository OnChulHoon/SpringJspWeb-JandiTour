package com.janditour.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.janditour.mapper.BookMarkMapper;
import com.janditour.vo.BookMark;

public class OracleBookMarkDao implements BookMarkDao {
	
	private SqlSessionTemplate template;
	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
	}
	
	private BookMarkMapper bookMarkMapper;
	public void setBookMarkMapper(BookMarkMapper bookMarkMapper) {
		this.bookMarkMapper = bookMarkMapper;
	}
	
	
	
	@Override
	public void insertBookMark(BookMark bookMark) {
		
//		String newBookNo = bookMark.getBookDiv();
//		String newMemNo = bookMark.getMemNo();
//		
//		bookMarkMapper.selectBook
//		if(newBookNo.equals(bookMark.getBookDiv()) && newMemNo.equals(bookMark.getMemNo())) {
//			
//		}else {
//			
			bookMarkMapper.insertBookMark(bookMark);
//		}
	}

	@Override
	public List<BookMark> selectBookMarkFood(BookMark bookMark) {
		
		List<BookMark> attachment1 = bookMarkMapper.selectBookMarkFood(bookMark);
		return attachment1;
	}


	@Override
	public List<BookMark> selectBookMarkTourist(BookMark bookMark) {
		
		List<BookMark> attachment2 = bookMarkMapper.selectBookMarkTourist(bookMark);
		return attachment2;
	}


	@Override
	public List<BookMark> selectBookMarkStay(BookMark bookMark) {
		
		List<BookMark> attachment3 = bookMarkMapper.selectBookMarkStay(bookMark);
		return attachment3;
	}


	@Override
	public void deleteBookMark(String memNo, BookMark bookMark) {
		bookMark.setMemNo(memNo);
		bookMarkMapper.deleteBookMark(bookMark);
	}



	@Override
	public List<BookMark> selectBookMark(BookMark bookMark) {
		List<BookMark> attachment = bookMarkMapper.selectBookMark(bookMark);
		return attachment;
	}



	@Override
	public List<BookMark> selectNoAll() {
		List<BookMark> div = bookMarkMapper.selectNoAll();
		return div;
	}



	
	
	
}