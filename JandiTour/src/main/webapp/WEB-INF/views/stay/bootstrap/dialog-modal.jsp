<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:if test="${param.requestPage eq 'delete-stay'}">

	<div class="modal fade bookingModal modalBook" id="deleteModal"
		tabindex="-1">
		<div class="modal-dialog" align="center">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title"><br>[${stay.staName}]<br><br>정보를 삭제하시겠습니까?</h4>
				</div>
				<div class="modal-body">
					<a href="/janditour/stay_delete.action?staNo=${stay.staNo}"
						class="btn buttonCustomPrimary">삭제</a>&nbsp;&nbsp;&nbsp;
					<a class="btn buttonCustomPrimary" data-dismiss="modal"
						aria-hidden="true">취소</a>
				</div>
			</div>
		</div>
	</div>

</c:if>

 
<c:if test="${param.requestPage eq 'login-check-stay'}">

	<div class="modal fade bookingModal modalBook" id="loginCheckModal"
		tabindex="-1">
		<div class="modal-dialog" align="center">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">로그인 하신 후에 이용해주세요.</h4>
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