<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>렌터카 후기 정보 게시물 목록</title>
<link rel="Stylesheet" href="/spring-janditour/resources/css/colors/default.css" />
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript">
	$(function() { //jQuery의 main 함수
		$('#write').on('click', function(event) {
			<c:choose>
				<c:when test="${ empty loginuser }">
				alert('로그인 한 사용자만 글을 작성할 수 있습니다.');
				location.href = '/janditour';
				</c:when>
				<c:otherwise>
				location.href = '/janditour/rentalcar/write.action';
				</c:otherwise>
			</c:choose>			
		});
	});
	</script>

</head>
<body>

	<%-- <jsp:include page="/WEB-INF/views/rentalcar/list.jsp" /> --%>

	<div id="pageContainer">
		<div style="padding-top: 25px; text-align: center">

			<input id="write" type="button" value="글쓰기"
				style="width: 300px; height: 25px" /> <br /> <br />

			<table border="1" align="center">
				<tr style="background-color: beige; height: 25px">
					<th style="width: 50px">번호</th>
					<th style="width: 300px">제목</th>
					<th style="width: 150px">작성자</th>
					<th style="width: 120px">차이름</th>
					<th style="width: 80px">사진</th>
				</tr>

				<%-- 서블릿에서 전달한 게시물 목록을 HTML로 표시 --%>
				<c:forEach var="rentalCar" items="${ rentalCarList }">
				<tr style='height: 25px'>
					<td>${ rentalCar.renNo }</td>
					<td style='text-align: left; padding-left: 10px'>
					&nbsp;&nbsp;
				  	<a href="detail.action?renNo=${ rentalCar.renNo }">${ rentalCar.renSub }</a> 
				   <td>${ rentalCar.memId } (${ rentalCar.memNo })</td>
				   <td>${ rentalCar.renCarName }</td>
				   <td>
				   	<img src="/janditour/resources/upload-image/rentalcar-info/thumb_${ rentalCar.renPic }">
				   </td>
				</tr>
				</c:forEach>

			</table>
			<br> <br> 

		</div>
		
	</div>
	${ pager }

</body>
</html>