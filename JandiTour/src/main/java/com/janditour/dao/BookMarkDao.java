package com.janditour.dao;


import java.util.List;

import com.janditour.vo.BookMark;
import com.janditour.vo.Member;

public interface BookMarkDao {

	void insertBookMark(BookMark bookMark);

	List<BookMark> selectBookMarkFood(BookMark bookMark);

	List<BookMark> selectBookMarkTourist(BookMark bookMark);

	List<BookMark> selectBookMarkStay(BookMark bookMark);

	void deleteBookMark(String memNo, BookMark bookMark);

	List<BookMark> selectBookMark(BookMark bookMark);

	List<BookMark> selectNoAll();

	

}