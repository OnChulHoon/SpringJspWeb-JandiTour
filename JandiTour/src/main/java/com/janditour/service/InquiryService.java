package com.janditour.service;

import java.util.List;

import com.janditour.vo.Inquiry;

public interface InquiryService {

	void writeInquiry(Inquiry inquiry);

	List<Inquiry> findInquiry();

	void deleteInquiry(int inqNo);



}
