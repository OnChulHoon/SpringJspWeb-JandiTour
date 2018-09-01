package com.janditour.service;


import java.util.List;

import com.janditour.vo.BookMark;
import com.janditour.vo.Member;

public interface BookMarkService {

	void BookMarkWrite(BookMark bookMark);

	List<BookMark> BookMarkReadFood(BookMark bookMark);

	List<BookMark> BookMarkReadTourist(BookMark bookMark);

	List<BookMark> BookMarkReadStay(BookMark bookMark);

	void BookMarkDelete(String memNo, BookMark bookMark);

	List<BookMark> BookMarkRead(BookMark bookMark);

	List<BookMark> BookMarkCheck();







}