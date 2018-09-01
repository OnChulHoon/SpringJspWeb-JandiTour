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
	<jsp:param name="requestPage" value="public-style"/>
</jsp:include>

<script src="/janditour/resources/plugins/jquery/jquery-3.3.1.js"></script>

<!-- --------------------------------------------Public Area End------------------------------------------------------------------------- -->

<!-- --------------------------------------------Food Area Start------------------------------------------------------------------------- -->

<!-- Custom JavaScript Import -->
<jsp:include page="/WEB-INF/views/food/javascript/food-jstl-js.jsp"/>

<!-- Custom CSS Import -->
<link href="/janditour/resources/css/food/food-write&update.css" rel="stylesheet">

<style type="text/css">
#write-action {
	margin-right: 20px;
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
		<jsp:include page="/WEB-INF/views/food/pagetitle/food-pagetitle.jsp">
			<jsp:param name="requestPage" value="food-write"/>
		</jsp:include>

		<!-- WHITE SECTION-->
		<section class="mainContentSection">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-md-5 col-lg-4 col-xs-12">

						<div class="contactInfo">
							<h2>맛집 등록</h2>
							<p>지역 맛집을 등록합니다. 빈칸에 정보를 입력해주세요.</p>
							<div class="media">
								<a class="media-left" href="#"> <i class="fa fa-map-marker"
									aria-hidden="true"></i>
								</a>
								<div class="media-body">
									<h4 class="media-heading">address</h4>
									<p>
										16/14 Babor Road, Mohammad pur <br>Dhaka,
										Bangladeshincididunt
									</p>
								</div>
							</div>
							<div class="media">
								<a class="media-left" href="#"> <i class="fa fa-phone"
									aria-hidden="true"></i>
								</a>
								<div class="media-body">
									<h4 class="media-heading">Phone number</h4>
									<p>
										+55 654 545 122 <br>+55 654 545 123
									</p>
								</div>
							</div>
							<div class="media">
								<a class="media-left" href="#"> <i class="fa fa-envelope"
									aria-hidden="true"></i>
								</a>
								<div class="media-body">
									<h4 class="media-heading">email us</h4>
									<p>
										<a href="mailTo:info@example.com">info @example.com</a> <br>
										<a href="mailTo:info@startravelbangladesh.com">info@startravelbangladesh.com</a>
									</p>
								</div>
							</div>
						</div>

					</div>
					<div class="col-sm-6 col-md-7 col-xs-12 col-lg-8">
						<div class="contactForm">
							<form action="/janditour/food_write.action" method="post" role="form"
								class="form" enctype="multipart/form-data">
								<div class="">
				              	  <select class="select" name="citName">
				              	  	<option value="서울특별시">서울특별시</option>
				              	  	<option value="부산광역시">부산광역시</option>
				              	  	<option value="대전광역시">대전광역시</option>
				              	  	<option value="대구광역시">대구광역시</option>
				              	  	<option value="울산광역시">울산광역시</option>
				              	  	<option value="광주광역시">광주광역시</option>
				              	  	<option value="인천광역시">인천광역시</option>
				              	  	<option value="경기도">경기도</option>
				              	  	<option value="경상북도">경상북도</option>
				              	  	<option value="경상남도">경상남도</option>
				              	  	<option value="전라북도">전라북도</option>
				              	  	<option value="전라남도">전라남도</option>
				              	  	<option value="충청북도">충청북도</option>
				              	  	<option value="충청남도">충청남도</option>
				              	  	<option value="강원도">강원도</option>
				              	  	<option value="제주도">제주도</option>
				              	  	<input type="text" class="addr" name="foodAddress" placeholder="상세 주소">
				              	  </select>
				              	 </div>
								<div class="form-group">
									<input type="text" class="form-control" id="" name="foodName"
										placeholder="맛집 이름">
								</div>
								<div id="file-list">
									<div class="form-group">
										<input type="file" class="form-control" id="file" name="foodImage">
									</div>
								</div>
								<div id="file-list"></div>
								<div class="form-group">
									<input type="text" class="form-control" id=""
										name="foodListContent" placeholder="간략 소개글">
								</div>
								<div class="form-group">
									<textarea class="form-control" id="" placeholder="소개글"
										name="foodContent"></textarea>
								</div>
								<a id="cancel" class="btn buttonCustomPrimary">취소</a>
								<button id="write-action" type="submit" class="btn buttonCustomPrimary">등록</button>
								<button id="imageCreate" class="btn buttonCustomPrimary">이미지 추가</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

<!-- --------------------------------------------Food Area End--------------------------------------------------------------------------- -->

<!-- --------------------------------------------Public Area Start----------------------------------------------------------------------- -->

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
	<jsp:include page="/WEB-INF/views/include/javascript/public-javascript.jsp">
		<jsp:param name="requestPage" value="public-js" />
	</jsp:include>

</body>
<!-- --------------------------------------------Public Area End------------------------------------------------------------------------- -->
</html>

