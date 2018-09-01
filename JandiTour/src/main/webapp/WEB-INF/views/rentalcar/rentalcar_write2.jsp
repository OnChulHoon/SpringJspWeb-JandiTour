<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<%-- <jsp:include page="/WEB-INF/views/rentalcar/write.jsp" /> --%>
<form action="write.action" method="post" enctype="multipart/form-data">
	<table width="400" border="1" cellspacing="0" cellpadding="0" align="center">
	  <tr>
	   <td align="right">파일첨부</td>
	   <td align="left" style="padding-left: 20; padding-right: 30">
	     <input type="file" name="car_image" style="color:slategray;
	       border:1 solid silver; width: 200 height: 20;">
	  (최대 4M)</td>
	  </tr> 
		<tr>
			<th>제목</th>
			<td><input type="text" name="renSub" style="width: 280px" /></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
				<!-- hidden : 존재하지만 사용자에게 보이지 않는 요소 --> 
				<input type="hidden"
				name="memNo" value="${ loginuser.memNo }"> ${ loginuser.memNo }
			</td>
		</tr>
		<tr>
			<th>차이름</th>
			<td><input type="text" name="renCarName" style="width: 280px" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="renCon" cols="76" rows="15"></textarea></td>
		</tr>
	</table>
	<div class="buttons">
	<a href="detail.action?renNo=">수정</a> &nbsp;&nbsp;
	<input type="submit" value="글삭제"> &nbsp;&nbsp;
		<input type="submit" value="글쓰기"> &nbsp;&nbsp; 
		<input type="button" onclick="history.back()" value="목록보기">
	</div>
</form>
</body>
</html>