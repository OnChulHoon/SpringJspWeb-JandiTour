<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>

	<div id="pageContainer">

		<%-- <jsp:include page="/WEB-INF/views/rentalcar/detail.jsp" /> --%>

		<div style="padding-top: 25px; text-align: center">
			<div id="inputcontent">
				<div id="inputmain">
					<div class="inputsubtitle">게시판 글 내용</div>
					<table border="1" width="700" align="center">
						<tr>
							<th>제목</th>
							<%-- title은 property : getTitle()로 해석 --%>
							<td>${ rentalCar.renSub }</td>
						</tr>
						<tr>
							<th>작성자</th>
							<%-- requestScope를 명시하지 않아도 requestScope에서 검색 --%>
							<td>${ rentalCar.memId } (${ rentalCar.memNo })</td>
						</tr>
						<tr>
							<th>차이름</th>
							<td>${ rentalCar.renCarName }</td>
						</tr>
						
						<tr>
							<th>내용</th>
							<td>${ rentalCar.renCon }</td>
						</tr>
					    <tr>
							<th>사진</th>
							<td>
								<img src="/janditour/resources/upload-image/rentalcar-info/${ rentalCar.renPic }">
							</td>
						</tr>
					
						
					</table>
					
				</div>
			</div>

		</div>
	</div>

</body>
</html>