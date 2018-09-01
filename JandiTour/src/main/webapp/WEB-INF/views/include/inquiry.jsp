<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:choose>
	<c:when test="${param.requestPage eq 'inquiry'
					or param.requestPage eq 'contact'}">
		<div class="modal fade bookingModal modalBook" id="inquiryModal"
			tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">1:1 문의</h4>
					</div>
					<div class="modal-body">
						<form action="/janditour/inquiry_write.action" method="post">
							<div class="form-group">
								<input type="text" class="form-control" id="inqName" name="inqName"
									placeholder="이름">
							</div>
							<div class="form-group">
								<input type="email" class="form-control" id="inqEmail" name="inqEmail"
									placeholder="이메일">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="inqPhone" name="inqPhone"
									placeholder="전화번호">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="inqTitle" name="inqTitle"
									placeholder="문의제목">
							</div>
							<div class="form-group">
								<textarea 
								class="form-control" rows="3" placeholder="문의내용" name="inqContent"></textarea>
							</div>
							<button type="submit" class="btn buttonCustomPrimary">문의하기</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<c:if test="${param.requestPage eq ''}">

						
		</c:if>
	</c:otherwise>
</c:choose>
