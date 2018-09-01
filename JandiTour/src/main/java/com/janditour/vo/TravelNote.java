package com.janditour.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;



public class TravelNote {
    
	private int trnNo; //게시물 번호
	private int memNo; //회원 번호
	
	//Date 형식 자동 형변환 지정
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date trnSt;//시작 일자
	@DateTimeFormat(pattern="yyyy-MM-dd")		
	private Date trnEnd;//종료 일자
	
	private String memId;
	private String trnContent;//후기 내용
	private String trnTitle;//후기 제목
	private String trnPic;//후기 사진
	private String trnWriter;//작성자
	private String trnArea;//여행 지역 이름
	private int readCount;
	
	//TravelNote 테이블과 TravelNoteCommnet 테이블의 1:Many 관계를 구현하는 필드
	//private List<TravelNoteComment> travelNotecomments;

	//--------------------------
	public int getTrnNo() {
		return trnNo;
	}

	public void setTrnNo(int trnNo) {
		this.trnNo = trnNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}
	
	public Date getTrnSt() {
		return trnSt;
	}

	public void setTrnSt(Date trnSt) {
		this.trnSt = trnSt;
	}

	public Date getTrnEnd() {
		return trnEnd;
	}

	public void setTrnEnd(Date trnEnd) {
		this.trnEnd = trnEnd;
	}

	public String getTrnContent() {
		return trnContent;
	}

	public void setTrnContent(String trnContent) {
		this.trnContent = trnContent;
	}

	public String getTrnTitle() {
		return trnTitle;
	}

	public void setTrnTitle(String trnTitle) {
		this.trnTitle = trnTitle;
	}

	public String getTrnPic() {
		return trnPic;
	}

	public void setTrnPic(String trnPic) {
		this.trnPic = trnPic;
	}

	public String getTrnWriter() {
		return trnWriter;
	}

	public void setTrnWriter(String trnWriter) {
		this.trnWriter = trnWriter;
	}

	public String getTrnArea() {
		return trnArea;
	}

	public void setTrnArea(String trnArea) {
		this.trnArea = trnArea;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

}
