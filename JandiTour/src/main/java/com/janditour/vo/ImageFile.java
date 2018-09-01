package com.janditour.vo;

public class ImageFile {

	private int imageNo;
	private String imageRef;
	private String savedImageFileName;
	private int imageIdx;
	
	public int getImageIdx() {
		return imageIdx;
	}
	public void setImageIdx(int imageIdx) {
		this.imageIdx = imageIdx;
	}
	public int getImageNo() {
		return imageNo;
	}
	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}
	public String getImageRef() {
		return imageRef;
	}
	public void setImageRef(String imageRef) {
		this.imageRef = imageRef;
	}
	public String getSavedImageFileName() {
		return savedImageFileName;
	}
	public void setSavedImageFileName(String savedImageFileName) {
		this.savedImageFileName = savedImageFileName;
	}
	
}
