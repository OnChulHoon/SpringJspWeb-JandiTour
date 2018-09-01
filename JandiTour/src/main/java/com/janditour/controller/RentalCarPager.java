package com.janditour.controller;

public class RentalCarPager {

	private int pageSize;// 한 페이지당 데이터 개수
	private int pagerSize;// 번호로 보여주는 페이지 Link 개수
	private int dataCount;// 총 데이터 수

	private int currentPage;// 현재 페이지 번호
	private int pageCount;// 총 페이지 수

	private String linkUrl;// 페이저가 포함되는 페이지의 주소
	
	public RentalCarPager(int dataCount, int pageNo, int pageSize, int pagerSize, String linkUrl) {
		this.linkUrl=linkUrl;
		this.dataCount=dataCount;
		this.pageSize=pageSize;
		this.pagerSize=pagerSize;
		this.currentPage=pageNo;
		pageCount=(dataCount/pageSize)+((dataCount%pageSize)==0?0:1);
	}

	public String toString() {
		StringBuffer linkString = new StringBuffer();

		// 1. 처음, 이전 항목 만들기
		if (currentPage > 1) {
			linkString.append(String.format(
					"<a href='%s?pageno=1'><img style='vertical-align:middle;width:15px;height:15px' src='/janditour/resources/img/rentalcar/first.png'></a>",
					linkUrl));
			linkString.append("&nbsp;");
			linkString.append("&nbsp;");
			linkString.append(String.format(
					"<a href='%s?pageno=%d'><img style='vertical-align:middle;width:15px;height:15px' src='/janditour/resources/img/rentalcar/prev.png'></a>",
					linkUrl, currentPage - 1));
			linkString.append("&nbsp;");
		} else {
			linkString.append(
					"<img style='vertical-align:middle;width:15px;height:15px' src='/janditour/resources/img/rentalcar/first.png'>");
			linkString.append("&nbsp;");
			linkString.append("&nbsp;");
			linkString
					.append("<img style='vertical-align:middle;width:15px;height:15px' src='/janditour/resources/img/rentalcar/prev.png'>");
			linkString.append("&nbsp;");
		}

		// 2. 페이지 번호 Link 만들기
		int pagerBlock = (currentPage - 1) / pagerSize;
		int start = (pagerBlock * pagerSize) + 1;
		int end = start + pagerSize;
		for (int i = start; i < end; i++) {
			if (i > pageCount)
				break;
			linkString.append("&nbsp;");
			if (i == currentPage) {
				linkString.append(String.format("[%d]", i));
			} else {
				linkString.append(String.format("<a href='%s?pageno=%d'>%d</a>", linkUrl, i, i));
			}
			linkString.append("&nbsp;");
		}

		// 3. 다음, 마지막 항목 만들기
		if (currentPage < pageCount) {
			linkString.append("&nbsp;");
			linkString.append(String.format(
					"<a href='%s?pageno=%d'><img style='vertical-align:middle;width:15px;height:15px' src='/janditour/resources/img/rentalcar/next.png'></a>",
					linkUrl, currentPage + 1));
			linkString.append("&nbsp;");
			linkString.append("&nbsp;");
			linkString.append(String.format(
					"<a href='%s?pageno=%d'><img style='vertical-align:middle;width:15px;height:15px' src='/janditour/resources/img/rentalcar/last.png'></a>",
					linkUrl, pageCount));
		} else {
			linkString.append("&nbsp;");
			linkString
					.append("<img style='vertical-align:middle;width:15px;height:15px' src='/janditour/resources/img/rentalcar/next.png'>");
			linkString.append("&nbsp;");
			linkString.append("&nbsp;");
			linkString
					.append("<img style='vertical-align:middle;width:15px;height:15px' src='/janditour/resources/img/rentalcar/last.png'>");
		}

		return linkString.toString();
	}
}
