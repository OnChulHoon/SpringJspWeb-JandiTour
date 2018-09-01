<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>

<!-- SITE TITTLE -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>잔디 투어 - 고객문의함</title>

<!-- PLUGINS CSS STYLE -->
<link href="resources/plugins/jquery-ui/jquery-ui.min.css"
	rel="stylesheet">
<link href="resources/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="resources/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="resources/plugins/selectbox/select_option1.css">
<link rel="stylesheet" type="text/css"
	href="resources/plugins/datepicker/datepicker.css">
<link rel="stylesheet" type="text/css"
	href="resources/plugins/isotope/jquery.fancybox.css">
<link rel="stylesheet" type="text/css"
	href="resources/plugins/isotope/isotope.css">
<!-- REVOLUTION SLIDER -->
<link rel="stylesheet"
	href="resources/plugins/revolution/css/settings.css">
<link rel="stylesheet"
	href="resources/plugins/revolution/css/layers.css">
<link rel="stylesheet"
	href="resources/plugins/revolution/css/navigation.css">


<!-- GOOGLE FONT -->
<link
	href='https://fonts.googleapis.com/css?family=Montserrat:400,600,700'
	rel='stylesheet' type='text/css'>

<!-- CUSTOM CSS -->
<link href="resources/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/colors/default.css"
	id="option_color">

<!-- FAVICON -->
<link rel="shortcut icon" type="image/png"
	href="resources/img/favicon.png" />

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(function(){
	$('button[id^=inquiryDelete]').on('click',function(event){
		event.preventDefault();
		var inqNo = $(this).attr('data-inquiryNo')
		$('#inquiryCompleteModal a#processInquiry').attr('href','/janditour/inquiry_delete.action?inqNo='+inqNo)
		$('#inquiryCompleteModal').modal('show');
		
	});
	
});
</script>


</head>

<section class="pageTitle"
	style="background-image: url(/janditour/resources/img/pages/page-title-bg9.jpg);">
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="titleTable">
					<div class="titleTableInner">
						<div class="pageTitleInfo">
							<h1>고객문의함</h1>
							<div class="under-border"></div>
							<br>
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
								<h2>고객문의함</h2>
							</div>
							<div class="table-responsive" data-pattern="priority-columns">
								<table class="table listingsTable">
									<tr class="rowItem">
										<td align="center"><b>No</b></td>
										<td align="center"><b>제목</b></td>
										<td align="center"><b>이름</b></td>
										<td align="center"><b>이메일</b></td>
										<td align="center"><b>번호</b></td>
										<td align="center" ><b>상태</b></td>
									</tr>
									<c:forEach var="inquiry" items="${ inquiry }">
										<tr class="rowItem">
											<td class="dateTd" align="center">${inquiry.inqNo}</td>

											<td class="packageTd">
												<ul class="list-inline listingsInfo">
													<li>
														<h4>
															<a id="search-content" href="#" data-toggle="collapse"
																data-target="#content${inquiry.inqNo}">${inquiry.inqTitle}</a>
														</h4>
														<% pageContext.setAttribute("newLineChar", "\n"); %>
														<h4 id="content${inquiry.inqNo}" class="collapse">${fn:replace(inquiry.inqContent, newLineChar, "<br/>")}</h4>
													</li>
												</ul>
											</td>
											<td class="bookingTd">
												<ul class="list-inline listingsInfo text-left">
													<li>
														<h4 style="margin-left: 65px;font-size: 15px;">${inquiry.inqName}</h4>
													</li>
												</ul>
											</td>
											<td class="bookingTd">
												<ul class="list-inline listingsInfo text-left">
													<li>
														<h4 style="margin-left: 50px; font-size: 15px;">${inquiry.inqEmail}</h4>
													</li>
												</ul>
											</td>
											<td class="bookingTd">
												<ul class="list-inline listingsInfo text-left">
													<li>
														<h4 style="margin-left: 20px; font-size: 15px;">${inquiry.inqPhone}</h4>
													</li>
												</ul>
											</td>
											<td  class="bookingTd">
												<ul class="list-inline listingsInfo text-left">
													<li>
														<button id="inquiryDelete${inquiry.inqNo}" style="width:45px;"
														data-inquiryNo="${inquiry.inqNo}">처리</button>
													</li>
												</ul>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>

						</div>
					</div>
				</div>
			</div>
		</section>
		<br /> <br />
		
		<c:forEach var="inquiry" items="${ inquiry }">
		<div class="modal fade bookingModal modalBook" id="inquiryCompleteModal" tabindex="-1">
		<div class="modal-dialog" align="center">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">처리하시겠습니까?</h4>
				</div>
				<div class="modal-body">
						<a id="processInquiry" class="btn buttonCustomPrimary"
						href="/janditour/inquiry_delete.action?inqNo=${ inquiry.inqNo }">처리완료</a>
				</div>
			</div>
		</div>
	</div>
	</c:forEach>
	

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

