<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<!-- --------------------------------------------Public Area Start----------------------------------------------------------------------- -->
<!-- SITE TITTLE -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>잔디 투어 - 맛집 정보</title>

<!-- PLUGINS CSS STYLE & FONT & FAVICON -->
<jsp:include page="/WEB-INF/views/include/style/public-style.jsp">
	<jsp:param name="requestPage" value="public-style" />
</jsp:include>

<script src="/janditour/resources/plugins/jquery/jquery-3.3.1.js"></script>

<!-- --------------------------------------------Public Area End------------------------------------------------------------------------- -->

<!-- --------------------------------------------Food Area Start------------------------------------------------------------------------- -->

<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Vj_z1VQ7HqR8A0hX5tnL&submodules=geocoder">
	
</script>

<!-- <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=vAGaUzy40Y5xHQn2ragH&submodules=geocoder"></script> -->

<!-- Custom JavaScript Import -->
<jsp:include page="/WEB-INF/views/food/javascript/food-jstl-js.jsp" />
<script src="/janditour/resources/js/bookmark.js"></script>

<!-- Custom CSS Import -->
<link href="/janditour/resources/css/food/food-detail.css"
	rel="stylesheet">

<style type="text/css">
#sec-mainContent {
	padding-top: 100px;
} 

#div-rightside {
	padding-top: 70px;
} 

#div-catalogue {
	padding-bottom: 10px;
}

#roomCategory img {
	width: 215px;
	height: 155px;
}

#roomCategory a {
	width: 715px;
	height: 655px;
}

#mar {
	margin-top: -100px;
}

#ft_tt {
	font-size: 20px;
}

#ft_na {
	font-size: 17px;
	color: gray;
	text-align: center;
}
</style>

</head>


<body class="body-wrapper ">
	<div class="main-wrapper">
		<!-- HEADER -->
		<header>
			<jsp:include page="/WEB-INF/views/include/header.jsp">
				<jsp:param name="requestPage" value="public" />
			</jsp:include>
		</header>

		<!-- FoodInfo Body Start -->
		<!-- PAGE TITLE -->
		<jsp:include page="/WEB-INF/views/food/pagetitle/food-pagetitle.jsp">
			<jsp:param name="requestPage" value="food-detail" />
		</jsp:include>

		<!-- Delete Modal -->
		<jsp:include page="/WEB-INF/views/food/bootstrap/dialog-modal.jsp">
			<jsp:param name="requestPage" value="delete-food" />
		</jsp:include>
		
		<!-- Login Check Modal -->
		<jsp:include page="/WEB-INF/views/food/bootstrap/dialog-modal.jsp">
			<jsp:param name="requestPage" value="login-check-food" />
		</jsp:include>
		
		<!-- Review Insert Modal -->
		<jsp:include page="/WEB-INF/views/food/bootstrap/dialog-modal.jsp">
			<jsp:param name="requestPage" value="review-insert-food" />
		</jsp:include>
		
		<!-- PAGE CONTENT -->
		<section id="sec-mainContent" class="mainContentSection singlePackage">
			<div class="container">
				<div class="row ">
					<div class="col-sm-8 col-xs-12">
						<!-- TAB Button Group -->
						<div id="div-catalogue" >
							<a id="catalogue1" href="/janditour/food_list.action" class="btn buttonTransparent">목록 보기</a>
							<a id="catalogue2" href="#div-location" class="btn buttonTransparent">위치 정보</a>
							<a id="catalogue3" href="#div-review" class="btn buttonTransparent">맛집 리뷰</a>
							<a id="catalogue4" href="#sec-tourist" class="btn buttonTransparent">주변 관광지</a>
							<a id="catalogue5" href="#sec-stay" class="btn buttonTransparent">주변 숙소</a>
							<c:choose>
								<c:when test="${empty loginuser }">
									<a id="bookmarkbtn1" href="#" class="btn buttonTransparent">북마크</a>
								</c:when>
								<c:otherwise>
									<a id="bookmarkbtn" href="#" class="btn buttonTransparent">북마크</a>
								</c:otherwise>
							</c:choose>
							<jsp:include page="/WEB-INF/views/include/content/bookmark.jsp">
								<jsp:param name="requestPage" value="bookmark-public" />
							</jsp:include>
						</div>
						<br>
						<div class="row">
							<div class="col-xs-12">
								<div id="package-carousel" class="carousel slide"
									data-ride="carousel">
									<ol class="carousel-indicators">
										<li data-target="#package-carousel" data-slide-to="0" class=""></li>
										<li data-target="#package-carousel" data-slide-to="1" class=""></li>
										<li data-target="#package-carousel" data-slide-to="2"
											class="active"></li>
									</ol>
									<div class="carousel-inner">
										<div class="item active">
											<img id="img" alt="Second slide"
												src="/janditour/resources/upload-image/food-info/${ imageFile.savedImageFileName }">
										</div>
										<c:forEach var="imageFiles" items="${ imageFiles }">
											<div class="item ">
												<img id="img" alt="Third slide"
													src="/janditour/resources/upload-image/food-info/${ imageFiles.savedImageFileName }">
											</div>
										</c:forEach>
									</div>
									<a class="left carousel-control" href="#package-carousel"
										data-slide="prev"><span
										class="glyphicon glyphicon-menu-left"></span></a> <a
										class="right carousel-control" href="#package-carousel"
										data-slide="next"><span
										class="glyphicon glyphicon-menu-right"></span></a>
								</div>
							</div>
							<div class="col-xs-12">
								<div class="description-aria">
									<div class="sectionTitle2">
										<h2>${ food.foodName }</h2>
										<p>${ food.foodContent }</p>
									</div>
								</div>
