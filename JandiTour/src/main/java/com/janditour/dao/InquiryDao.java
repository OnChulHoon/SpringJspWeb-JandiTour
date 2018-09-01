package com.janditour.dao;

import java.util.List;

import com.janditour.vo.Inquiry;

public interface InquiryDao {

	void inquiryWrite(Inquiry inquiry);

	List<Inquiry> selectInquiry();

	void inquiryDelete(int inqNo);

}
