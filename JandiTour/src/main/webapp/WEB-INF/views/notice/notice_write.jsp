<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>

<!-- --------------------------------------------Public Area Start----------------------------------------------------------------------- -->
<!-- SITE TITTLE -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공지사항 등록</title>

<!-- PLUGINS CSS STYLE & FONT & FAVICON -->
<jsp:include page="/WEB-INF/views/include/style/public-style.jsp">
	<jsp:param name="requestPage" value="public-style" />
</jsp:include>

<!-- --------------------------------------------Public Area End------------------------------------------------------------------------- -->

<!-- --------------------------------------------Food Area Start------------------------------------------------------------------------- -->

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

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
			style="background-image: url(img/pages/page-title-bg5.jpg);">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="titleTable">
							<div class="titleTableInner">
								<div class="pageTitleInfo">
									<h1>contact us</h1>
									<div class="under-border"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- WHITE SECTION-->
		<section class="mainContentSection">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-md-5 col-lg-4 col-xs-12"></div>
					<div class="col-sm-6 col-md-7 col-xs-12 col-lg-8">
						<div class="contactForm">
							<form action="/janditour/notice_write.action" method="post" role="form" class="form">
								<div class="form-group">
									<input type="text" class="form-control" name="noticeTitle" id="noticeTitle"
										placeholder="제목">
								</div>
								<div class="form-group">
									<input type="date" class="form-control" name="noticeDate" id="noticeDate"
										placeholder="게시일">
								</div>
								<div class="form-group">
									<textarea class="form-control" name="noticeContent" id="noticeContent" placeholder="내용"></textarea>
								</div>
								<button type="submit" class="btn buttonCustomPrimary">등록</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>

<!-- --------------------------------------------Food Area End--------------------------------------------------------------------------- -->

<!-- --------------------------------------------Public Area Start----------------------------------------------------------------------- -->

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
	<jsp:include page="/WEB-INF/views/include/javascript/public-javascript.jsp">
		<jsp:param name="requestPage" value="food-write-js" />
	</jsp:include>

</body>
<!-- --------------------------------------------Public Area End------------------------------------------------------------------------- -->
</html>