<!-- --------------------------------------------Map Area Start------------------------------------------------------------------------- -->
								<div id="div-location" class="location-aria">
									<div class="sectionTitle2">
										<h2>맛집 위치 정보</h2>
										<p>[${ food.foodName }] 여기예요~ 자세한 주소는
										&nbsp;&nbsp;:&nbsp;&nbsp; ${ food.foodAddress }</p>
									</div>
									<div id="map" style="width: 100%; height: 400px;"></div>
								</div>

<!-- --------------------------------------------Map Area End---------------------------------------------------------------------------- -->

<!-- --------------------------------------------Review Area Start----------------------------------------------------------------------- -->

								<div id="div-review" class="review-aria">
									<div class="sectionTitle2">
										<h2>여기는 어때?</h2>
										<p>맛난거 나혼자만 알기는 아쉽죠? 여기에 적어주세요~</p>
									</div>
									
									<!-- Review Rating -->
									<input type="hidden" id="review-pageno" value="1">
									<div id="reviewContent" class="reviewContent">
										<div id="reviewMedia" class="reviewMedia">
											<h3 class="reviewTitle">
												맛집 리뷰&nbsp;&nbsp;&nbsp;&nbsp;
												<c:choose>
													<c:when
														test="${ empty  average.average or average.average == 0 }">
													</c:when>
													<c:otherwise>
														<span id="avg"><b>${ average.average }.0</b></span>
													</c:otherwise>
												</c:choose>
												<span> <c:forEach begin="1"
														end="${ average.average }">
														<i class="fa fa-star" aria-hidden="true"></i>
													</c:forEach> <c:forEach begin="1" end="${ 5 - average.average }">
														<i class="fa fa-star-o" aria-hidden="true"></i>
													</c:forEach>
												</span>
											</h3>

											<!-- Review Views -->
											<c:choose>
												<c:when test="${ empty reviews or reviews[0].reNo == 0 }">
													<center>작성된 댓글이 없습니다.</center>
												</c:when>
												<c:otherwise>

													<ul class="media-list">
														<c:forEach var="review" items="${ reviews }">
															<li class="media">
																<div class="media-left">
																	<a href="#"> <img class="media-object"
																		src="/janditour/resources/img/blog/comments-03.jpg"
																		alt="Image">
																	</a>
																</div>
																<div class="media-body">
																	<h5 class="media-heading">${ review.memId }</h5>
																	<span> <c:forEach begin="1"
																			end="${ review.evaluation }">
																			<i class="fa fa-star" aria-hidden="true"></i>
																		</c:forEach> <c:forEach begin="1" end="${ 5 - review.evaluation }">
																			<i class="fa fa-star-o" aria-hidden="true"></i>
																		</c:forEach>

																	</span>
																	<div>${ review.reContent }
																			<span id="re_btn" class="btn-wrap"
																				style='display:${ loginuser.memId eq review.memId ? "block" : "none" }'>
																				<input id="modal_reNo${ review.reNo }" type="hidden"
																				value="${ review.reNo }"> <input
																				id="modal_pageno" type="hidden" value="${ pageno }">
																				<input id="modal_touristno" type="hidden"
																				value="${ tourist.touNo }"> <input
																				id="modal_content${ review.reNo }" type="hidden"
																				value="${ review.reContent }"> <a
																				id="updateModal${ review.reNo }" href="#"
																				data-reviewno='${ review.reNo }'
																				data-reviewcontent='${ review.reContent }'>수정</a> <a
																				id="delete" href="javascript:" class="button"
																				data-reviewno='${ review.reNo }'
																				data-pageno='${ pageno }'>삭제</a>
																			</span>
																		</div>
																</div>
															</li>
														</c:forEach>
													</ul>
													<div id="addbtn" class="btn-wrap">
														<a href="javascript:" class="button">더보기</a>
													</div>
												</c:otherwise>
											</c:choose>
										</div>

										<form id="food-review-form" action="food_review_write.action"
											method="POST" role="form" class="commentsForm">
											<input type="hidden" name="foodNo" value="${ food.foodNo }">
											<input type="hidden" name="memId"
												value="${ loginuser.memId }">

											<h3 class="reviewTitle">솔직한 리뷰를 남겨주세요.</h3>
											<p>
												<b>여기는 어때요?</b><br> <input type="radio"
													name="evaluation" value="5" checked="checked">&nbsp;&nbsp;&nbsp;아주좋음&nbsp;&nbsp;&nbsp;
												<span> <i class="fa fa-star" aria-hidden="true"></i>
													<i class="fa fa-star" aria-hidden="true"></i> <i
													class="fa fa-star" aria-hidden="true"></i> <i
													class="fa fa-star" aria-hidden="true"></i> <i
													class="fa fa-star" aria-hidden="true"></i>
												</span><br> <input type="radio" name="evaluation" value="4">&nbsp;&nbsp;&nbsp;좋음&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<span> <i class="fa fa-star" aria-hidden="true"></i>
													<i class="fa fa-star" aria-hidden="true"></i> <i
													class="fa fa-star" aria-hidden="true"></i> <i
													class="fa fa-star" aria-hidden="true"></i> <i
													class="fa fa-star-o" aria-hidden="true"></i>
												</span><br> <input type="radio" name="evaluation" value="3">&nbsp;&nbsp;&nbsp;보통&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<span> <i class="fa fa-star" aria-hidden="true"></i>
													<i class="fa fa-star" aria-hidden="true"></i> <i
													class="fa fa-star" aria-hidden="true"></i> <i
													class="fa fa-star-o" aria-hidden="true"></i> <i
													class="fa fa-star-o" aria-hidden="true"></i>
												</span><br> <input type="radio" name="evaluation" value="2">&nbsp;&nbsp;&nbsp;별로&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<span> <i class="fa fa-star" aria-hidden="true"></i>
													<i class="fa fa-star" aria-hidden="true"></i> <i
													class="fa fa-star-o" aria-hidden="true"></i> <i
													class="fa fa-star-o" aria-hidden="true"></i> <i
													class="fa fa-star-o" aria-hidden="true"></i>
												</span><br> <input type="radio" name="evaluation" value="1">&nbsp;&nbsp;&nbsp;최악&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<span> <i class="fa fa-star" aria-hidden="true"></i>
													<i class="fa fa-star-o" aria-hidden="true"></i> <i
													class="fa fa-star-o" aria-hidden="true"></i> <i
													class="fa fa-star-o" aria-hidden="true"></i> <i
													class="fa fa-star-o" aria-hidden="true"></i>
												</span><br>

											</p>
											<div class="row">
												<div class="col-xs-12">
													<div class="form-group">
														<textarea class="form-control" rows="3"
															placeholder="Comment" name="reContent"></textarea>
													</div>
												</div>
											</div>
											<button id="write-review" class="btn buttonCustomPrimary">리뷰
												남기기</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>

		<!-- Review Modify Modal -->
		<div class="modal fade bookingModal modalBook" id="updateReviewModal"
			tabindex="-1">
			<div class="modal-dialog" align="center">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">[ ${ loginuser.memId } 님의 Review ]</h4>
					</div>
					<div id="modal-body">
						<form id="updateform" method="get">
							<input id="reNo" type="hidden" name="reNo"> <input
								type="hidden" name="foodNo" value="${ food.foodNo }" /> <input
								type="hidden" name="pageNo" value="${ pageNo }" />

							<p>
								<b>나의 평점 점수는?</b><br> <input type="radio" name="evaluation"
									value="5" checked="checked">&nbsp;&nbsp;&nbsp;아주좋음&nbsp;&nbsp;&nbsp;
								<span> <i class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i>
								</span><br> <input type="radio" name="evaluation" value="4">&nbsp;&nbsp;&nbsp;좋음&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span> <i class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star-o" aria-hidden="true"></i>
								</span><br> <input type="radio" name="evaluation" value="3">&nbsp;&nbsp;&nbsp;보통&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span> <i class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star-o" aria-hidden="true"></i> <i
									class="fa fa-star-o" aria-hidden="true"></i>
								</span><br> <input type="radio" name="evaluation" value="2">&nbsp;&nbsp;&nbsp;별로&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span> <i class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star-o" aria-hidden="true"></i> <i
									class="fa fa-star-o" aria-hidden="true"></i> <i
									class="fa fa-star-o" aria-hidden="true"></i>
								</span><br> <input type="radio" name="evaluation" value="1">&nbsp;&nbsp;&nbsp;최악&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span> <i class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star-o" aria-hidden="true"></i> <i
									class="fa fa-star-o" aria-hidden="true"></i> <i
									class="fa fa-star-o" aria-hidden="true"></i> <i
									class="fa fa-star-o" aria-hidden="true"></i>
								</span><br>
							</p>

							<div id="input" class="form-group">
								<textarea id="tx_content" name="content" class="form-control">${ review.reContent }</textarea>
							</div>
							<div id="modalDiv">
								<a id="update" href="javascript:" class="btn buttonTransparent"
									data-reviewno='${ review.reNo }'>수정</a> <br>
							</div>
							<br>
						</form>
					</div>
				</div>
			</div>
		</div>

