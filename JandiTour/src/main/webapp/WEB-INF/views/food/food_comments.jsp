<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<h3 class="reviewTitle">
	맛집 리뷰&nbsp;&nbsp;&nbsp;&nbsp; <span id="avg"><b>${ average.average }.0</b></span>
	<span> <c:forEach begin="1" end="${ average.average }">
			<i class="fa fa-star" aria-hidden="true"></i>
		</c:forEach> <c:forEach begin="1" end="${ 5 - average.average }">
			<i class="fa fa-star-o" aria-hidden="true"></i>
		</c:forEach>

	</span>
</h3>

<ul class="media-list">

	<c:forEach var="review" items="${ reviews }">
		<li class="media">
			<div class="media-left">
				<a href="#"> <img class="media-object"
					src="/janditour/resources/img/blog/comments-03.jpg" alt="Image">
				</a>
			</div>
			<div class="media-body">
				<h5 class="media-heading">${ review.memId }</h5>
				<span> <c:forEach begin="1" end="${ review.evaluation }">
						<i class="fa fa-star" aria-hidden="true"></i>
					</c:forEach> <c:forEach begin="1" end="${ 5 - review.evaluation }">
						<i class="fa fa-star-o" aria-hidden="true"></i>
					</c:forEach>

				</span>
				<p>${ review.reContent }</p>
			</div>
		</li>
	</c:forEach>

</ul>
<div id="addbtn" class="btn-wrap"> <a href="javascript:" class="button">더보기</a> </div>


