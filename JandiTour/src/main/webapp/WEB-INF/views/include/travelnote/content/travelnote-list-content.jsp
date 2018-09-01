<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${param.requestPage eq 'food-list-content-all'}">

<c:forEach var="food" items="${foodInfos}">
			<div class="col-sm-6 col-lg-4 col-xs-12">
				<div class="thumbnail deals">
					<img id="list-img" src="/janditour/resources/upload-image/food-info/${food.savedImageFileName}" alt="deal-image">
					<a href="/janditour/food_detail.action?foodno=${food.foodNo}" class="pageLink"></a>
					<div class="discountInfo discountCol-3">
						<div class="discountOffer">
							<h4>
								50% <span>OFF</span>
							</h4>
						</div>
						<ul class="list-inline rating homePage">
							<li><i class="fa fa-star" aria-hidden="true"></i></li>
							<li><i class="fa fa-star" aria-hidden="true"></i></li>
							<li><i class="fa fa-star" aria-hidden="true"></i></li>
							<li><i class="fa fa-star" aria-hidden="true"></i></li>
							<li><i class="fa fa-star" aria-hidden="true"></i></li>
						</ul>
						<ul class="list-inline duration">
							<li>7 days</li>
							<li>15 hrs</li>
							<li>15 min</li>
						</ul>
					</div>
					<div class="caption">
						<h4>
							<a href="/janditour/travelnote_detail.action?foodno=${travelNote.trnNo}" class="captionTitle">${travelNote.foodName}</a>
						</h4>
						<p>${travelnote.travelnoteListContent}</p>
						<div class="detailsInfo">
							<h5>
								<span>Start From</span> $299
							</h5>
							<ul class="list-inline detailsBtn">
								<li><a href="/janditour/food_detail.action?foodno=${travelNote.trnNo}"
									class="btn buttonTransparent">Details</a></li>
								<li><a href='booking-1.jsp' class="btn buttonTransparent">Book
										now</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
</c:forEach> 
 
 </c:if>
