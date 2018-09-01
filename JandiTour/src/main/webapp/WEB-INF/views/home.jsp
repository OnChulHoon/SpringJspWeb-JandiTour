<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

<!-- SITE TITTLE -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>잔디 투어</title>

<!-- PLUGINS CSS STYLE & FONT & FAVICON -->
<jsp:include page="/WEB-INF/views/include/style/public-style.jsp">
	<jsp:param name="requestPage" value="public-style" />
</jsp:include>


<script src="/janditour/resources/plugins/jquery/jquery-3.3.1.js"></script>

<style type="text/css">
#divimg img{
	width: 360px;
	height: 240px;
}
#rankingTopImgTourist, #rankingTopImgFood, #rankingTopImgStay{
	width: 500px;
	height: 250px;
} 
</style>

</head>


<body class="body-wrapper  changeHeader ">
	<div class="main-wrapper">

		<!-- HEADER -->
		<header>
			<jsp:include page="/WEB-INF/views/include/header.jsp">
				<jsp:param name="requestPage" value="home" />
			</jsp:include>
		</header>

		<!-- BANNER -->
		<section class="bannercontainer">

			<div id="rev_slider_wrapper1"
				class="rev_slider_wrapper fullscreen-container"
				data-alias="christmas-snow-scene" data-source="gallery"
				style="background-color: transparent; padding: 0px;"></div>
			<!-- START REVOLUTION SLIDER 5.4.1 fullscreen mode -->
			<jsp:include
				page="/WEB-INF/views/include/revolution-slider/home-bannercontainer.jsp">
				<jsp:param name="requestPage" value="home-rs" />
			</jsp:include>
			<!-- END REVOLUTION SLIDER -->
		</section>


		<!-- SEARCH TOUR -->
		<section class="darkSection">
			<jsp:include page="/WEB-INF/views/include/search/home-search.jsp">
				<jsp:param name="requestPage" value="home-search" />
			</jsp:include>
		</section>

		<!-- TOP DEALS -->
		<section class="mainContentSection packagesSection">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="sectionTitle">
							<h2>
								<span class="lightBg">Ranking Top</span>
							</h2>
							<h5>다른 사람들은 어디를 좋아할까?</h5>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4 col-xs-12">
						<br>
						<div align="center">
							<h3>관광지 TOP</h3>
						</div>
						<br>
						<div class="thumbnail deals">
							<img id="rankingTopImgTourist"
								src="/janditour/resources/upload-image/tourist-info/${ touristInfos[0].savedImageFileName }"
								alt="deal-image"> <a
								href="/janditour/tourist/tourist_detail.action?touristno=${ touristInfos[0].touNo }"
								class="pageLink"></a>
							<div class="discountInfo">
								<ul class="list-inline rating homePage">
									<c:forEach begin="1" end="${ touristInfos[0].touRating }">
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
									</c:forEach>
									<c:forEach begin="1" end="${ 5 - touristInfos[0].touRating }">
										<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
									</c:forEach>
								</ul>
								<ul class="list-inline duration">
									<li>${ touristInfos[0].touAddress }</li>
								</ul>
							</div>
							<div class="caption">
								<h4>
									<a
										href="/janditour/tourist/tourist_detail.action?touristno=${ touristInfos[0].touNo }"
										class="captionTitle">${touristInfos[0].touName}</a>
								</h4>
								<p>${ touristInfos[0].touListCon }</p>
								<div class="detailsInfo">
									<h5>
										<span>리뷰 평점</span><i class="fa fa-star" aria-hidden="true"></i>
										${ touristInfos[0].touRating }.0
									</h5>
									<ul class="list-inline detailsBtn">
										<li><a
											href="/janditour/tourist/tourist_detail.action?touristno=${ touristInfos[0].touNo }"
											class="btn buttonTransparent">상세보기</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="btnArea">
							<a href="/janditour/tourist/tourist_list.action"
								class="btn buttonTransparent">더 많은 관광지 보기</a>
						</div>
					</div>

					<div class="col-sm-4 col-xs-12">
						<br>
						<div align="center">
							<h3>맛집 TOP</h3>
						</div>
						<br>
						<div class="thumbnail deals">
							<img id="rankingTopImgFood"
								src="/janditour/resources/upload-image/food-info/${ foodInfos[0].savedImageFileName }"
								alt="deal-image"> <a
								href="/janditour/food_detail.action?foodNo=${ foodInfos[0].foodNo }"
								class="pageLink"></a>
							<div class="discountInfo">
								<ul class="list-inline rating homePage">
									<c:forEach begin="1" end="${ foodInfos[0].foodRating }">
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
									</c:forEach>
									<c:forEach begin="1" end="${ 5 - foodInfos[0].foodRating }">
										<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
									</c:forEach>
								</ul>
								<ul class="list-inline duration">
									<li>${ foodInfos[0].foodAddress }</li>
								</ul>
							</div>
							<div class="caption">
								<h4>
									<a
										href="/janditour/food_detail.action?foodNo=${ foodInfos[0].foodNo }"
										class="captionTitle">${foodInfos[0].foodName}</a>
								</h4>
								<p>${ foodInfos[0].foodListContent }</p>
								<div class="detailsInfo">
									<h5>
										<span>리뷰 평점</span><i class="fa fa-star" aria-hidden="true"></i>
										${ foodInfos[0].foodRating }.0
									</h5>
									<ul class="list-inline detailsBtn">
										<li><a
											href="/janditour/food_detail.action?foodNo=${ foodInfos[0].foodNo }"
											class="btn buttonTransparent">상세보기</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="btnArea">
							<a href="/janditour/food_list.action"
								class="btn buttonTransparent">더 많은 맛집 보기</a>
						</div>
					</div>



					<div class="col-sm-4 col-xs-12">
						<br>
						<div align="center">
							<h3>숙소 TOP</h3>
						</div>
						<br>
						<div class="thumbnail deals">
							<img id="rankingTopImgStay"
								src="/janditour/resources/upload-image/stay-info/${ stayInfos[0].savedImageFileName }"
								alt="deal-image"> <a
								href="/janditour/stay_detail.action?staNo=${ stayInfos[0].staNo }"
								class="pageLink"></a>
							<div class="discountInfo">
								<ul class="list-inline rating homePage">
									<c:forEach begin="1" end="${ stayInfos[0].staRating }">
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
									</c:forEach>
									<c:forEach begin="1" end="${ 5 - stayInfos[0].staRating }">
										<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
									</c:forEach>
								</ul>
								<ul class="list-inline duration">
									<li>${ stayInfos[0].staAddress }</li>
								</ul>
							</div>
							<div class="caption">
								<h4>
									<a
										href="/janditour/stay_detail.action?staNo=${ stayInfos[0].staNo }"
										class="captionTitle">${stayInfos[0].staName}</a>
								</h4>
								<p>${ stayInfos[0].staListCon }</p>
								<div class="detailsInfo">
									<h5>
										<span>리뷰 평점</span><i class="fa fa-star" aria-hidden="true"></i>
										${ stayInfos[0].staRating }.0
									</h5>
									<ul class="list-inline detailsBtn">
										<li><a
											href="/janditour/stay_detail.action?staNo=${ stayInfos[0].staNo }"
											class="btn buttonTransparent">상세보기</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="btnArea">
							<a href="/janditour/stay.action" class="btn buttonTransparent">더
								많은 숙소 보기</a>
						</div>
					</div>

				</div>
			</div>
		</section>

		<!-- PROMOTION PARALLAX -->
		<section class="promotionWrapper">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="promotionTable">
							<div class="promotionTableInner">
								<div class="promotionInfo">
									<span>돌아오는 여름 휴가 시즌!</span>
									<h2>섬으로 바다로 떠나자!</h2>
									<ul class="list-inline rating">
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
										<li><i class="fa fa-star" aria-hidden="true"></i></li>
									</ul>
									<!-- <p>$599 per person - 5 nights</p> -->
									<a href="/janditour/tourist/tourist_list.action"
										class="btn buttonCustomPrimary">관광지 찾아보기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- TOUR PACKAGES -->
		<section class="whiteSection">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="sectionTitle">
							<h2>
								<span>Korea Island</span>
							</h2>
							<p>대한민국의 아름다운 섬을 소개하는 페이지 입니다.</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<div class="filter-container isotopeFilters">
							<ul class="list-inline filter">
								<li class="active"><a href="#" data-filter="*">전체(ALL
										Sea Coast)</a></li>
								<li><a href="#" data-filter=".asia">동해안(East Sea)</a></li>
								<li><a href="#" data-filter=".america">서해안(West Sea)</a></li>
								<li><a href="#" data-filter=".africa">남해안(South Sea)</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div id="divimg" class="row isotopeContainer">
					<c:forEach var="eastIsland" items="${ eastIsland }">
						<div class="col-sm-4 isotopeSelector asia">
							<article class="">
								<figure>
									<img src="/janditour/resources/upload-image/tourist-info/${ eastIsland.savedImageFileName }">
									<h4>${ eastIsland.touName }</h4>
									<div class="overlay-background">
										<div class="inner"></div>
									</div>
									<div class="overlay">
										<a class="fancybox-pop" href="/janditour/tourist/tourist_detail.action?touristno=${ eastIsland.touNo }">
											<div class="overlayInfo">
												<h5>
													<i class="fa fa-star" aria-hidden="true"></i> <span>${ eastIsland.touRating }.0</span>
												</h5>
												<p>
													${ eastIsland.touAddress }
												</p>
											</div>
										</a>
									</div>
								</figure>
							</article>
						</div>
					</c:forEach>
					<c:forEach var="westIsland" items="${ westIsland }">
					<div class="col-sm-4 isotopeSelector america">
						<article class="">
							<figure>
								<img src="/janditour/resources/upload-image/tourist-info/${ westIsland.savedImageFileName }">
								<h4>${ westIsland.touName }</h4>
								<div class="overlay-background">
									<div class="inner"></div>
								</div>
								<div class="overlay">
									<a class="fancybox-pop" href="/janditour/tourist/tourist_detail.action?touristno=${ westIsland.touNo }">
										<div class="overlayInfo">
											<h5>
												<i class="fa fa-star" aria-hidden="true"></i> <span>${ westIsland.touRating }.0</span>
											</h5>
											<p>
												${ westIsland.touAddress }
											</p>
										</div>
									</a>
								</div>
							</figure>
						</article>
					</div>
					</c:forEach>
					<c:forEach var="southIsland" items="${ southIsland }">
					<div class="col-sm-4 isotopeSelector africa">
						<article class="">
							<figure>
								<img src="/janditour/resources/upload-image/tourist-info/${ southIsland.savedImageFileName }">
								<h4>${ southIsland.touName }</h4>
								<div class="overlay-background">
									<div class="inner"></div>
								</div>
								<div class="overlay">
									<a class="fancybox-pop" href="/janditour/tourist/tourist_detail.action?touristno=${ southIsland.touNo }">
										<div class="overlayInfo">
											<h5>
												<i class="fa fa-star" aria-hidden="true"></i> <span>${ southIsland.touRating }.0</span>
											</h5>
											<p>
												${ southIsland.touAddress }
											</p>
										</div>
									</a>
								</div>
							</figure>
						</article>
					</div>
					</c:forEach>
				</div>
			</div>
		</section>


		<!-- INQUIRY MODAL -->
		<jsp:include page="/WEB-INF/views/include/inquiry.jsp">
			<jsp:param name="requestPage" value="inquiry" />
		</jsp:include>
		<!-- FOOTER -->
		<footer>
			<jsp:include page="/WEB-INF/views/include/footer.jsp">
				<jsp:param name="requestPage" value="footer" />
			</jsp:include>
		</footer>
	</div>

	<!-- Signup Modal -->
	<jsp:include page="/WEB-INF/views/include/member.jsp">
		<jsp:param name="requestPage" value="signup" />
	</jsp:include>

	<!-- Login Modal -->
	<jsp:include page="/WEB-INF/views/include/member.jsp">
		<jsp:param name="requestPage" value="login" />
	</jsp:include>

	<!-- JAVASCRIPTS -->
	<jsp:include
		page="/WEB-INF/views/include/javascript/public-javascript.jsp">
		<jsp:param name="requestPage" value="public-js" />
	</jsp:include>

</body>

</html>

