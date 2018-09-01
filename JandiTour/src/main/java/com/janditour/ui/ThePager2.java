package com.janditour.ui;

public class ThePager2 {
	
	private int pageSize;//한 페이지당 데이터 개수
	private int pagerSize;//번호로 보여주는 페이지 Link 개수
	private int dataCount;//총 데이터 수
	
	private int currentPage;//현재 페이지 번호
	private int pageCount;//총 페이지 수
	
	private String linkUrl;//페이저가 포함되는 페이지의 주소
	
	private int pageFrom;
	private int pageTo;
	
	public ThePager2(int dataCount, int currentPage, 
		int pageSize, int pagerSize, String linkUrl) {
		
		this.linkUrl = linkUrl;
		
		this.dataCount = dataCount;
		this.pageSize = pageSize;
		this.pagerSize = pagerSize;
		this.currentPage = currentPage;		
		pageCount = 
			(dataCount / pageSize) + ((dataCount % pageSize) == 0 ? 0 : 1); 
		
		int pagerBlock = (currentPage - 1) / pagerSize;
		pageFrom = (pagerBlock * pagerSize) + 1;
		pageTo = pageFrom + pagerSize;
	}
	
	public String toString(){
		StringBuffer linkString = new StringBuffer();
		
		//1. 처음, 이전 항목 만들기
		if (currentPage > 1) {
			linkString.append(
				String.format("<a href='%s?pageno=1'><img style='vertical-align:middle;width:15px;height:15px' src='/spring-mvc-demoweb2/resources/image/first.png'></a>",linkUrl));
			linkString.append("&nbsp;");
			linkString.append("&nbsp;");
			linkString.append(String.format(
				"<a href='%s?pageno=%d'><img style='vertical-align:middle;width:15px;height:15px' src='/spring-mvc-demoweb2/resources/image/prev.png'></a>", linkUrl, currentPage - 1));
			linkString.append("&nbsp;");
		} else {
			linkString.append("<img style='vertical-align:middle;width:15px;height:15px' src='/spring-mvc-demoweb2/resources/image/first.png'>");
			linkString.append("&nbsp;");
			linkString.append("&nbsp;");
			linkString.append("<img style='vertical-align:middle;width:15px;height:15px' src='/spring-mvc-demoweb2/resources/image/prev.png'>");
			linkString.append("&nbsp;");
		}
		
		//2. 페이지 번호 Link 만들기
		int pagerBlock = (currentPage - 1) / pagerSize;
		int start = (pagerBlock * pagerSize) + 1;
		int end = start + pagerSize;
		for (int i = start; i < end; i++) {
			if (i > pageCount) break;
			linkString.append("&nbsp;");
			if(i == currentPage) {
				linkString.append(String.format("[%d]", i));
			} else { 
				linkString.append(String.format(
					"<a href='%s?pageno=%d'>%d</a>", linkUrl, i, i));
			}
			linkString.append("&nbsp;");
		}
		
		//3. 다음, 마지막 항목 만들기
		if (currentPage < pageCount) {
			linkString.append("&nbsp;");
			linkString.append(String.format(
				"<a href='%s?pageno=%d'><img style='vertical-align:middle;width:15px;height:15px' src='/spring-mvc-demoweb2/resources/image/next.png'></a>",linkUrl, currentPage + 1));
			linkString.append("&nbsp;");
			linkString.append("&nbsp;");
			linkString.append(String.format(
				"<a href='%s?pageno=%d'><img style='vertical-align:middle;width:15px;height:15px' src='/spring-mvc-demoweb2/resources/image/last.png'></a>", linkUrl, pageCount));
		} else {
			linkString.append("&nbsp;");
			linkString.append("<img style='vertical-align:middle;width:15px;height:15px' src='/spring-mvc-demoweb2/resources/image/next.png'>");
			linkString.append("&nbsp;");
			linkString.append("&nbsp;");
			linkString.append("<img style='vertical-align:middle;width:15px;height:15px' src='/spring-mvc-demoweb2/resources/image/last.png'>");
		}
		
		return linkString.toString();
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPagerSize() {
		return pagerSize;
	}

	public void setPagerSize(int pagerSize) {
		this.pagerSize = pagerSize;
	}

	public int getDataCount() {
		return dataCount;
	}

	public void setDataCount(int dataCount) {
		this.dataCount = dataCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public String getLinkUrl() {
		return linkUrl;
	}

	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}

	public int getPageFrom() {
		return pageFrom;
	}

	public void setPageFrom(int pageFrom) {
		this.pageFrom = pageFrom;
	}

	public int getPageTo() {
		return pageTo;
	}

	public void setPageTo(int pageTo) {
		this.pageTo = pageTo;
	}

}













