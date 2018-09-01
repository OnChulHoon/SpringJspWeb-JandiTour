<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<h3 class="reviewTitle">
	여행자의 리뷰&nbsp;&nbsp;&nbsp;&nbsp; <span id="avg"><b>${ average.average }.0</b></span>
	<span> <c:forEach begin="1" end="${ average.average }">
			<i class="fa fa-star" aria-hidden="true"></i>
		</c:forEach> <c:forEach begin="1" end="${ 5 - average.average }">
			<i class="fa fa-star-o" aria-hidden="true"></i>
		</c:forEach>

	</span>
</h3>
<div id="scrollbar" style="overflow: auto; width: 1000px;">
	<ul class="media-list">

		<c:forEach var="review" items="${ reviews }">
			<li class="media">
				<div class="media-left">
					<a id="reviewMod" href="#"> <img class="media-object"
						src="/janditour/resources/img/blog/f_image.jpg" alt="Image">
					</a>
				</div>

				<div id="reviewView${ review.reNo }" class="media-body">
					<h5 class="media-heading">${ review.memId }</h5>
					<span> <c:forEach begin="1" end="${ review.evaluation }">
							<i class="fa fa-star" aria-hidden="true"></i>
						</c:forEach> <c:forEach begin="1" end="${ 5 - review.evaluation }">
							<i class="fa fa-star-o" aria-hidden="true"></i>
						</c:forEach>
					</span>

					<div>${ review.reContent }
						<span id="re_btn" class="btn-wrap"
							style='display:${ loginuser.memId eq review.memId ? "block" : "none" }'>
							<input id="modal_reNo${ review.reNo }" type="hidden"
							value="${ review.reNo }"> <input id="modal_pageno"
							type="hidden" value="${ pageno }"> <input
							id="modal_touristno" type="hidden" value="${ tourist.touNo }">
							<input id="modal_content${ review.reNo }" type="hidden"
							value="${ review.reContent }"> <%-- <a id="edit" href="javascript:" class="button"
																				data-reviewno='${ review.reNo }'>수정</a> --%> <a
							id="updateModal${ review.reNo }" href="#"
							data-reviewno='${ review.reNo }'
							data-reviewcontent='${ review.reContent }'>수정</a>
							<a id="delete" href="javascript:" class="button"
							data-reviewno='${ review.reNo }' data-pageno='${ pageno }'>삭제</a>
						</span>
					</div>
				</div>
			</li>
		</c:forEach>

	</ul>
	<div id="addbtn" class="btn-wrap" align="center">
		<a href="javascript:" class="button">리뷰 더보기</a>
	</div>
</div>

