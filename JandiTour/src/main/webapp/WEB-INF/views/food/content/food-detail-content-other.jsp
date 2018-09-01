<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${param.requestPage eq 'content-others-all'}">

<section class="mainContentSection singleHotel" id="mar">
			<div class="container" id="lo4">
				<div class="row">
					<div class="col-xs-12">
						<div class="rooms-types-aria">
							<hr>
							<div id="sec-tourist" class="sectionTitle2">
								<h2 id="ft_tt">주변 관광지</h2>
							</div>
							<div id="roomCategory" class="roomCategory">

								<div id="roomGellary" class="roomGellary">
									<c:choose>
										<c:when test="${ empty touristInfos or touristInfos[0].touNo eq '' }">
											<center>주변 관광지 정보가 없습니다.</center>
										</c:when>
										<c:otherwise>
											<input type="hidden" id="tourist-pageno" value="1">
											<c:forEach var="tourist" items="${ touristInfos }">
												<div class="single-item">
													<a class="fancybox-pop" rel="portfolio-1"
														href="/janditour/resources/upload-image/tourist-info/${ tourist.savedImageFileName }">
														<img
														src="/janditour/resources/upload-image/tourist-info/${ tourist.savedImageFileName }"
														alt="Double Room">
													</a> <a
														href="/janditour/tourist/tourist_detail.action?touristno=${tourist.touNo}">
														<h5 id="ft_na">${ tourist.touName }</h5>
													</a>
												</div>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<br>
							<hr>
							<div id="sec-stay" class="sectionTitle2">
								<h2 id="ft_tt">주변 숙소</h2>
							</div>
							<div id="roomCategory" class="roomCategory">

								<div class="roomGellary">
									<c:choose>
										<c:when test="${ empty stayInfos or stayInfos[0].staNo eq '' }">
											<center>주변 숙소 정보가 없습니다.</center>
										</c:when>
										<c:otherwise>
											<c:forEach var="stay" items="${ stayInfos }">
												<div class="single-item">
													<a class="fancybox-pop" rel="portfolio-1"
														href="/janditour/resources/upload-image/stay-info/${ stay.savedImageFileName }">
														<img
														src="/janditour/resources/upload-image/stay-info/${ stay.savedImageFileName }"
														alt="Double Room">
													</a> <a
														href="/janditour/stay_detail.action?staNo=${stay.staNo}">
														<h5 id="ft_na">${ stay.staName }</h5>
													</a>
												</div>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

</c:if>







<c:if test="${param.requestPage eq 'content-tourist'}">

	<c:choose>
		<c:when test="${ empty touristInfos }">
			<center>주변 관광지 정보가 없습니다.</center>
		</c:when>
		<c:otherwise>
			<section id="sec-tourist" class="mainContentSection packagesSection">
				<div class="container">
					<div class="row">
						<div class="col-xs-12">
							<div class="sectionTitle">
								<h2>
									<span class="lightBg">주변 관광지</span>
								</h2>
								<p>가까운 주변 관광지입니다!</p>
							</div>
						</div>
					</div>
					<div class="row">
						<c:forEach var="tourist" items="${ touristInfos }">
							<c:if test="${tourist.citNo eq food.citNo }">
								<div class="col-sm-4 col-xs-12">
									<div class="thumbnail deals">
										<img
											src="/janditour/resources/upload-image/tourist-info/${ tourist.savedImageFileName }"
											alt="deal-image"> <a
											href="/janditour/tourist/tourist_detail.action?touristno=${ tourist.touNo }&pageno=${ pageno }"
											class="pageLink"></a>
										<div class="discountInfo">
											<ul class="list-inline rating homePage">
												<c:forEach begin="1" end="${ tourist.touRating }">
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
												</c:forEach>
												<c:forEach begin="1" end="${ 5 - tourist.touRating }">
													<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
												</c:forEach>
											</ul>
											<ul class="list-inline duration">
												<li>${ tourist.touAddress }</li>
											</ul>
										</div>
										<div class="caption">
											<h4>
												<a
													href="/janditour/tourist/tourist_detail.action?touristno=${ tourist.touNo }&pageno=${ pageno }"
													class="captionTitle">${ tourist.touName }</a>
											</h4>
											<p>${ tourist.touListCon }</p>
											<div class="detailsInfo">
												<h5>
													<span>리뷰 평점</span><i class="fa fa-star" aria-hidden="true"></i>
													${ tourist.touRating }.0
												</h5>
												<ul class="list-inline detailsBtn">
													<li><a
														href='/janditour/tourist/tourist_detail.action?touristno=${ tourist.touNo }'
														class="btn buttonTransparent">상세보기</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<div class="btnArea">
								<a href="/janditour/tourist/tourist_list.action"
									class="btn buttonTransparent">더보기</a>
							</div>
						</div>
					</div>
				</div>
			</section>
		</c:otherwise>
	</c:choose>
</c:if>
<c:if test="${param.requestPage eq 'content-stay'}">

	<section id="sec-stay" class="mainContentSection packagesSection">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="sectionTitle">
						<h2>
							<span class="lightBg">주변 숙소 정보</span>
						</h2>
						<p>가까운 주변 숙소정보입니다!</p>
					</div>
				</div>
			</div>
			<div class="row">
				<c:forEach var="stay" items="${ stayInfos }">
					<c:if test="${stay.citNo eq food.citNo }">
						<div class="col-sm-4 col-xs-12">
							<div class="thumbnail deals">
								<img
									src="/janditour/resources/upload-image/stay-info/${ stay.savedImageFileName }"
									alt="deal-image"> <a
									href="/janditour/stay_detail.action?staNo=${ stay.staNo }&pageno=${ pageno }"
									class="pageLink"></a>
								<div class="discountInfo">
									<ul class="list-inline rating homePage">
										<c:forEach begin="1" end="${ stay.staRating }">
											<li><i class="fa fa-star" aria-hidden="true"></i></li>
										</c:forEach>
										<c:forEach begin="1" end="${ 5 - stay.staRating }">
											<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
										</c:forEach>
									</ul>
									<ul class="list-inline duration">
										<li>${ stay.staAddress }</li>
									</ul>
								</div>
								<div class="caption">
									<h4>
										<a
											href="/janditour/stay_detail.action?staNo=${ stay.staNo }&pageno=${ pageno }"
											class="captionTitle">${ stay.staName }</a>
									</h4>
									<p>${ stay.staListCon }</p>
									<div class="detailsInfo">
										<h5>
											<span>리뷰 평점</span><i class="fa fa-star" aria-hidden="true"></i>
											${ stay.staRating }.0
										</h5>
										<ul class="list-inline detailsBtn">
											<li><a
												href='/janditour/stay_detail.action?staNo=${ stay.staNo }'
												class="btn buttonTransparent">상세보기</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<div class="btnArea">
						<a href="/janditour/stay.action"
							class="btn buttonTransparent">더보기</a>
					</div>
				</div>
			</div>
		</div>
	</section>
</c:if>
