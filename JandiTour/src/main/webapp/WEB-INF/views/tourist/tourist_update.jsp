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
<title>잔디 투어 - 관광지 정보</title>

<!-- PLUGINS CSS STYLE & FONT & FAVICON -->
<jsp:include page="/WEB-INF/views/include/style/public-style.jsp">
	<jsp:param name="requestPage" value="food-list-style" />
</jsp:include>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(function() {
		$('#imageCreate').on('click', function(event) {
			event.preventDefault();
			event.stopPropagation();
			var btn = $("<div class=\"form-group\"><input type=\"file\" class=\"form-control\" id=\"file\" name=\"touristImage\"></div>");
			$('#file-list').append(btn);	
		});
		
		var select = $("select[name=citName]");
		var group = select.attr("data-select");
		select.find("option").each(function(idx, option) {
			if ($(this).text() == group) {
				$(this).attr("selected", "selected");
			}
		});
	});
</script>

<style type="text/css">
#imageCreate {
	margin-left: 10px;
}

.select {
	width: 200px;
	height: 45px;
	background-color: whitesmoke;
	box-shadow: none;
	border-color: whitesmoke;
	font-family: "Montserrat", sans-serif;
	font-size: 12px;
	margin-bottom: 15px;
	margin-right: 10px;
	border-radius: 4px;
	padding-left: 5px;
	padding-right: 5px;
	border: 0px;
}

.addr {
	width: 540px;
	height: 45px;
	background-color: whitesmoke;
	box-shadow: none;
	border-color: whitesmoke;
	font-family: "Montserrat", sans-serif;
	font-size: 12px;
	margin-bottom: 15px;
	border-radius: 4px;
	border: 0px;
	padding-left: 10px;
	padding-right: 5px;
}

.file {
	width: 540px;
	height: 45px;
	border: 5px;
	background-color: whitesmoke;
	box-shadow: none;
	border-color: whitesmoke;
	font-family: "Montserrat", sans-serif;
	font-size: 12px;
	margin-bottom: 15px;
	border-radius: 4px;
	padding-left: 10px;
	padding-right: 5px;
	vertical-align: text-bottom;
}

#imageCreate {
	margin-right: 10px;
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
									<h1>여행지 수정</h1>
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
					<div class="col-sm-6 col-md-5 col-lg-4 col-xs-12">

						<div class="contactInfo">
							<h2>관광지 수정</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempor</p>
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

							<form action="tourist_update.action" method="post" role="form"
								class="form" enctype="multipart/form-data">
								<div class="">
									<select class="select" name="citName" data-select="${tourist.citName}">
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
										<input type="text" class="addr" name="touAddress" value="${ tourist.touAddress }">
									</select>
									
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="touName"
										value="${ tourist.touName }">
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="touListCon"
										value="${ tourist.touListCon }">
								</div>

								<div id="file-list">
									<div class="form-group">
										<input type="file" class="form-control" id="file"
											name="touristImage">
									</div>
								</div>


								<div id="file-list"></div>
								<div class="form-group">
									<textarea class="form-control"
										name="touContent">${ tourist.touContent }</textarea>
								</div>
								<input type="hidden" name="touristNo" value="${tourist.touNo}">
								<input type="hidden" name="touCheck" value="${tourist.touCheck}">
								
								<a href="/janditour/tourist/tourist_list.action" class="btn buttonCustomPrimary">목록으로</a>
								<a id="imageCreate" class="btn buttonCustomPrimary">이미지 추가</a> 
								<button type="submit" class="btn buttonCustomPrimary">저장</button>							
							</form>
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
			<jsp:param name="requestPage" value="food-list-js" />
		</jsp:include>
</body>

</html>

