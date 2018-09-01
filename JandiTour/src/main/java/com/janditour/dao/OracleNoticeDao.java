package com.janditour.dao;

import java.util.List;

import com.janditour.mapper.NoticeMapper;
import com.janditour.vo.Notice;

public class OracleNoticeDao implements NoticeDao {
	
	private NoticeMapper noticeMapper;

	public void setNoticeMapper(NoticeMapper noticeMapper) {
		this.noticeMapper = noticeMapper;
	}

	@Override
	public void noticeWrite(Notice notice) {
		noticeMapper.insertWriteInfo(notice);
		
	}

	@Override
	public List<Notice> selectNotice() {
		List<Notice> notice = noticeMapper.selectNotice();
		return notice;
	}

	@Override
	public void noticeDelete(int noticeNo) {
		noticeMapper.deleteNotice(noticeNo);
	}

}
