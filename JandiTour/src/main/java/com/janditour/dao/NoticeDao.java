package com.janditour.dao;

import java.util.List;

import com.janditour.vo.Notice;

public interface NoticeDao {

	void noticeWrite(Notice notice);

	List<Notice> selectNotice();

	void noticeDelete(int noticeNo);

}