package com.janditour.vo;

public class RentalCar {
    
	private int renNo;
	private int memNo;
	private String memId;
	private String renCon;
	private String renSub;
	private String renPic; //이미지 경로
	private String renCarName;
	
	public int getRenNo() {
		return renNo;
	}
	public void setRenNo(int renNo) {
		this.renNo = renNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getRenCon() {
		return renCon;
	}
	public void setRenCon(String renCon) {
		this.renCon = renCon;
	}
	public String getRenSub() {
		return renSub;
	}
	public void setRenSub(String renSub) {
		this.renSub = renSub;
	}
	public String getRenPic() {
		return renPic;
	}
	public void setRenPic(String renPic) {
		this.renPic = renPic;
	}
	public String getRenCarName() {
		return renCarName;
	}
	public void setRenCarName(String renCarName) {
		this.renCarName = renCarName;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	
	
}