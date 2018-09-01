<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${param.requestPage eq 'food-list-content-all'}">
	<div class="col-sm-9 col-xs-12">
		<div class="row">
			<c:forEach var="food" items="${ foodInfos }">
				<div class="col-lg-4 col-sm-6 col-xs-12">
					<div class="thumbnail deals packagesPage">
						<img 
							src="/janditour/resources/upload-image/food-info/${ food.savedImageFileName }"
							alt="deal-image" id="img" > <a
							href="/janditour/food_detail.action?foodNo=${ food.foodNo }&pageNo=${ pageNo }"
							class="pageLink"></a>
						<div class="discountInfo">
							<ul class="list-inline rating homePage">
								<c:forEach begin="1" end="${ food.foodRating }">
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
								</c:forEach>
								<c:forEach begin="1" end="${ 5 - food.foodRating }">
									<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
								</c:forEach>
							</ul>
							<ul class="list-inline duration">
								<li>${ food.foodAddress }</li>
							</ul>
						</div>
						<div class="caption">
							<h4>
								<a
									href="/janditour/food_detail.action?foodNo=${ food.foodNo }&pageNo=${ pageNo }"
									class="captionTitle">${ food.foodName }</a>
							</h4>
							<p>${ food.foodListContent }</p>
							<div class="detailsInfo">
								<h5>
									<span>리뷰 평점</span><i class="fa fa-star" aria-hidden="true"></i> ${ food.foodRating }.0
								</h5>
								<ul class="list-inline detailsBtn">
									<li><a
										href="/janditour/food_detail.action?foodNo=${ food.foodNo }&pageNo=${ pageNo }"
										class="btn buttonTransparent">상세보기</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</c:if>
