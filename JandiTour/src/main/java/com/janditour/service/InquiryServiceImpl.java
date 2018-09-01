package com.janditour.service;

import java.util.List;

import com.janditour.dao.InquiryDao;
import com.janditour.vo.Inquiry;

public class InquiryServiceImpl implements InquiryService{
	
	private InquiryDao inquiryDao;

	public void setInquiryDao(InquiryDao inquiryDao) {
		this.inquiryDao = inquiryDao;
	}

	@Override
	public void writeInquiry(Inquiry inquiry) {
		inquiryDao.inquiryWrite(inquiry);
	}

	@Override
	public List<Inquiry> findInquiry() {
		List<Inquiry> inquiry = inquiryDao.selectInquiry();
		return inquiry;
	}

	@Override
	public void deleteInquiry(int inqNo) {
		inquiryDao.inquiryDelete(inqNo);
	}


}
