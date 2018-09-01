<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>

<!-- SITE TITTLE -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>잔디 투어 - 관광지 정보</title>

<!-- PLUGINS CSS STYLE & FONT & FAVICON -->
<jsp:include page="/WEB-INF/views/include/style/public-style.jsp">
	<jsp:param name="requestPage" value="public-style" />
</jsp:include>

<link rel="stylesheet"
	href="/janditour/resources/plugins/revolution/css/settings.css">
<link rel="stylesheet"
	href="/janditour/resources/plugins/revolution/css/layers.css">
<link rel="stylesheet"
	href="/janditour/resources/plugins/revolution/css/navigation.css">




<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and rmedia queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Vj_z1VQ7HqR8A0hX5tnL&submodules=geocoder">
	
</script>

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(function() {
		$('#bookmarkbtn').on('click', function(event){
			event.preventDefault();
			var data = $('#bookmark').serialize();
			$.ajax({
				"url" :"/janditour/bookMark.action",
				"method" :"post",
				"data" :data,
				"success" :function(data, status, xhr){
					$('#myModal').modal();
					},
				"error" :function(request,status,error){
					alert("북마크 실패");
					//alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
			});
		});	
		
		$('#review')
				.on(
						'click',
						function(event) {
							event.preventDefault();
							<c:choose>
							<c:when test="${ empty loginuser }">
							//alert('로그인 한 사용자만 리뷰를 작성할 수 있습니다.');
							$("#loginCheckModal").modal('show');
							</c:when>
							<c:otherwise>
							//$('#move_to_tourist_form').submit();
							var content = $('#move_to_tourist_form textarea')
									.val();
							if (content.length == 0) {
								alert('내용을 입력하세요.');
								return;
							}

							var data = $("#move_to_tourist_form").serialize();

							$
									.ajax({
										"url" : "tourist_review.action",
										"method" : "POST",
										"data" : data,
										"success" : function(data, status, xhr) {
											alert("등록 성공");
											$("#updateReviewModal").modal(
													"hide");
											$("#move_to_tourist_form textarea")
													.val("");
											var re_pageno = $("#review-pageno");
											var touristNo = $(
													'#move_to_tourist_form input[name=touristno]')
													.val();
											$("div#reviewMedia").load(
													"findReviews.action?touristNo="
															+ touristNo
															+ "&re_pageNo="
															+ re_pageno.val());
										},
										"error" : function(xhr, status, data) {
											alert("등록 실패");
										}
									});
							</c:otherwise>
							</c:choose>
						});
		
		$("#confirm").on("click", function(event) {
			event.preventDefault();
			$("#login").modal("show");
		});

		$('div#reviewMedia').on('click', '#addbtn a', function(event) {
			moreList();
		});

		$('div#modalDiv')
				.on(
						'click',
						'#update',
						function(event) {
							var content = $('#tx_content').val();
							if (content.length == 0) {
								alert('내용을 입력하세요');
								return;
							} else {
								var yes = confirm("수정하시겠습니까?");
								if (!yes) {
									return;
								}
							}
							var num = $("#reNo").val();
							var data = $("#updateform" + num).serialize();

							$
									.ajax({
										"url" : "update_review.action",
										"method" : "POST",
										"data" : data,
										"success" : function(data, status, xhr) {
											alert("수정 완료");
											close_modal();
											$("#move_to_tourist_form textarea")
													.val("");
											var re_pageno = $("#review-pageno");
											var touristNo = $(
													'#move_to_tourist_form input[name=touristno]')
													.val();
											$("div#reviewMedia").load(
													"findReviews.action?touristNo="
															+ touristNo
															+ "&re_pageNo="
															+ re_pageno.val());
										},
										"error" : function(xhr, status, data) {
											alert("등록 실패");
										}
									});

						});

		$('div#reviewMedia')
				.on(
						'click',
						'#delete',
						function(event) {
							var yes = confirm("삭제하시겠습니까?");
							if (!yes) {
								return;
							}

							var reNo = $(this).attr('data-reviewno');

							$
									.ajax({
										"url" : "delete_review.action",
										"method" : "POST",
										"data" : "reNo=" + reNo,
										"success" : function(data, status, xhr) {
											alert("삭제 완료");
											$("#move_to_tourist_form textarea")
													.val("");
											var re_pageno = $("#review-pageno");
											var touristNo = $(
													'#move_to_tourist_form input[name=touristno]')
													.val();
											$("div#reviewMedia").load(
													"findReviews.action?touristNo="
															+ touristNo
															+ "&re_pageNo="
															+ re_pageno.val());
										},
										"error" : function(xhr, status, data) {
											alert("삭제 실패");
										}
									});
						});

		$("div#reviewMedia").on(
				'click',
				'a[id^=updateModal]',
				function(event) {
					event.preventDefault();
					open_modal($(this).attr('data-reviewno'), $(this).attr(
							'data-reviewcontent'));
				});

	});

	function moreList() {

		var re_pageno = $("#review-pageno");
		re_pageno.val(parseInt(re_pageno.val()) + 1);
		var touristNo = $("#move_to_tourist_form input[name=touristno]").val();

		$("div#reviewMedia").load(
				"findReviews.action?touristNo=" + touristNo + "&re_pageNo="
						+ re_pageno.val());
	}

	function open_modal(reviewNo, reviewContent) {
		$("#tx_content").val(reviewContent);
		$("#reNo").val(reviewNo);
		$("#updateform").attr("id", "updateform" + reviewNo);
		$('#updateReviewModal').modal('show');
	}

	function close_modal() {
		$("#updateReviewModal").modal('hide');
	}
</script>

<style type="text/css">
#img {
	width: 750px;
	height: 490px;
}

