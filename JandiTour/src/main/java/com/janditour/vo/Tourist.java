package com.janditour.vo;

import java.util.List;

public class Tourist extends ImageFile{
	
	private String touNo;
	private String citNo;
	private String touName;
	private String touAddress;
	private String touContent;
	private String touListCon;
	private String touLocation;
	private String citName;
	private int touRating;
	private int touCheck;
	

	//Tourist 테이블과 Image 테이블 사이의 1:Many 관계를 구현한 필드
	private List<ImageFile> attachments;
	
	public String getTouNo() {
		return touNo;
	}

	public void setTouNo(String touNo) {
		this.touNo = touNo;
	}

	public String getTouName() {
		return touName;
	}

	public void setTouName(String touName) {
		this.touName = touName;
	}
	
	public String getTouAddress() {
		return touAddress;
	}

	public void setTouAddress(String touAddress) {
		this.touAddress = touAddress;
	}

	public String getCitName() {
		return citName;
	}

	public void setCitName(String citName) {
		this.citName = citName;
	}

	public String getTouLocation() {
		return touLocation;
	}

	public void setTouLocation(String touLocation) {
		this.touLocation = touLocation;
	}

	public String getTouContent() {
		return touContent;
	}

	public void setTouContent(String touContent) {
		this.touContent = touContent;
	}

	public List<ImageFile> getAttachments() {
		return attachments;
	}

	public void setAttachments(List<ImageFile> attachments) {
		this.attachments = attachments;
	}

	public String getCitNo() {
		return citNo;
	}

	public void setCitNo(String citNo) {
		this.citNo = citNo;
	}

	public String getTouListCon() {
		return touListCon;
	}

	public void setTouListCon(String touListCon) {
		this.touListCon = touListCon;
	}

	public int getTouRating() {
		return touRating;
	}

	public void setTouRating(int touRating) {
		this.touRating = touRating;
	}

	public int getTouCheck() {
		return touCheck;
	}

	public void setTouCheck(int touCheck) {
		this.touCheck = touCheck;
	}
	
	
}
