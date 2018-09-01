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
<link href="/janditour/resources/css/food/food-list.css" rel="stylesheet">

<style type="text/css">
#img {
	width: 263px;
	height: 193px;
}
</style>
</head>


<body class="body-wrapper ">
	<div class="main-wrapper">

    <!-- HEADER Start-->
    <header>
      	<jsp:include page="/WEB-INF/views/include/header.jsp">
			<jsp:param name="requestPage" value="public"/>
		</jsp:include>
    </header>
	<!-- HEADER End-->

<!-- FoodInfo Body Start -->

		<!-- PAGE TITLE -->
		<jsp:include page="/WEB-INF/views/food/pagetitle/food-pagetitle.jsp">
			<jsp:param name="requestPage" value="food-list"/>
		</jsp:include>
		<!-- PAGE CONTENT Start-->
		<section class="mainContentSection packagesSection">
			<div class="container">
				<div class="row">
					<jsp:include page="/WEB-INF/views/food/content/food-list-search.jsp">
						<jsp:param name="requestPage" value="food-list-search"/>
					</jsp:include>
					
					<jsp:include page="/WEB-INF/views/food/bootstrap/dialog-modal.jsp">
						<jsp:param name="requestPage" value="search-check-food" />
					</jsp:include>
					
					<jsp:include page="/WEB-INF/views/food/content/food-list-content.jsp">
						<jsp:param name="requestPage" value="food-list-content-all"/>
					</jsp:include>
				</div>
				
				<!-- Page Count -->
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
<!-- PAGE CONTENT End -->
<!-- FoodInfo Body End -->	
	
<!-- --------------------------------------------Food Area End--------------------------------------------------------------------------- -->		

<!-- --------------------------------------------Public Area Start----------------------------------------------------------------------- -->
		<!-- FOOTER -->
		<footer>
			<jsp:include page="/WEB-INF/views/include/footer.jsp">
				<jsp:param name="requestPage" value="footer"/>
			</jsp:include>
		</footer>
	</div>
	
	<!-- INQUIRY MODAL -->
	<jsp:include page="/WEB-INF/views/include/inquiry.jsp">
		<jsp:param name="requestPage" value="inquiry"/>
	</jsp:include>

	<!-- Signup Modal -->
	<jsp:include page="/WEB-INF/views/include/member.jsp">
		<jsp:param name="requestPage" value="signup"/>
	</jsp:include>

	<!-- Login Modal -->
	<jsp:include page="/WEB-INF/views/include/member.jsp">
		<jsp:param name="requestPage" value="login"/>
	</jsp:include>

	<!-- JAVASCRIPTS -->
	<jsp:include page="/WEB-INF/views/include/javascript/public-javascript.jsp">
		<jsp:param name="requestPage" value="public-js"/>
	</jsp:include>
<!-- --------------------------------------------Public Area End------------------------------------------------------------------------- -->	

</body>

</html>

