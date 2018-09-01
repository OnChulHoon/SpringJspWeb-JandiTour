<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style type="text/css">
#notifyNumber{
  color: #ffffff;
  background-color: #ff891e;
  position: absolute;
  top: 23px;
  left: 10px;
  padding: 0px 5px;
  border-radius: 3px;
  z-index: 20;
  font-size: 5px;
  line-height: 1.5;
}
</style>

<c:choose>
	<c:when test="${param.requestPage eq 'home'}">

		<nav class="navbar navbar-default navbar-main navbar-fixed-top"
			role="navigation">
			<div class="container">

				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-ex1-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" style="background-image: url('/janditour/resources/img/logo-color-small.png')" href="/janditour/home.action"></a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-ex1-collapse">
					<ul class="nav navbar-nav navbar-right">
						<!-- <li class="dropdown singleDrop active"><a
							href="javascript:void(0)" class="dropdown-toggle"
							data-toggle="dropdown">소개</a>
							<ul class="dropdown-menu dropdown-menu-left">
								<li class="dropdown singleDrop active"><a
									href="/janditour/comingsoon.action">서비스 소개</a></li>
							</ul></li> -->

						<li class="dropdown singleDrop "><a href="javascript:void(0)"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">여행정보</a>
							<ul class="row dropdown-menu">
								<li class=""><a
									href="/janditour/tourist/tourist_list.action">관광지 정보</a></li>
								<li class=""><a href="/janditour/food_list.action">맛집
										정보</a></li>
								<li class=""><a href="/janditour/stay.action">숙소 정보</a></li>
							</ul></li>

						<li class="dropdown singleDrop "><a href="javascript:void(0)"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">후기<span id="notifyNumber">Beta</span></a>
							<ul class="row dropdown-menu">
								<li class=""><a href="/janditour/rentalcar/list.action">렌트카
										게시판</a></li>
								<li class=""><a href="/janditour/travelnote_list.action">여행기
										게시판</a></li>
							</ul></li>

						<li class="dropdown singleDrop "><a href="javascript:void(0)"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">고객센터</a>
							<ul class="dropdown-menu dropdown-menu-right">
								<li class=""><a href="/janditour/notice_list.action">공지사항</a></li>
								<li class="dropdown singleDrop "><a href=""
									class="dropdown-toggle" data-toggle="modal" role="button"
									aria-haspopup="true" aria-expanded="false"
									data-target="#inquiryModal">1:1문의</a></li>
								<c:if test="${not empty loginuser and loginuser.memDiv eq '1'}">
									<li class=""><a href="/janditour/inquiry_list.action">고객문의함</a></li>
								</c:if>
							</ul></li>

						<c:if test="${not empty loginuser}">
							<li class="dropdown singleDrop "><a
								href="javascript:void(0)" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">${loginuser.memName} 님</a>
								<ul class="dropdown-menu dropdown-menu-right">
									<li class=""><a
										href="/janditour/bookMarkRead.action?memNo=${loginuser.memNo}">나의
											북마크</a></li>
									<c:if test="${not empty loginuser}">
										<li class=""><a
											href="/janditour/profileImgUpload.action?memNo=${loginuser.memNo}">마이페이지</a></li>
										<li class=""><a
											href="/janditour/modifyAccount.action?memNo=${loginuser.memNo}">회원정보수정</a></li>
									</c:if>

								</ul></li>
						</c:if>

						<c:if test="${empty loginuser}">
							<li class="dropdown singleDrop "><a
								href="/janditour/login.action" class="dropdown-toggle"
								data-toggle="modal" role="button" aria-haspopup="true"
								aria-expanded="false" data-target="#login">로그인</a></li>
							<li class=""><c:if test="${empty loginuser}">
									<a href="/janditour/join.action" data-toggle="modal"
										data-target="#signup">회원가입</a>
								</c:if></li>
						</c:if>
						<c:if test="${not empty loginuser}">
							<li class="dropdown singleDrop "><a
								href="/janditour/logout.action" class="dropdown-toggle"
								role="button" aria-haspopup="true" aria-expanded="false">로그아웃</a>
							</li>
						</c:if>

						<li class="dropdown searchBox"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false"><span
								class="searchIcon"><i class="fa fa-search"
									aria-hidden="true"></i></span></a>
							<ul class="dropdown-menu dropdown-menu-right">
								<li><span class="input-group"> <input type="text"
										class="form-control" placeholder="Search..."
										aria-describedby="basic-addon2"> <span
										class="input-group-addon" id="basic-addon2">Search</span>
								</span></li>
							</ul></li>
					</ul>
				</div>

			</div>
		</nav>
	</c:when>












	<c:otherwise>
		<c:if test="${param.requestPage eq 'public'}">

			<nav
				class="navbar navbar-default navbar-main navbar-fixed-top   lightHeader"
				role="navigation">
				<div class="container">

					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-ex1-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" style="background-image: url('/janditour/resources/img/jandi-color.png')" href="/janditour/home.action"></a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse navbar-ex1-collapse">
						<ul class="nav navbar-nav navbar-right">
							<!-- <li class="dropdown singleDrop "><a
								href="javascript:void(0)" class="dropdown-toggle"
								data-toggle="dropdown">소개</a>
								<ul class="dropdown-menu dropdown-menu-left">
									<li class="dropdown singleDrop"><a
										href="/janditour/comingsoon.action">서비스 소개</a></li>
								</ul></li> -->
							<li class="dropdown singleDrop "><a
								href="javascript:void(0)" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">여행정보</a>
								<ul class="row dropdown-menu">
									<li class=""><a
										href="/janditour/tourist/tourist_list.action">관광지 정보</a></li>
									<li class=""><a href="/janditour/food_list.action">맛집
											정보</a></li>
									<li class=""><a href="/janditour/stay.action">숙소 정보</a></li>
								</ul></li>
							<li class="dropdown singleDrop "><a href="javascript:void(0)"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">후기<span id="notifyNumber">Beta</span></a>
							<ul class="row dropdown-menu">
								<li class=""><a href="/janditour/rentalcar/list.action">렌트카
										게시판</a></li>
								<li class=""><a href="/janditour/travelnote_list.action">여행기
										게시판</a></li>
							</ul></li>

							<li class="dropdown singleDrop "><a
								href="javascript:void(0)" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">고객센터</a>
								<ul class="dropdown-menu dropdown-menu-right">
									<li class=""><a href="/janditour/notice_list.action">공지사항</a></li>
									<li class="dropdown singleDrop "><a href=""
										class="dropdown-toggle" data-toggle="modal" role="button"
										aria-haspopup="true" aria-expanded="false"
										data-target="#inquiryModal">1:1문의</a></li>
									<c:if test="${not empty loginuser and loginuser.memDiv eq '1'}">
										<li class=""><a href="/janditour/inquiry_list.action">고객문의함</a></li>
									</c:if>
								</ul></li>
							<c:if test="${not empty loginuser}">
								<li class="dropdown singleDrop "><a
									href="javascript:void(0)" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">${loginuser.memName} 님</a>
									<ul class="dropdown-menu dropdown-menu-right">
										<li class=""><a
											href="/janditour/bookMarkRead.action?memNo=${loginuser.memNo}">나의
												북마크</a></li>
										<c:if test="${not empty loginuser}">
											<li class=""><a
												href="/janditour/profileImgUpload.action?memNo=${loginuser.memNo}">마이페이지</a></li>
											<li class=""><a
												href="/janditour/modifyAccount.action?memNo=${loginuser.memNo}">회원정보수정</a></li>
										</c:if>
									</ul></li>
							</c:if>

							<c:if test="${empty loginuser}">
								<li class="dropdown singleDrop "><a
									href="/janditour/login.action" class="dropdown-toggle"
									data-toggle="modal" role="button" aria-haspopup="true"
									aria-expanded="false" data-target="#login">로그인</a></li>
								<li class=""><c:if test="${empty loginuser}">
										<a href="/janditour/join.action" data-toggle="modal"
											data-target="#signup">회원가입</a>
									</c:if></li>
							</c:if>
							<c:if test="${not empty loginuser}">
								<li class="dropdown singleDrop "><a
									href="/janditour/logout.action" class="dropdown-toggle"
									role="button" aria-haspopup="true" aria-expanded="false">로그아웃</a>
								</li>
							</c:if>

							<li class="dropdown searchBox"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown" role="button"
								aria-haspopup="true" aria-expanded="false"><span
									class="searchIcon"><i class="fa fa-search"
										aria-hidden="true"></i></span></a>
								<ul class="dropdown-menu dropdown-menu-right">
									<li><span class="input-group"> <input type="text"
											class="form-control" placeholder="Search..."
											aria-describedby="basic-addon2"> <span
											class="input-group-addon" id="basic-addon2">Search</span>
									</span></li>
								</ul></li>
						</ul>
					</div>

				</div>
			</nav>
		</c:if>
	</c:otherwise>
</c:choose>


