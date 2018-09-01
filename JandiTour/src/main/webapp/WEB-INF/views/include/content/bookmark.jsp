<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<c:if test="${param.requestPage eq 'bookmark-public'}">
				<form action="/janditour/bookMark.action" method="post" id="bookmark">
					<input type="hidden" name="staNo" value="${stay.staNo}">
					<input type="hidden" name="staName" value="${stay.staName}">
					<input type="hidden" name="staAddress" value="${stay.staAddress}"> 
					<input type="hidden" name="staListCon" value="${stay.staListCon}">
					<input type="hidden"name="foodNo" value="${food.foodNo}"> 
					<input type="hidden"name="foodName" value="${food.foodName}"> 
					<input type="hidden" name="foodAddress" value="${food.foodAddress}">
					<input type="hidden" name="foodListContent" value="${food.foodListContent}">
					<input type="hidden" name="touNo" value="${tourist.touNo}">
					<input type="hidden" name="touName" value="${tourist.touName}"> 
					<input type="hidden" name="touAddress" value="${tourist.touAddress}">
					<input type="hidden" name="touListCon" value="${tourist.touListCon}">
					<input type="hidden" name="memNo" value="${loginuser.memNo}">
					<div class="col-sm-12">
					</div> 
				</form>

		</c:if>
		
		<!-- bookmark Modal -->
	 <div class="modal fade bookingModal modalBook" id="myModal" tabindex="-1">
		<div class="modal-dialog" align="center">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">북마크가 추가되었습니다.</h4>
				</div>
				<div class="modal-body">
						<button type="button" class="btn buttonCustomPrimary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div> 