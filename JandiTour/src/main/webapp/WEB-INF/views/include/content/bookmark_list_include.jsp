<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

				<div class="container" >
					<div class="row">
						<div class="col-xs-12">
							<div class="bookingType bg-ash packagesFilter">
								<ul class="bookingList">
									<li><button id="Tourist" class="btn buttonTransparent">관광지 북마크</button></li>
									<li><button id="Food" class="btn buttonTransparent">맛집 북마크</button></li>
									<li><button id="Stay" class="btn buttonTransparent">숙소 북마크</button></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
		<!-- RECENT ACTIVITY SECTION -->
				<div class="container" id="sectionStay">
					<div class="row">
						<div class="col-xs-12 ">
							<div class="recentActivityContent bg-ash packagesFilter" id="bookMarkList1">
								<div class="dashboardPageTitle">
									<h2>숙소 북마크</h2>
								</div>
								<div class="table-responsive" data-pattern="priority-columns">
								
									<table class="table listingsTable">
										<tbody>
										<c:forEach var="attach" items="${attachmentSta}">
											<tr class="rowItem" data-bookdiv="${attach.bookDiv}">
												<td class="iconTd">
													<div class="icon br-orange">
														<i class="fa fa-fort-awesome" aria-hidden="true"></i>
													</div>
												</td>
												<td class="packageTd">
													<ul class="list-inline listingsInfo">
														<li>
															<h4>
																<a id="stay_atag" data-No1="${attach.bookDiv}" href="/janditour/bookMarkCheck.action">${attach.bookName}</a>
															</h4>
														</li>
													</ul>
												</td>
												<td class="packageTd">
													<ul class="list-inline listingsInfo text-right">
														<li>
															<h5>${attach.bookListCon}</h5>
														</li>
													</ul>
												</td> 
												<td class="bookingTd">
													<ul class="list-inline listingsInfo text-left">
														<li>
															${attach.bookAddress} 
														</li>
													</ul>
												</td>
												<td class="dataTd" >
													<form  id="bookmark1${attach.bookDiv}">
														<input type="hidden" name="staNo" value="${attach.bookDiv}">
														<input type="hidden" name="touNo">
														<input type="hidden" name="foodNo">
														<input type="hidden" name="memNo" value="${loginuser.memNo}">
													</form>
													<button id="delete1${attach.bookDiv}" data-No="${attach.bookDiv}" class="btn buttonTransparen">삭제</button>
												</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
		<!-- ////////////////////////////////////////////////// -->
				<div class="container" id="sectionFood">
					<div class="row">
						<div class="col-xs-12 ">
							<div class="recentActivityContent bg-ash packagesFilter" id="bookMarkList2">
								<div class="dashboardPageTitle">
									<h2>맛집 북마크</h2>
								</div>
								<div class="table-responsive" data-pattern="priority-columns">
								
									<table class="table listingsTable">
										<tbody>
										<c:forEach var="attach" items="${attachmentFoo}">
											<tr class="rowItem" >
												<td class="iconTd">
													<div class="icon br-orange">
														<i class="fa fa-fort-awesome" aria-hidden="true"></i>
													</div>
												</td>
												<td class="packageTd">
													<ul class="list-inline listingsInfo">
														<li>
															<h4>
																<a id="food_atag" data-No1="${attach.bookDiv}" href="/janditour/bookMarkCheck.action">${attach.bookName}</a>															
															</h4> 
														</li>
													</ul>
												</td>
												<td class="packageTd">
													<ul class="list-inline listingsInfo text-right">
														<li>
															<p>${attach.bookListCon} </p>
														</li>
													</ul>
												</td> 
												<td class="bookingTd">
													<ul class="list-inline listingsInfo text-left">
														<li>
															${attach.bookAddress} 
														</li>
													</ul>
												</td>
												<td class="dataTd">
													<form id="bookmark2${attach.bookDiv}">
														<input type="hidden" name="staNo">
														<input type="hidden" name="touNo">
														<input type="hidden" name="foodNo" value="${attach.bookDiv}">
														<input type="hidden" name="memNo" value="${loginuser.memNo}">
														<button id="delete2${attach.bookDiv}" data-No="${attach.bookDiv}" class="btn buttonTransparen">삭제</button>
													</form>
												</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
				</div>
			</div>
		<!-- /////////////////////////////////////////////// -->
				<div class="container" id="sectionTourist">
					<div class="row">
						<div class="col-xs-12 ">
							<div class="recentActivityContent bg-ash packagesFilter" id="bookMarkList3">
								<div class="dashboardPageTitle">
									<h2>관광지 북마크</h2>
								</div>
								<div class="table-responsive" data-pattern="priority-columns">
								
									<table class="table listingsTable">
										<tbody>
										<c:forEach var="attach" items="${attachmentTou}">
											<tr class="rowItem">
												<td class="iconTd">
													<div class="icon br-orange">
														<i class="fa fa-fort-awesome" aria-hidden="true"></i>
													</div>
												</td>
												<td class="packageTd">
													<ul class="list-inline listingsInfo">
														<li>
															<h4>
																<a id="tourist_atag" data-No1="${attach.bookDiv}" href="/janditour/bookMarkCheck.action">${attach.bookName} </a>
															</h4>
														</li>
													</ul>
												</td>
												<td class="packageTd">
													<ul class="list-inline listingsInfo text-right">
														<li>
															<p>${attach.bookListCon} </p>
														</li>
													</ul>
												</td> 
												<td class="bookingTd">
													<ul class="list-inline listingsInfo text-left">
														<li>
															${attach.bookAddress} 
														</li>
													</ul>
												</td>
												<td class="dataTd">
													<form id="bookmark3${attach.bookDiv}">
														<input type="hidden" name="staNo">
														<input type="hidden" name="touNo" value="${attach.bookDiv}">
														<input type="hidden" name="foodNo">
														<input type="hidden" name="memNo" value="${loginuser.memNo}">
														<button id="delete3${attach.bookDiv}" data-No="${attach.bookDiv}" class="btn buttonTransparen">삭제</button>
													</form>
												</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
					</div>
				</div>
			</div>

 <!-- bookmark Modal -->
  	<div class="modal fade bookingModal modalBook" id="myModal1" tabindex="-1">
		<div class="modal-dialog" align="center">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">해당 북마크가 존재하지 않습니다.</h4>
				</div>
				<div class="modal-body">
						<button type="button" class="btn buttonCustomPrimary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
  <!-- 데이터 수정, 삭제 알림 모달 -->
	<div class="modal fade bookingModal modalBook" id="myModaldata" tabindex="-1">
		<div class="modal-dialog" align="center">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">해당 여행정보가 변경되어 찾을 수 없습니다.</h4><br>
					<h4 class="modal-title">여행정보를 다시 검색해 주세요.</h4>
				</div>
				<div class="modal-body">
						<button type="button" class="btn buttonCustomPrimary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>