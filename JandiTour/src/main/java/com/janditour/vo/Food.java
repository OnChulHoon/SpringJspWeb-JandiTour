package com.janditour.vo;

import java.util.List;

public class Food extends ImageFile{
	
	private String foodNo;
	private String foodName;
	private String foodLocation;
	private String foodContent;
	private String foodAddress;
	private String citName;
	private String citNo;
	private String foodListContent;
	private int foodCheck;
	private int foodRating;
	
	public String getFoodListContent() {
		return foodListContent;
	}
	public void setFoodListContent(String foodListContent) {
		this.foodListContent = foodListContent;
	}
	public String getFoodAddress() {
		return foodAddress;
	}
	public void setFoodAddress(String foodAddress) {
		this.foodAddress = foodAddress;
	}
	public String getCitName() {
		return citName;
	}
	public void setCitName(String citName) {
		this.citName = citName;
	}
	public String getCitNo() {
		return citNo;
	}
	public void setCitNo(String citNo) {
		this.citNo = citNo;
	}

	// Food 테이블과 Image 테이블의 관계를 1:Many의 관계를 만들기 위한 필드
	private List<ImageFile> attachments;
	
	public List<ImageFile> getAttachments() {
		return attachments;
	}
	public void setAttachments(List<ImageFile> attachments) {
		this.attachments = attachments;
	}
	public String getFoodNo() {
		return foodNo;
	}
	public void setFoodNo(String foodNo) {
		this.foodNo = foodNo;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public String getFoodLocation() {
		return foodLocation;
	}
	public void setFoodLocation(String foodLocation) {
		this.foodLocation = foodLocation;
	}
	public String getFoodContent() {
		return foodContent;
	}
	public void setFoodContent(String foodContent) {
		this.foodContent = foodContent;
	}
	public int getFoodCheck() {
		return foodCheck;
	}
	public void setFoodCheck(int foodCheck) {
		this.foodCheck = foodCheck;
	}
	public int getFoodRating() {
		return foodRating;
	}
	public void setFoodRating(int foodRating) {
		this.foodRating = foodRating;
	}
	
	
}
