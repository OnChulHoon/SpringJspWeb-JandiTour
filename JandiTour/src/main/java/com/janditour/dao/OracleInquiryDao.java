package com.janditour.dao;

import java.util.List;

import com.janditour.mapper.InquiryMapper;
import com.janditour.vo.Inquiry;

public class OracleInquiryDao implements InquiryDao {
	
	private InquiryMapper inquiryMapper;

	public void setInquiryMapper(InquiryMapper inquiryMapper) {
		this.inquiryMapper = inquiryMapper;
	}

	@Override
	public void inquiryWrite(Inquiry inquiry) {
		inquiryMapper.writeInquiry(inquiry);
	}

	@Override
	public List<Inquiry> selectInquiry() {
		List<Inquiry> inquiry = inquiryMapper.inquirySelect();
		return inquiry;
	}

	@Override
	public void inquiryDelete(int inqNo) {
		inquiryMapper.deleteInquiry(inqNo);
	}

}
