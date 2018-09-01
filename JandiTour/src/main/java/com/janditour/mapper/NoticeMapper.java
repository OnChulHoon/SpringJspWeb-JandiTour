package com.janditour.mapper;

import java.util.List;

import com.janditour.vo.Notice;

public interface NoticeMapper {

	void insertWriteInfo(Notice notice);

	List<Notice> selectNotice();

	void deleteNotice(int noticeNo);

}
