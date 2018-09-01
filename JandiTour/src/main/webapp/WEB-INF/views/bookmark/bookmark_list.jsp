<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <!-- SITE TITTLE -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>잔디 투어 - 북마크</title>

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(function(){
		
		$('.recentActivitySection').css("display","none")
		$('#sectionTourist').css("display","block");
		if("${attachmentTou}".length==0 || "${attachmentTou}"=="[]"){
			$('#myModal1').modal();
		}
		
		$('#loginButton').on('click', function(event) {
			event.preventDefault();
			$('form#loginForm').submit();
			alert("환영합니다!");
		});
		
		$('#Stay').on('click',function(event){
			event.preventDefault();
			$('.recentActivitySection').css("display","none")
			$('#sectionStay').css("display","block");
		});
		$('#Food').on('click',function(event){
			event.preventDefault();
			$('.recentActivitySection').css("display","none")
			$('#sectionFood').css("display","block");
		});
		$('#Tourist').on('click',function(event){
			event.preventDefault();
			$('.recentActivitySection').css("display","none")
			$('#sectionTourist').css("display","block");
		});
		
		$('#Stay, #Tourist, #Food').on('click',function(event){
			if("${attachmentSta}".length==0 || "${attachmentSta}"=="[]"){
				$('#myModal1').modal();
			}
		});
		
		$('#bookMarkList1').on('click', "[id^=delete1]" ,function(event){
			event.preventDefault();
			var dataNo = $(this).attr("data-No");
			var data = $('#bookmark1'+dataNo).serialize();

			$.ajax({
				"url" : "bookMarkDelete.action",
				"method" : "POST",
				"data" : data,
				"success" : function(data, status, xhr){
					$('#myModalDelete').modal();
					$('#bookMarkList1 tr.rowItem[data-bookdiv='+dataNo+']').remove();
				},
				"error" : function(xhr, status, err){
					  alert("message:"+request.responseText);
				}
			});
		});
		
		$('#bookMarkList2').on('click', "[id^=delete2]" ,function(event){
			event.preventDefault();
			var dataNo = $(this).attr("data-No");
			var data = $('#bookmark2'+dataNo).serialize();
			
			$.ajax({
				"url" : "bookMarkDelete.action",
				"method" : "POST",
				"data" : data,
				"success" : function(data, status, xhr){
					$('#myModalDelete').modal();
					$('#bookMarkList2 tr.rowItem[data-bookdiv='+dataNo+']').remove();
				},
				"error" : function(xhr, status, err){
					  alert("message:"+request.responseText);
				}
			});
		});
		
		$('#bookMarkList3').on('click', "[id^=delete3]" ,function(event){
			event.preventDefault();
			var dataNo = $(this).attr("data-No");
			var data = $('#bookmark3'+dataNo).serialize();
			
			$.ajax({
				"url" : "bookMarkDelete.action",
				"method" : "POST",
				"data" : data,
				"success" : function(data, status, xhr){
					$('#myModalDelete').modal();
					$('#bookMarkList3 tr.rowItem[data-bookdiv='+dataNo+']').remove();
				},
				"error" : function(xhr, status, err){
					  alert("message:"+request.responseText);
				}
			});
		});
		
		$('#bookMarkList1').on('click',"[id=stay_atag]",function(event){
			event.preventDefault();
			 var dataNo = $(this).attr("data-No1");
			 var data = $('#bookmark1'+dataNo).serialize();
			$.ajax({
				"url": "bookMarkCheck.action",
				"data": data,
				"method":"post",
				"success": function(data, status, xhr){
					if(data =="successSta"){
						location.href="/janditour/stay_detail.action?staNo="+dataNo;
					}else if(data == "fail"){
						$('#myModaldata').modal();
					}
				},
				"error": function(xhr, status, err){
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
			});
		}); 
		
		$('#bookMarkList2').on('click',"[id=food_atag]",function(event){
			event.preventDefault();
			 var dataNo = $(this).attr("data-No1");
			 var data = $('#bookmark2'+dataNo).serialize();
			$.ajax({
				"url": "bookMarkCheck.action",
				"data": data,
				"method":"post",
				"success": function(data, status, xhr){
					if(data == "successFoo"){
						location.href="/janditour/food_detail.action?foodNo="+dataNo;
					}else if(data == "fail"){
						$('#myModaldata').modal();
					}
				},
				"error": function(xhr, status, err){
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
			});
		}); 
		
		$('#bookMarkList3').on('click',"[id=tourist_atag]",function(event){
			event.preventDefault();
			 var dataNo = $(this).attr("data-No1");
			 var data = $('#bookmark3'+dataNo).serialize();
			$.ajax({
				"url": "bookMarkCheck.action",
				"data": data,
				"method":"post",
				"success": function(data, status, xhr){
					if(data =="successTou"){
						location.href="/janditour/tourist/tourist_detail.action?touristno="+dataNo;
					}else if(data == "fail"){
						$('#myModaldata').modal();
					}
				},
				"error": function(xhr, status, err){
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
			});
		}); 
		
	});
</script>

  <!-- PLUGINS CSS STYLE & FONT & FAVICON -->
<jsp:include page="/WEB-INF/views/include/style/public-style.jsp">
	<jsp:param name="requestPage" value="public-style"/>
</jsp:include>

<body class="body-wrapper ">
  <div class="main-wrapper">
  
		<header>
			<jsp:include page="/WEB-INF/views/include/header.jsp">
			<jsp:param name="requestPage" value="public"/>
		</jsp:include>
		</header>
		
		<!-- /////////////////////////////////// -->
		<section class="pageTitle"
		style="background-image: url(/janditour/resources/img/pages/page-title-bg9.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="titleTable">
						<div class="titleTableInner">
							<div class="pageTitleInfo">
								<h1>북마크 정보</h1>
								<div class="under-border"></div>
								<br>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
		
<!-- RECENT OFFER SECTION -->
		<section class="bookingTypeSection ">
				<div class="container" >
					<div class="row ">
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
		</section>
		
		<!-- RECENT ACTIVITY SECTION -->
		<section class="recentActivitySection" id="sectionStay"> 
				<div class="container" >
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
		</section>
		<!-- ////////////////////////////////////////////////// -->
		<section class="recentActivitySection" id="sectionFood">
				<div class="container">
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
		</section>
		<!-- /////////////////////////////////////////////// -->
		<section class="recentActivitySection" id="sectionTourist">
				<div class="container">
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
		</section>
		
	<!-- bookmark Delete Modal -->
  	<div class="modal fade bookingModal modalBook" id="myModalDelete" tabindex="-1">
		<div class="modal-dialog" align="center">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">북마크가 삭제되었습니다.</h4>
				</div>
				<div class="modal-body">
						<button type="button" class="btn buttonCustomPrimary" data-dismiss="modal">닫기</button>
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
					<h4 class="modal-title">해당되는 북마크가 존재하지 않습니다.</h4>
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

<!-- INQUIRY MODAL -->
		<jsp:include page="/WEB-INF/views/include/inquiry.jsp">
			<jsp:param name="requestPage" value="inquiry"/>
		</jsp:include>
		
		<!-- Signup Modal -->
	<jsp:include page="/WEB-INF/views/include/member.jsp">
		<jsp:param name="requestPage" value="signup" />
	</jsp:include>

	<!-- Login Modal -->
	<jsp:include page="/WEB-INF/views/include/member.jsp">
		<jsp:param name="requestPage" value="login" />
	</jsp:include>
		
		<!-- FOOTER -->
		<footer>
			<jsp:include page="/WEB-INF/views/include/footer.jsp">
				<jsp:param name="requestPage" value="footer"/>
			</jsp:include>
		</footer>
	</div>

	<!-- JAVASCRIPTS -->
	<jsp:include page="/WEB-INF/views/include/javascript/public-javascript.jsp">
		<jsp:param name="requestPage" value="public-js"/>
	</jsp:include>
</body>
</html>

