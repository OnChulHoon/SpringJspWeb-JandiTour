package com.janditour.service;

import java.util.List;

import com.janditour.vo.Notice;

public interface NoticeService {

	void writeNotice(Notice notice);

	List<Notice> findNotice();

	void deleteNotice(int noticeNo);

}
