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
<title>잔디 투어 - 마이페이지</title>

<!-- PLUGINS CSS STYLE & FONT & FAVICON -->
<jsp:include page="/WEB-INF/views/include/style/public-style.jsp">
	<jsp:param name="requestPage" value="public-style" />
</jsp:include>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(function() {
		$('#upload').on('click', function(event) {
			event.preventDefault();
			$('form#profileImgForm').submit();
		});
	});
</script>

<style type="text/css">
img#i {
	width: 350px;
	height: 300px;
	border-radius: 50%;
}

#ImageAndInfo {
	padding-left: 250px;
}

#rightInfo {
	padding-left: 120px;
}

#aboutYou {
	padding-top: 50px;
	padding-left: 350px;
}
.hr {
	width: 1200px;
}
</style>

</head>


<body class="body-wrapper ">
	<div class="main-wrapper">

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${not empty loginuser}">
					<li class="dropdown singleDrop active"><a
						href="javascript:void(0)" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Admin</a>
						<ul class="dropdown-menu dropdown-menu-right">
							<li class=""><a
								href="/janditour/profileImgUpload.action?memNo=${loginuser.memNo}">마이페이지</a></li>
							<li class=""><a
								href="/janditour/modifyAccount.action?memNo=${loginuser.memNo}">회원정보수정</a></li>
						</ul></li>
				</c:if>
			</ul>
		</div>


		<!-- HEADER -->
		<header>
			<jsp:include page="/WEB-INF/views/include/header.jsp">
				<jsp:param name="requestPage" value="public" />
			</jsp:include>
		</header>


		<!-- DASHBOARD MENU  -->
		<section class="dashboardMenu">
			<nav class="navbar dashboradNav">
				<div class="container">
					<div class="dashboardNavRight">
						<ul class="NavRight">
							<li class="dropdown singleDrop"><a href="#" class=" "
								data-toggle="" role="button" aria-haspopup="true"
								aria-expanded="false"><i class="fa fa-bell"
									aria-hidden="true"></i> <span class="notifyNumber"></span></a></li>
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
		<!-- /////////////////////////////////////////////////////////////////////////////////////// -->
		<!-- Profile 화면 -->
		<div id="aboutYou">
			<h2>&nbsp;&nbsp;&nbsp;&nbsp;마이페이지</h2>
		</div>
		<section id="ImageAndInfo" class="profileSection">
			<div class="container">
				<div class="row">
					<c:if test="${not empty member}">
						<div class="col-xs-12 col-sm-4">
							<div class="profileImg" align="center">
								<img id="i" alt="Cinque Terre" class="img-responsive"
									width="300" height="400"
									src="/janditour/resources/upload-image/member-info/${member.memFile}"
									alt="">
							</div>
						</div>
						<div id="rightInfo" class="col-xs-12 col-sm-8">
							<div class="profileContent">
								<div class="" style="margin-left: 550px">
									<a href="modifyAccount.action?memNo=${loginuser.memNo}"><i
										class="fa fa-pencil" aria-hidden=""></i></a>
								</div>
								<div class="profileTitle">
									<h2>&nbsp;${loginuser.memId}</h2>
								</div>
								<div class="profileInfo">
									<p style="text-align: left">
										<strong>&nbsp;Name: </strong>${loginuser.memName}</p>
									<p>
										<strong>&nbsp;ID: </strong>${member.memId}</p>
									<p>
										<strong>&nbsp;Phone: </strong>${loginuser.memPhone}</p>
									<p>
										<strong>&nbsp;Email: </strong>${member.memEmail}</p>

									<form id="profileImgForm" action="profileImgUpload.action"
										method="post" enctype="multipart/form-data">
										<input type="hidden" id="memNo" name="memNo"
											value="${loginuser.memNo}">
										<div>
											<table>
												<tr>
													<td><strong>&nbsp;Image: </strong></td>
													<td><input type="file" id="memFile" name="memFile">
													</td>
												</tr>
												<tr>
													<td colspan="2"><br> <input
														class="btn buttonTransparent" id="upload" type="button"
														value="프로필 사진 변경"></td>
												</tr>
											</table>

										</div>
									</form>

								</div>

							</div>
						</div>
					</c:if>
				</div>
			</div>
		</section>
		<!-- /////////////////////////////////////////////////////////////////////////////////////// -->
		<br>
		<br>
		
		
		<!-- RECENT OFFER SECTION -->
		<div id="aboutYou">
		<hr class="hr" id="lo2">
		<br>
			<h2>&nbsp;&nbsp;&nbsp;&nbsp;나의 북마크</h2>
		</div>
		<br>
		<section class="recentOfferSection">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 ">
						<div class="recentOfferContent bg-ash">
							<div class="row">
								<!-- Benifits Aria -->
								<div class="col-xs-12 col-sm-4">
									<div class="recentOfferAria">
										<h4 style="font-size: 20px;" align="center">관광지 북마크</h4>
										<c:forEach var="attachmentTou" items="${ attachmentTou }">
											<div class="offerContent">
												<div class="singleContent">
													<div class="media">
														<div class="media-left"></div>
														<div class="media-body">
															<h4 class="media-heading">
																<a
																	href="/janditour/tourist/tourist_detail.action?touristno=${attachmentTou.bookDiv}">
																	${attachmentTou.bookName} </a>
															</h4>
															<p>
																<span>${attachmentTou.bookListCon}</span>
															</p>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
								<!-- Recent Offer Aria -->
								<div class="col-xs-12 col-sm-4">
									<div class="recentOfferAria">
										<h4 style="font-size: 20px;" align="center">숙소 북마크</h4>
										<c:forEach var="attachmentSta" items="${ attachmentSta }">
											<div class="offerContent">
												<div class="singleContent">
													<div class="media">
														<div class="media-left"></div>
														<div class="media-body">
															<h4 class="media-heading">
																<a
																	href="/janditour/stay_detail.action?staNo=${attachmentSta.bookDiv}">
																	${attachmentSta.bookName} </a>
															</h4>
															<p>
																<span>${attachmentSta.bookListCon}</span>
															</p>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>

								<div class="col-xs-12 col-sm-4">
									<div class="recentOfferAria">
										<h4 style="font-size: 20px;" align="center">맛집 북마크</h4>
										<c:forEach var="attachmentFoo" items="${ attachmentFoo }">
											<div class="offerContent">
												<div class="singleContent">
													<div class="media">
														<div class="media-left"></div>
														<div class="media-body">
															<h4 class="media-heading">
																<a
																	href="/janditour/food_detail.action?foodNo=${attachmentFoo.bookDiv}">
																	${attachmentFoo.bookName} </a>
															</h4>
															<p>
																<span>${attachmentFoo.bookListCon}</span>
															</p>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

		</section>
		<!-- FOOTER -->
		<footer>
			<jsp:include page="/WEB-INF/views/include/footer.jsp">
				<jsp:param name="requestPage" value="footer" />
			</jsp:include>
		</footer>
	</div>

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

</body>

</html>

