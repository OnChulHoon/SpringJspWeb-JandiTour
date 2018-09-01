package com.janditour.vo;

import java.util.List;

public class BookMark {
	
	private String bookDiv;
	private String bookDiv3;
	private String bookName;
	private String bookAddress;
	private String bookListCon;
	private String memNo;
	
	private List<BookMark> attachment;
	
	public String getBookDiv() {
		return bookDiv;
	}
	public void setBookDiv(String bookDiv) {
		this.bookDiv = bookDiv;
	}
	public String getBookAddress() {
		return bookAddress;
	}
	public void setBookAddress(String bookAddress) {
		this.bookAddress = bookAddress;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public List<BookMark> getAttachment() {
		return attachment;
	}
	public void setAttachment(List<BookMark> attachment) {
		this.attachment = attachment;
	}
	public String getBookListCon() {
		return bookListCon;
	}
	public void setBookListCon(String bookListCon) {
		this.bookListCon = bookListCon;
	}
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	public String getBookDiv3() {
		return bookDiv3;
	}
	public void setBookDiv3(String bookDiv3) {
		this.bookDiv3 = bookDiv3;
	}
	
	
}
