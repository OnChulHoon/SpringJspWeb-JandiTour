<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="Stylesheet"
	href="/spring-janditour/resources/styles/default.css" />
<link rel="Stylesheet"
	href="/spring-janditour/resources/styles/input2.css" />
<style type="text/css">
a {
	text-decoration: none
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
	//$(document).ready(function() {
	$(function() {
		$('a#write').on('click', function(event) {//id가 write인 a를 클릭하면
			event.preventDefault();//a 태그의 기본 기능(이동)을 수행하지 마세요
			$('form#replyform').submit();//id가 replyform인 form을 submit
		});
	});
</script>
</head>
<body>
	<div id="pageContainer">

		<%-- <jsp:include page="/WEB-INF/views/rentalcar/reply.jsp" /> --%>

		<div style="padding-top: 25px; text-align: center">
			<div id="inputcontent">
				<div id="inputmain">
					<div class="inputsubtitle">게시판 글 쓰기</div>
					<form id="replyform" action="reply.action" method="post">
						<input type="hidden" name="boardNo" value="${ board.boardNo }">
						<input type="hidden" name="pageno" value='${ pageno }'>
						<table>
							<tr>
								<th>제목</th>
								<td><input type="text" name="title" style="width: 280px"
									value="[RE] ${ board.title }" /></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td><input type="hidden" name="writer"
									value="${ loginuser.memberId }"> ${ loginuser.memberId }
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="content" cols="76" rows="15">

===================================
${ board.content }
		                    </textarea></td>
							</tr>
						</table>
						<div class="buttons">
							<a id="write" href="#">댓글쓰기</a> &nbsp;&nbsp; <a
								href="detail.action?boardno=${ board.boardNo }&pageno=${ pageno }">취소</a>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>

</body>
</html>