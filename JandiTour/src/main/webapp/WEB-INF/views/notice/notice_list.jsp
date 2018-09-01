<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>

<!-- SITE TITTLE -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>잔디 투어 - 공지사항</title>

<!-- PLUGINS CSS STYLE & FONT & FAVICON -->
<jsp:include page="/WEB-INF/views/include/style/public-style.jsp">
	<jsp:param name="requestPage" value="public-style" />
</jsp:include>


<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>	
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script> -->
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(function() {
		$('button[id^=noticeDelete]').on(
				'click',
				function(event) {
					event.preventDefault();
					var noticeNo = $(this).attr('data-noticeNo')
					$('#noticeModal a#processNotice').attr(
							'href',
							'/janditour/notice_delete.action?noticeNo='
									+ noticeNo);
					$('#noticeModal').modal('show');

				});

	});
</script>
<style type="text/css">
#noticeWriteBtn {
	color: white;
}
</style>
</head>

<section class="pageTitle"
	style="background-image: url(/janditour/resources/img/pages/page-title-bg9.jpg);">
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="titleTable">
					<div class="titleTableInner">
						<div class="pageTitleInfo">
							<h1>공지사항</h1>
							<div class="under-border"></div>
							<br>
							<c:if test="${not empty loginuser and loginuser.memDiv eq '1'}">
								<div align="center">
									<a id="noticeWriteBtn" href="/janditour/notice_write.action"
										class="btn buttonTransparent">공지사항 등록</a>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<body class="body-wrapper ">
	<div class="main-wrapper">

		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp"></a>
		</div>



		<!-- HEADER -->
		<header>
			<jsp:include page="/WEB-INF/views/include/header.jsp">
				<jsp:param name="requestPage" value="public" />
			</jsp:include>
		</header>

		<br> <br> <br>

		<!--=============================================================================================================================->
		<!-- RECENT ACTIVITY SECTION -->
		<section class="recentActivitySection">
			<div class="container">

				<div class="row">
					<div class="col-xs-12 ">
						<div class="recentActivityContent bg-ash">

							<div class="dashboardPageTitle">

								<h2>공지사항</h2>
							</div>
							<br>
							<div class="table-responsive" data-pattern="priority-columns">
								<table class="table listingsTable">
									<tr class="rowItem">
										<td align="center"><b>No</b></td>
										<td align="center"><b>제목</b></td>
										<td align="center"><b>날짜</b></td>
										<c:if
											test="${not empty loginuser and loginuser.memDiv eq '1'}">
											<td align="center"><b>삭제</b></td>
										</c:if>
									</tr>

									<c:forEach var="notice" items="${ notice }">
										<tr class="rowItem">
											<td class="dateTd" align="center">${notice.noticeNo}</td>

											<td class="packageTd">
												<ul class="list-inline listingsInfo">
													<li>
														<h4>
															<a id="search-content" href="#" data-toggle="collapse"
																data-target="#contentSearch${notice.noticeNo}">${notice.noticeTitle}</a>
														</h4> <%pageContext.setAttribute("newLineChar", "\n"); %>
														<h4 id="contentSearch${notice.noticeNo}" class="collapse">${fn:replace(notice.noticeContent, newLineChar, "<br/>")}</h4>
													</li>
												</ul>
											</td>

											<td class="bookingTd">
												<ul class="list-inline listingsInfo text-left">
													<li><fmt:formatDate value="${ notice.noticeDate }"
															var="noticeDate" pattern="yyyy-MM-dd" />
														<h4 style="margin-left: 110px; font-size: 17px">${noticeDate}</h4>
													</li>
												</ul>
											</td>
											<c:if
												test="${not empty loginuser and loginuser.memDiv eq '1'}">
												<td class="bookingTd">
													<ul class="list-inline listingsInfo text-left">
														<li>
															<button id="noticeDelete${notice.noticeNo}"
																style="margin-left: 100px;"
																data-noticeNo="${notice.noticeNo}">처리</button>
														</li>
													</ul>
												</td>
											</c:if>
										</tr>
									</c:forEach>
								</table>
							</div>

						</div>
					</div>
				</div>
			</div>
		</section>

		<c:forEach var="notice" items="${ notice }">
			<div class="modal fade bookingModal modalBook" id="noticeModal"
				tabindex="-1">
				<div class="modal-dialog" align="center">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">처리하시겠습니까?</h4>
						</div>
						<div class="modal-body">
							<a id="processNotice" class="btn buttonCustomPrimary"
								href="/janditour/notice_delete.action?noticeNo=${ notice.noticeNo }">처리완료</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
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

	<!-- <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#loginButton').on('click', function(event) {
				alert("로그인 성공");
				event.preventDefault();
				$('form#loginForm').submit();
			});
		});
	</script> -->

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

