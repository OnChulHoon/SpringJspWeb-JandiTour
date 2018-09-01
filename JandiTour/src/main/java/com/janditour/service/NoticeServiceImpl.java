package com.janditour.service;

import java.util.List;

import com.janditour.dao.NoticeDao;
import com.janditour.vo.Notice;

public class NoticeServiceImpl implements NoticeService{
	
	private NoticeDao noticeDao;
	
	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}

	@Override
	public void writeNotice(Notice notice) {
		noticeDao.noticeWrite(notice);
	}

	@Override
	public List<Notice> findNotice() {
		List<Notice> notice = noticeDao.selectNotice();
		return notice;
	}

	@Override
	public void deleteNotice(int noticeNo) {
		noticeDao.noticeDelete(noticeNo);
	}
	

}
