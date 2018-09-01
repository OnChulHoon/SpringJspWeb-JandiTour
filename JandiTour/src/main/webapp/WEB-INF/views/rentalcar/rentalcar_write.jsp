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
<title>렌트카 후기 정보 게시판 - 렌트카 후기 등록</title>

<!-- PLUGINS CSS STYLE & FONT & FAVICON -->
<jsp:include page="/WEB-INF/views/include/style/public-style.jsp">
	<jsp:param name="requestPage" value="public-style"/>
</jsp:include>

<script src="/janditour/resources/plugins/jquery/jquery-3.3.1.js"></script>

<!-- --------------------------------------------Public Area End------------------------------------------------------------------------- -->

<!-- --------------------------------------------Food Area Start------------------------------------------------------------------------- -->

<style type="text/css">
#write-action {
	margin-right: 50px;
}
#update-action {
    margin-right: 80px;
}
#delete-action {
    margin-right: 70px;
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
	<!-- DASHBOARD MENU  -->
		<section class="dashboardMenu">
			<nav class="navbar dashboradNav">
				<div class="container">
					<div class="dashboardNavRight">
						<ul class="NavRight">
							<li class="dropdown singleDrop"><a href="#" class=" "
								data-toggle="" role="button" aria-haspopup="true"
								aria-expanded="false"><i class="fa fa-bell"
									aria-hidden="true"></i> <span class="notifyNumber">2</span></a></li>
							<c:if test="${not empty loginuser}">
								<li class="dropdown singleDrop"><a href=""
									class="dropdown-toggle" data-toggle="dropdown" role="button"
									aria-haspopup="true" aria-expanded="false"><img
										src="/janditour/resources/upload-image/member-info/${loginuser.memFile}"
										alt=""><i class="fa fa-angle-down" aria-hidden="true"></i></a>
									<ul class="dropdown-menu dropdownMenu">
										<li><a
											href="/janditour/profileImgUpload.action?memNo=${loginuser.memNo}"><h5>마이페이지</h5></a></li>
										<li><a
											href="/janditour/modifyAccount.action?memNo=${loginuser.memNo}"><h5>회원정보수정</h5></a></li>
										<li><a href="/janditour/logout.action"><h5>로그아웃</h5></a></li>
									</ul></li>
							</c:if>
						</ul>
					</div>
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav dashboardNavLeft">
							<c:if test="${not empty loginuser}">
								<li><a
									href="/janditour/profileImgUpload.action?memNo=${loginuser.memNo}"><i
										class="fa fa-user" aria-hidden="true"></i>마이페이지</a></li>
								<li><a
									href="/janditour/modifyAccount.action?memNo=${loginuser.memNo}"><i
										class="fa fa-cogs" aria-hidden="true"></i>회원정보수정</a></li>
							</c:if>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container -->
			</nav>
		</section>

		<!-- WHITE SECTION-->
		<section class="mainContentSection">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-md-5 col-lg-4 col-xs-12">

						<div class="contactInfo">
							<h2>렌트카 후기 등록</h2>
							<p>렌트카 후기를 등록합니다. 빈칸에 정보를 입력해주세요.</p>
							<div class="media">
								<a class="media-left" href="#"> <i class="fa fa-map-marker"
									aria-hidden="true"></i>
								</a>
								<div class="media-body">
									<h4 class="media-heading"></h4>
									<p>
										<br>
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
							<form action="write.action" method="post" role="form"
								class="form" enctype="multipart/form-data">
								<div class="form-group">
									<input type="text" class="form-control" id="" name="renSub" placeholder="제목">
								</div>
								<div id="file-list">
									<div class="form-group">
										<input type="file" class="form-control" id="file" name="car_image">
									</div>
								</div>
								<div id="file-list"></div>
								<div class="form-group">
									<input type="hidden" name="memNo" value="${ loginuser.memNo }">
									<input type="text" class="form-control" name="memNoPlaceholder"
										readonly="readonly" value="${ loginuser.memId }" >
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="renCarName" placeholder="자동차 이름">
								</div>
								<div class="form-group">
									<textarea class="form-control" id="" placeholder="후기 내용" name="renCon"></textarea>
								</div>
								<a id="write_cancel" class="btn buttonCustomPrimary">취소</a>
								<button id="write-action" type="submit" class="btn buttonCustomPrimary">등록</button>
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
	<script type="text/javascript">
	$(function() {
		$('#write_cancel').on('click', function(event) {
			history.back();
		})
	});
	</script>
 	

</body>
<!-- --------------------------------------------Public Area End------------------------------------------------------------------------- -->
</html>

