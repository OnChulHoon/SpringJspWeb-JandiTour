package com.janditour.vo;

import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

public class Stay extends ImageFile{
	
	private String staNo;
	private String citNo;	
	private String staName;
	private String staAddress;
	private String staContent;
	private String staListCon;
	private String staLocation;
	private String citName;
	private int staCheck;
	private int staRating;
	
	
	private List<ImageFile> attachments;

	public String getStaNo() {
		return staNo;
	}

	public void setStaNo(String staNo) {
		this.staNo = staNo;
	}

	public String getCitNo() {
		return citNo;
	}

	public void setCitNo(String citNo) {
		this.citNo = citNo;
	}

	public String getStaName() {
		return staName;
	}

	public void setStaName(String staName) {
		this.staName = staName;
	}

	public String getStaAddress() {
		return staAddress;
	}

	public void setStaAddress(String staAddress) {
		this.staAddress = staAddress;
	}

	public String getStaContent() {
		return staContent;
	}

	public void setStaContent(String staContent) {
		this.staContent = staContent;
	}

	public String getStaListCon() {
		return staListCon;
	}

	public void setStaListCon(String staListCon) {
		this.staListCon = staListCon;
	}

	public String getStaLocation() {
		return staLocation;
	}

	public void setStaLocation(String staLocation) {
		this.staLocation = staLocation;
	}

	public String getCitName() {
		return citName;
	}

	public void setCitName(String citName) {
		this.citName = citName;
	}

	public List<ImageFile> getAttachments() {
		return attachments;
	}

	public void setAttachments(List<ImageFile> attachments) {
		this.attachments = attachments;
	}

	public int getStaRating() {
		return staRating;
	}

	public void setStaRating(int staRating) {
		this.staRating = staRating;
	}

	public int getStaCheck() {
		return staCheck;
	}

	public void setStaCheck(int staCheck) {
		this.staCheck = staCheck;
	}
	
	
	
	
	

	
	
}
