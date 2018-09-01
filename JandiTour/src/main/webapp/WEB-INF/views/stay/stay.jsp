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
<title>잔디 투어 - 숙소 정보</title>

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
		$('#writeBtn').on('click', function(event) {
			location.href = 'stay_write.action';
		});
		
		$('#search').on('click', function(event) {
			var area = $('#area').val();
			var area2 = $('#area2').val();
			var staName = $('#staName').val();
			
			if(area == '' && area2 == '' && staName == '') {
				alert('검색할 지역이나 숙소를 선택/입력하세요.');
				return;
			}
			
			location.href = 'stay.action?area=' 
					+ encodeURI(area) 
					+ '&area2=' 
					+ encodeURI(area2)
					+ '&staName='
					+ encodeURI(staName);
		});
		
		/* var banner = $('div#banner');
		banner.css("position","relative"); */
		
		$(window).scroll(function() { 
				
			var scrollTop = $(window).scrollTop();
			
			if (scrollTop > 503) { 
				return;
			}
			
			var newTop = scrollTop > newTop ? newTop + "px" : scrollTop + "px";
						
			$('#banner').animate(
						{ top: newTop },
						{ queue: false, duration: 350 });
			

			
			
			
		});
		
		  
		});

</script> 

<style type="text/css">

#img {
	width: 263px;
	height: 193px;
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
			style="background-image: url(/janditour/resources/img/pages/page-title-bg13.jpg);">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="titleTable">
							<div class="titleTableInner">
								<div class="pageTitleInfo">
									<h1>지역 숙소 정보</h1>
									<div class="under-border"></div>
									<br>
									<c:if test="${not empty loginuser and loginuser.memDiv eq '1'}">
									<div align="center">
										<a id="writeBtn" href="/janditour/stay_write.action"
											class="btn buttonTransparent">숙소 정보 등록</a>
									</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- PAGE CONTENT -->
		<!-- search -->
		<section class="mainContentSection packagesSection">
			<div class="container">
				<div class="row">
				<!-- 사이드바 -->
					<div id ="banner" class="col-sm-3 col-xs-12">
						<aside>
							<form action="/janditour/stay/stay.action" method="post">
								<div class="panel panel-default packagesFilter">
									<div class="panel-heading">
										<h3 class="panel-title">숙소 검색</h3>
									</div>
									<div class="panel-body">
										<div class="row">
											<div class="col-xs-12">
												<div class="searchFilter">
													<select name="area" id="area"
														class="form-control">
														<option value="">-지역선택-</option>
														<option value="전체">전체</option>
														<option value="서울특별시">서울특별시</option>
														<option value="인천광역시">인천광역시</option>
														<option value="경기도">경기도</option>
														<option value="부산광역시">부산광역시</option>
														<option value="울산광역시">울산광역시</option>
														<option value="대구광역시">대구광역시</option>
														<option value="경상북도">경상북도</option>
														<option value="경상남도">경상남도</option>
														<option value="광주광역시">광주광역시</option>
														<option value="전라북도">전라북도</option>
														<option value="전라남도">전라남도</option>
														<option value="대전광역시">대전광역시</option>
														<option value="충청북도">충청북도</option>
														<option value="충청남도">충청남도</option>
														<option value="강원도">강원도</option>
														<option value="제주도">제주도</option>
													</select> <br>
												</div>
											</div>

											<div class="col-xs-12">
												<div class="" data-provide="">
													<input type="text" class="form-control"
														placeholder="지역검색" id="area2" name="area2"> <br>
												</div>
											</div>

											<div class="col-xs-12">
												<div class="" data-provide="">
													<input type="text" class="form-control"
														placeholder="숙소 검색" id="staName" name="staName"> <br>
												</div>
											</div>

											<div class="col-sm-12">
												<a id="search" href="#" class="btn btn-block buttonTransparent">검색</a>
											</div>
											
										</div>
									</div>
								</div>
							</form>
						</aside>
					</div>

					<!-- menu -->
					<div class="col-sm-9 col-xs-12">
						<div class="row">
							<c:forEach var="stay" items="${ stays }">
								<div class="col-lg-4 col-sm-6 col-xs-12">
									<div class="thumbnail deals packagesPage">
										<img
											src="/janditour/resources/upload-image/stay-info/${ stay.savedImageFileName }"
											alt="deal-image" id="img"> 
											<a href="stay_detail.action?staNo=${ stay.staNo }&pageno=${ pageno }"
											class="pageLink"></a>
										
										<div class="discountInfo">
											<ul class="list-inline rating homePage">
												<c:forEach begin="1" end="${ stay.staRating }">
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
												</c:forEach>
												<c:forEach begin="1" end="${ 5 - stay.staRating }">
													<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
												</c:forEach>
											</ul>
											<ul class="list-inline duration">
												<li>${ stay.staAddress }</li>
											</ul>
										</div>
										<div class="caption">
											<h4>
												<a
													href="/janditour/stay/stay_detail.action?staNo=${ stay.staNo }&pageno=${ pageno }"
													class="captionTitle">${ stay.staName }</a>
											</h4>
											<p>${ stay.staListCon }</p>
											<div class="detailsInfo">
												<h5>
													<span>리뷰 평점</span><i class="fa fa-star" aria-hidden="true"></i> ${ stay.staRating }.0
												</h5>
												<ul class="list-inline detailsBtn">
													<li><a
														href="stay_detail.action?staNo=${ stay.staNo }"
														class="btn buttonTransparent">상세보기</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
		

				<!-- pageCount -->
				<div class="row">
					<div class="col-xs-12">
						<div class="paginationCenter">
							<ul class="pagination">
								<li>
									<c:choose>
										<c:when test="${ pager.currentPage == 1 }">
											<a href="javascript:" aria-label="Previous"> 
												<span aria-hidden="true">
													<i class="fa fa-long-arrow-left" aria-hidden="true"></i>Previous
												</span>
											</a>
										</c:when>
										<c:otherwise>
											<a href="${ pager.linkUrl }?pageno=${ pager.currentPage - 1 }" aria-label="Previous">
												<span aria-hidden="true">
													<i class="fa fa-long-arrow-left" aria-hidden="true"></i>Previous
												</span>
											</a>
										</c:otherwise>
									</c:choose>									
								</li>
								<c:forEach var="idx" begin="${pager.pageFrom }" end="${ pager.pageCount > pager.pageTo ? pager.pageTo : pager.pageCount }">
									<c:choose>
										<c:when test="${ pager.currentPage == idx }">
											<li class="active"><a href="javascript:">${ idx }</a></li>	
										</c:when>
										<c:otherwise>
											<li><a href="${ pager.linkUrl }?pageno=${ idx }">${ idx }</a></li>
										</c:otherwise>
									</c:choose>
									
								</c:forEach>
								
								<li>
								<c:choose>
										<c:when test="${ pager.currentPage < pager.pageCount }">
										<a href="${ pager.linkUrl }?pageno=${ pager.currentPage + 1 }" aria-label="Next">										
										</c:when>
										<c:otherwise>
										<a href="javascript:" aria-label="Next"> 
										</c:otherwise>
									</c:choose>									
										<span aria-hidden="true">
											<i class="fa fa-long-arrow-right" aria-hidden="true"></i>Next
										</span>
									</a>
								</li>
							</ul>
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

