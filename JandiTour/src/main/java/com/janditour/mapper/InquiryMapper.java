package com.janditour.mapper;

import java.util.List;

import com.janditour.vo.Inquiry;

public interface InquiryMapper {

	void writeInquiry(Inquiry inquiry);

	List<Inquiry> inquirySelect();

	void deleteInquiry(int inqNo);

}
