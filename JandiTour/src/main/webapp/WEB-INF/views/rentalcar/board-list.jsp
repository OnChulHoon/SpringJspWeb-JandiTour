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
<title>잔디 투어 - 렌트카 후기 정보 게시판</title>

<jsp:include page="/WEB-INF/views/include/style/public-style.jsp">
	<jsp:param name="requestPage" value="public-style" />
</jsp:include>

<style type="text/css">
table.listingsTable tr { height: 60px; }
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
		
		<jsp:include page="/WEB-INF/views/rentalcar/pagetitle/rentalcar-pagetitle.jsp"/>
		
		<!--=============================================================================================================================->
		<!-- RECENT ACTIVITY SECTION -->
		<br><br><br>
		<section class="recentActivitySection">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 ">
						<div class="recentActivityContent bg-ash">
							<div class="dashboardPageTitle">
								<h2>렌트카 후기 게시판</h2>
							</div>
							<div data-pattern="priority-columns">
								<table class="table listingsTable">
									<tr style="background-color: white">
										<td align="center">No</td>
										<td align="center">제목</td>
										<td align="center">작성자</td>
										<td align="center">차종</td>
										<td align="center">사진</td>
									</tr>

										<c:forEach var="rentalCar" items="${ rentalCarList }">
											<tr class="rowItem">											
												<td class="dateTd" style="text-align: center">${ rentalCar.renNo }</td>
												<td class="packageTd"><a href="detail.action?renNo=${ rentalCar.renNo }">
												${ rentalCar.renSub }</a></td>
												<td class="dateTd" style="text-align: center">${ rentalCar.memId } (${ rentalCar.memNo })</td>
												<td class="bookingTd" style="text-align: center">${ rentalCar.renCarName }</td>
												<td class="dateTd">
													<img src="/janditour/resources/upload-image/rentalcar-info/thumb_${ rentalCar.renPic}">
												</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							<div style="text-align:center;padding:20px">
							${ pager } 
							</div>
							<div style="text-align:right">
								<a href="write.action?boardNo=" class="btn buttonCustomPrimary" style="width:150px">글쓰기</a> &nbsp;&nbsp; 
							</div>
							
					</div>
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
	<jsp:include
		page="/WEB-INF/views/include/javascript/public-javascript.jsp">
		<jsp:param name="requestPage" value="public-js" />
	</jsp:include>
	
	<script type="text/javascript">
	$(function() { //jQuery의 main 함수
		$('#trnWriter').on('click', function(event) {
			<c:choose>
			<c:when test="${ empty loginuser }">
			alert('로그인 한 사용자만 글을 작성할 수 있습니다.');
			location.href = '/janditour';
			</c:when>
			<c:otherwise>
			location.href = '/janditour/travelnote_writer.action';
			</c:otherwise>
			</c:choose>
		});
	});
</script>
	
</body>

</html>

