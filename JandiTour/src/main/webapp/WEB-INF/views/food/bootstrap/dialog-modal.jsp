<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:if test="${param.requestPage eq 'delete-food'}">

	<div class="modal fade bookingModal modalBook" id="deleteModal"
		tabindex="-1">
		<div class="modal-dialog" align="center">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title"><br>[${food.foodName}]<br><br>정보를 삭제하시겠습니까?</h4>
				</div>
				<div class="modal-body">
					<a href="/janditour/food_delete.action?foodNo=${food.foodNo}"
						class="btn buttonCustomPrimary">삭제</a>&nbsp;&nbsp;&nbsp;
					<a class="btn buttonCustomPrimary" data-dismiss="modal"
						aria-hidden="true">취소</a>
				</div>
			</div>
		</div>
	</div>

</c:if>

 
<c:if test="${param.requestPage eq 'login-check-food'}">

	<div class="modal fade bookingModal modalBook" id="loginCheckModal"
		tabindex="-1">
		<div class="modal-dialog" align="center">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">먼저 로그인을 하시고 이용해주세요.</h4>
				</div>
				<div class="modal-body">
					<form action="">
						<a id="confirm" class="btn buttonCustomPrimary" data-dismiss="modal"
							aria-hidden="true">확인</a>
					</form>	
				</div>
			</div>
		</div>
	</div>

</c:if>

<c:if test="${param.requestPage eq 'search-check-food'}">

	<div class="modal fade bookingModal modalBook" id="searchCheckModal"
		tabindex="-1">
		<div class="modal-dialog" align="center">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">검색할 지역이나 맛집명을<br>선택 또는 입력해주세요.</h4>
				</div>
				<div class="modal-body">
					<form action="">
						<a id="search-confirm" class="btn buttonCustomPrimary" data-dismiss="modal"
							aria-hidden="true">확인</a>
					</form>	
				</div>
			</div>
		</div>
	</div>

</c:if>

<c:if test="${param.requestPage eq 'review-insert-food'}">

	<div class="modal fade bookingModal modalBook" id="insertReviewModal"
		tabindex="-1">
		<div class="modal-dialog" align="center">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">리뷰가 등록되었습니다.</h4>
				</div>
				<div class="modal-body">
					<form action="">
						<a id="review-confirm" class="btn buttonCustomPrimary" data-dismiss="modal"
							aria-hidden="true">확인</a>
					</form>	
				</div>
			</div>
		</div>
	</div>
	
</c:if>