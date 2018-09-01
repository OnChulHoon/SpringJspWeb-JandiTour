<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${param.requestPage eq 'food-list'}">

	<section class="pageTitle"
		style="background-image: url(/janditour/resources/img/pages/page-title-bg9.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="titleTable">
						<div class="titleTableInner">
							<div class="pageTitleInfo">
								<h1>지역 맛집 정보</h1>
								<div class="under-border"></div>
								<br>
								<c:if test="${not empty loginuser and loginuser.memDiv eq '1'}">
									<div align="center">
										<a id="writeBtn" href="/janditour/food_write.action"
											class="btn buttonTransparent">맛집 정보 등록</a>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</c:if>

<c:if test="${param.requestPage eq 'food-write'}">

	<section class="pageTitle"
		style="background-image: url(/janditour/resources/img/pages/page-title-bg5.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="titleTable">
						<div class="titleTableInner">
							<div class="pageTitleInfo">
								<h1>맛집 정보 등록</h1>
								<div class="under-border"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
</c:if>

<c:if test="${param.requestPage eq 'food-detail'}">

	<section class="pageTitle"
		style="background-image: url(/janditour/resources/img/pages/page-title-bg13.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="titleTable">
						<div class="titleTableInner">
							<div class="pageTitleInfo">
								<h1>${food.foodName}</h1>
								<p>${food.foodListContent}</p>
								<c:if test="${not empty loginuser and loginuser.memDiv eq '1'}">
									<div align="center">
										<a id="updateBtn"
											href="/janditour/food_update.action?foodNo=${food.foodNo}"
											class="btn buttonTransparent">정보 수정</a> &nbsp;&nbsp;
											<a id="deleteMod" class="btn buttonTransparent"
											data-toggle="modal" data-target="#deleteModal">삭제</a>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</c:if>

<c:if test="${param.requestPage eq 'food-update'}">

	<section class="pageTitle"
		style="background-image: url(/janditour/resources/img/pages/page-title-bg5.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="titleTable">
						<div class="titleTableInner">
							<div class="pageTitleInfo">
								<h1>맛집 정보 수정</h1>
								<div class="under-border"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
</c:if>