<!-- --------------------------------------------Review Area End---------------------------------------------------------------------------- -->

<!-- --------------------------------------------RightSide Area Start----------------------------------------------------------------------- -->
					<div id="div-rightside">
						<jsp:include
							page="/WEB-INF/views/food/content/food-detail-rightside.jsp">
							<jsp:param name="requestPage" value="food-detail-weather" />
						</jsp:include>
					</div>

				</div>
			</div>
		</section>
<!-- --------------------------------------------RightSide Area End---------------------------------------------------------------------------- -->

<!-- --------------------------------------------OtherContent Area Start----------------------------------------------------------------------- -->
		<!-- 주변 관광지 및 숙소 보여주기 -->
		<jsp:include
			page="/WEB-INF/views/food/content/food-detail-content-other.jsp">
			<jsp:param name="requestPage" value="content-others-all" />
		</jsp:include>
		
<%-- 		
		<!-- 주변 관광지 보여주기 -->
		<jsp:include
			page="/WEB-INF/views/food/content/food-detail-content-other.jsp">
			<jsp:param name="requestPage" value="content-tourist" />
		</jsp:include>

		<!-- 주변 숙소 보여주기 -->
		<jsp:include
			page="/WEB-INF/views/food/content/food-detail-content-other.jsp">
			<jsp:param name="requestPage" value="content-stay" />
		</jsp:include>
--%>
	</div>
<!-- --------------------------------------------OtherContent Area End---------------------------------------------------------------------- -->

<!-- --------------------------------------------Food Area End--------------------------------------------------------------------------- -->

<!-- --------------------------------------------Public Area Start----------------------------------------------------------------------- -->

	<!-- FOOTER -->
	<footer>
		<jsp:include page="/WEB-INF/views/include/footer.jsp">
			<jsp:param name="requestPage" value="footer" />
		</jsp:include>
	</footer>

	<!-- Inquiry Modal -->
	<jsp:include page="/WEB-INF/views/include/inquiry.jsp">
		<jsp:param name="requestPage" value="inquiry" />
	</jsp:include>

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

<!-- --------------------------------------------Public Area End------------------------------------------------------------------------- -->

</body>

</html>

