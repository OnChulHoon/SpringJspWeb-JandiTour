<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<title>렌트카 후기 게시판-정보 수정</title>

<!-- PLUGINS CSS STYLE & FONT & FAVICON -->
<jsp:include page="/WEB-INF/views/include/style/public-style.jsp">
	<jsp:param name="requestPage" value="public-style" />
</jsp:include>

<script src="/janditour/resources/plugins/jquery/jquery-3.3.1.js"></script>

<%-- <jsp:include page="/WEB-INF/views/rentalcar/update.jsp" /> --%>

<!-- --------------------------------------------Public Area End------------------------------------------------------------------------- -->

<!-- --------------------------------------------Food Area Start------------------------------------------------------------------------- -->

</head>

<body class="body-wrapper ">
	<div class="main-wrapper">

		<!-- HEADER -->
		<header>
			<jsp:include page="/WEB-INF/views/include/header.jsp">
				<jsp:param name="requestPage" value="public" />
			</jsp:include>
		</header>

		<!-- PAGE TITLE -Admin-write -->
		<jsp:include page="/WEB-INF/views/rentalcar/pagetitle/rentalcar-pagetitle.jsp">
			<jsp:param name="requestPage" value="rentalcar-update"/>
			</jsp:include>
			
		<!-- WHITE SECTION-->
		<section class="mainContentSection">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-md-5 col-lg-4 col-xs-12">

						<div class="contactInfo">
							<h2>렌트카 후기 게시판 정보 수정</h2>
							<p>후기 게시판 정보를 수정합니다. 수정할 정보를 입력해주세요.</p>
							<div class="media">
								<a class="media-left" href="#"> <i class="fa fa-map-marker"
									aria-hidden="true"></i>
								</a>
								<div class="media-body">
									<h4 class="media-heading" href="#"><i class="fa fa-map-marker"
									     aria-hidden="true"></i>
									 </h4>
									<p>
									</p>
								</div>
							</div>
							<div class="media">
								<a class="media-left" href="#"> <i class="fa fa-phone"
									aria-hidden="true"></i>
								</a>
								<div class="media-body">
									<h4 class="media-heading"></h4>
									<p>
									</p>
								</div>
							</div>
							<div class="media">
								<a class="media-left" href="#"> <i class="fa fa-envelope"
									aria-hidden="true"></i>
								</a>
								<div class="media-body">
									<h4 class="media-heading"></h4>
									<p>
									</p>
								</div>
							</div>
						</div>

					</div>
					<div class="col-sm-6 col-md-7 col-xs-12 col-lg-8">
						<div class="contactForm">
							<form action="/janditour/rentalcar/update.action" method="post" role="form"
								class="form" enctype="multipart/form-data">								
								<div class="form-group">
				              	  	<input type="text" class="form-control" name="renNo" value="${rentalCar.renNo}" readonly="readonly">
				              	 </div>
								<div class="form-group">
									<input type="text" class="form-control" id="" name="renSub"
										placeholder="제목" value="${ rentalCar.renSub}">
								</div>
								
								<div id="file-list"></div>
								<div class="form-group">
									<input type="text" class="form-control" value="${rentalCar.memId} (${rentalCar.memNo})" readonly="readonly">
								</div>
								
								<div class="form-group">
									<textarea class="form-control" id="" placeholder="차량이름"
										name="renCarName">${rentalCar.renCarName}</textarea>
								</div>
								
								<div id="file-list">
									<div class="form-group">
										<input type="file" class="form-control" id="file" name="renPicTwo">
									</div>
								</div>
								<div style="text-align:right">
								<button id="btn-detail" type="reset" class="btn buttonCustomPrimary" style="padding-left:20px;padding-right:20px">취소</button>
								<button id="btn-update" type="submit" class="btn buttonCustomPrimary" style="padding-left:20px;padding-right:20px;margin-left:10px">수정</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
<%-- 	
			<div id="inputcontent">
				<div id="inputmain">
					<div class="inputsubtitle">게시판 글 수정</div>
					<form id="updateform" action="update.action" method="post">
						<input type="hidden" name="pageno" value='${ pageno }'>
						<table>
							<tr>
								<th>글번호</th>
								<td>${ rentalCar.renNo } <input type="hidden" name="renNo"
									value="${ rentalCar.renNo }">
								</td>
							</tr>
							<tr>
								<th>제목</th>
								<td><input type="text" name="renSub" style="width: 280px"
									value="${ rentalCar.renSub }"></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>${ rentalCar.memId } <input type="hidden" name="memId"
									value="${ rentalCar.memId } (${ rentalCar.memNo })">
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="renCon" cols="76" rows="15">${ rentalCar.renCon }</textarea>
								</td>
							</tr>
						</table>
						<div class="buttons">
							<!-- <form>의 submit 수행 -->
							<a id="update" href="#">글수정</a> &nbsp;&nbsp; <a
								href='detail.action?boardno=${ rentalCar.boardNo }&pageno=${ pageno }'>취소</a>
						</div>
					</form>
				</div>
			</div>
 --%>			
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
	<script type="text/javascript">
	$(function() {
		$('#btn-detail').on('click', function(event) {
			event.preventDefault();
			history.back();
		});
		
		$('#btn-update').on('click', function(event) {
			event.preventDefault();
			alert("수정 준비중");
		});
	})
	</script>
</body>
<!-- --------------------------------------------Public Area End------------------------------------------------------------------------- -->
</html>