#avg {
	font-size: 30px;
	color: black;
}

#scrollbar {
	float: left;
	width: 65px;
	height: 400px;
	overflow-y: scroll;
	margin-bottom: 25px;
	overflow-y: scroll;
}

#tx_content {
	margin-left: 30px;
	margin-right: 30px;
	width: 300px;
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

.hr {
	width: 1100px;
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


		<!-- PAGE TITLE -->
		<section class="pageTitle"
			style="background-image: url(/janditour/resources/img/pages/titleimage.jpg);">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="titleTable">
							<div class="titleTableInner">
								<div class="pageTitleInfo">
									<h1>${tourist.touName}</h1>
									<p>${tourist.touListCon}</p>
									<c:if test="${not empty loginuser and loginuser.memDiv eq '1'}">
										<div align="center">
											<a id="updateBtn"
												href="/janditour/tourist/tourist_update.action?touristNo=${tourist.touNo}"
												class="btn buttonTransparent">정보 수정</a> &nbsp;&nbsp; <a
												id="deleteMod" class="btn buttonTransparent"
												data-toggle="modal" data-target="#deleteModal">삭제</a>
										</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- Delete Modal -->
		<jsp:include page="/WEB-INF/views/include/modal/dialog-modal.jsp">
			<jsp:param name="requestPage" value="delete-tourist" />
		</jsp:include>

		<jsp:include page="/WEB-INF/views/include/modal/dialog-modal.jsp">
			<jsp:param name="requestPage" value="update-review" />
		</jsp:include>
		
		<jsp:include page="/WEB-INF/views/include/modal/dialog-modal.jsp">
			<jsp:param name="requestPage" value="login-check-tourist" />
		</jsp:include>

		<!-- PAGE CONTENT -->
		<section class="mainContentSection singlePackage">
			<div class="container">
				<div class="row ">
					<div class="col-sm-8 col-xs-12">
						<div>
							<a id="catalogue1" href="tourist_list.action?pageno=${ pageno }"
								class="btn buttonTransparent">목록 보기</a> <a id="catalogue2"
								href="#lo1" class="btn buttonTransparent">위치 정보</a> <a
								id="catalogue3" href="#lo2" class="btn buttonTransparent">여행자
								리뷰</a> <a id="catalogue4" href="#lo3"
								class="btn buttonTransparent">주변 관광지</a> <a id="catalogue5"
								href="#lo4" class="btn buttonTransparent">주변 숙소</a>
							<c:choose>
								<c:when test="${empty loginuser }">
									<a id="bookmarkbtn1" href="#"
										class="btn buttonTransparent" data-toggle="modal"
										aria-haspopup="true" aria-expanded="false"
										data-target="#login">북마크</a>
								</c:when>
								<c:otherwise>
									<a id="bookmarkbtn" href="#"
										class="btn buttonTransparent">북마크</a>
								</c:otherwise>
							</c:choose>
							<jsp:include page="/WEB-INF/views/include/content/bookmark.jsp">
								<jsp:param name="requestPage" value="bookmark-public" />
							</jsp:include>
						</div>
						<br>
					</div>
					<div class="col-sm-8 col-xs-12">
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
												src="/janditour/resources/upload-image/tourist-info/${ image.savedImageFileName }">
										</div>
										<c:forEach var="images" items="${ images }">
											<div class="item ">
												<img id="img" alt="Third slide"
													src="/janditour/resources/upload-image/tourist-info/${ images.savedImageFileName }">
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
							<div class="col-xs-12" id="lo1">
								<div class="description-aria">
									<div class="sectionTitle2">
										<h2>${ tourist.touName }</h2>
										<p>${ tourist.touContent }</p>
									</div>
								</div>
								
								<br>
								<hr class="hr">
								
								<div class="location-aria">
									<div class="sectionTitle2">
										<h2>위치 정보</h2>
										<p>${ tourist.touName }의위치정보입니다&nbsp;&nbsp;:&nbsp;&nbsp;
											${ tourist.touAddress }</p>
									</div>	

									<div id="map" style="width: 100%; height: 400px;"></div>
									<script>
										var map = new naver.maps.Map('map');
										var myaddress = '${ tourist.touAddress }';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
										naver.maps.Service
												.geocode(
														{
															address : myaddress
														},
														function(status,
																response) {
															if (status !== naver.maps.Service.Status.OK) {
																return alert(myaddress
																		+ '의 검색 결과가 없거나 기타 네트워크 에러');
															}
															var result = response.result;
															// 검색 결과 갯수: result.total
															// 첫번째 결과 결과 주소: result.items[0].address
															// 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
															var myaddr = new naver.maps.Point(
																	result.items[0].point.x,
																	result.items[0].point.y);
															map
																	.setCenter(myaddr); // 검색된 좌표로 지도 이동
															// 마커 표시
															var marker = new naver.maps.Marker(
																	{
																		position : myaddr,
																		map : map
																	});
															// 마커 클릭 이벤트 처리
															naver.maps.Event
																	.addListener(
																			marker,
																			"click",
																			function(
																					e) {
																				if (infowindow
																						.getMap()) {
																					infowindow
																							.close();
																				} else {
																					infowindow
																							.open(
																									map,
																									marker);
																				}
																			});
															// 마크 클릭시 인포윈도우 오픈
															var infowindow = new naver.maps.InfoWindow(
																	{
																		content : '<h4> [네이버 개발자센터]</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
																	});
														});
									</script>
								</div>
								<hr class="hr" id="lo2">
								<br>
								<div class="review-aria">
									<div class="sectionTitle2">
										<h2>리뷰</h2>
										<p>여행자님들의 소중한 의견을 남기는 곳입니다. 다녀오신 여행지에 대한 정보나 공유할 내용이
											있으시거나, 여행지 페이지에 부족한 점이 있으시면 리뷰로 남겨주시기 바랍니다.</p>
									</div>

									<input type="hidden" id="review-pageno" value="1">

									<div id="reviewContent" class="reviewContent">
										<div id="reviewMedia" class="reviewMedia">
											<h3 class="reviewTitle">
												여행자의 리뷰&nbsp;&nbsp;&nbsp;&nbsp;
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
											<c:choose>
												<c:when test="${ empty reviews or reviews[0].reNo == 0 }">
													<center>작성된 댓글이 없습니다.</center>
												</c:when>
												<c:otherwise>
													<div id="scrollbar" style="overflow: auto; width: 1000px;">
														<ul class="media-list">

															<c:forEach var="review" items="${ reviews }">
																<li class="media">
																	<div class="media-left">
																		<a id="reviewMod" href="#"> <img
																			class="media-object"
																			src="/janditour/resources/img/blog/f_image.jpg"
																			alt="Image">
																		</a>
																	</div>

																	<div id="reviewView${ review.reNo }" class="media-body">
																		<h5 class="media-heading">${ review.memId }</h5>
																		<span> <c:forEach begin="1"
																				end="${ review.evaluation }">
																				<i class="fa fa-star" aria-hidden="true"></i>
																			</c:forEach> <c:forEach begin="1"
																				end="${ 5 - review.evaluation }">
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
																				value="${ review.reContent }"> <%-- <a id="edit" href="javascript:" class="button"
																				data-reviewno='${ review.reNo }'>수정</a> --%> <a
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
														<div id="addbtn" class="btn-wrap" align="center">
															<a href="javascript:" class="button">리뷰 더보기</a>
														</div>
													</div>
												</c:otherwise>
											</c:choose>
										</div>

										<form id="move_to_tourist_form" action="tourist_review.action"
											method="POST" role="form" class="commentsForm">
											<input type="hidden" name="touristno"
												value="${ tourist.touNo }"> <input type="hidden"
												name="memId" value="${ loginuser.memId }">
											<h3 class="reviewTitle">내 리뷰를 남겨주세요</h3>
											<p>
												<b>나의 평점 점수는?</b><br> <input type="radio"
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
											<div class="row" id="lo3">
												<div class="col-xs-12">
													<div class="form-group">
														<textarea class="form-control" rows="3"
															placeholder="Comment" name="reContent"></textarea>
													</div>
												</div>
											</div>
											<button id="review" class="btn buttonCustomPrimary">리뷰
												남기기</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-sm-4 col-xs-12">
						<aside>
							<div class="weatherInfo">
								<img src="/janditour/resources/img/cities/weather-bg.jpg"
									alt="image">
								<div class="cityWeather">
									<div class="cityTable">
										<div class="cityTableInner">
											<div class="cityWeatherInfo">
												<img src="/janditour/resources/img/icons/cloud.png">
												<h2>
													28<sup>0</sup>
												</h2>
												<p>France, Paris</p>
											</div>
										</div>
									</div>
								</div>
								<div class="dayTime">
									<span class="pull-left">April 20, 2016</span> <span
										class="pull-right">Monday</span>
								</div>
								<div class="daysWeather">
									<ul class="list-inline">
										<li>Tue <span><img
												src="/janditour/resources/img/icons/cloud-rain.png"
												alt="image"></span>18<sup>0</sup></li>
										<li>Wed <span><img
												src="/janditour/resources/img/icons/sun.png" alt="image"></span>25<sup>0</sup></li>
										<li>Thu <span><img
												src="/janditour/resources/img/icons/cloud-sm.png"
												alt="image"></span>22<sup>0</sup></li>
									</ul>
								</div>
							</div>
							<br>
						</aside>
					</div>
				</div>
			</div>
		</section>


		<!-- modal -->
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
								type="hidden" name="touristno" value="${ tourist.touNo }" /> <input
								type="hidden" name="pageno" value="${ pageno }" />

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

		<!-- modal(end) -->

		<section class="mainContentSection singleHotel" id="mar">
			<div class="container" id="lo4">
				<div class="row">
					<div class="col-xs-12">
						<div class="rooms-types-aria">
							<hr>
							<div class="sectionTitle2">
								<h2 id="ft_tt">주변 음식점</h2>
							</div>
							<div id="roomCategory" class="roomCategory">

								<div id="roomGellary" class="roomGellary">
									<c:choose>
										<c:when test="${ empty foods or foods[0].foodNo eq '' }">
											<center>등록된 음식점이 없습니다.</center>
										</c:when>
										<c:otherwise>
											<input type="hidden" id="food-pageno" value="1">
											<c:forEach var="food" items="${ foods }">
												<div class="single-item">
													<a class="fancybox-pop" rel="portfolio-1"
														href="/janditour/resources/upload-image/food-info/${ food.savedImageFileName }">
														<img
														src="/janditour/resources/upload-image/food-info/${ food.savedImageFileName }"
														alt="Double Room">
													</a> <a
														href="/janditour/food_detail.action?foodNo=${food.foodNo}">
														<h5 id="ft_na">${ food.foodName }</h5>
													</a>
												</div>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<br>
							<hr>
							<div class="sectionTitle2">
								<h2 id="ft_tt">주변 숙소</h2>
							</div>
							<div id="roomCategory" class="roomCategory">

								<div class="roomGellary">
									<c:choose>
										<c:when test="${ empty stays or stays[0].staNo eq '' }">
											<center>등록된 숙소가 없습니다.</center>
										</c:when>
										<c:otherwise>
											<c:forEach var="stay" items="${ stays }">
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

