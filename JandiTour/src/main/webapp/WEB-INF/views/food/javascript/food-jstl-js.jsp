<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
$(function() {

	
/* -----datail--------------------------------------------------------------------------------------------------  */	


	$("#write-review").on("click", function(event) {
		event.preventDefault();
		<c:choose>
			<c:when test="${ empty loginuser }">
				/* alert("로그인 하신 후에 이용가능합니다."); */
				$("#loginCheckModal").modal("show");
			</c:when>
		<c:otherwise>		

		var content = $("#food-review-form textarea").val();
	
		if (content.length == 0) {
			alert("내용을 입력해주세요.");
			return;
		}
	
		var data = $("#food-review-form").serialize();
	
		$.ajax({
			"url" : "food_review_write.action",
			"method" : "post",
			"data" : data,
			"success" : function(data, status, xhr) {
				$("#food-review-form textarea").val(""); //기존에 작성된 입력내용 제거
				//alert("댓글 등록 성공");
				
				var reviewPageNo = $("#review-pageno").val();
				
				var foodNo = $("#food-review-form input[name=foodNo]").val();
				
				$("div.reviewMedia").load(
						"find_food_review.action?foodNo=" + foodNo + "&reviewPageNo=" + reviewPageNo);
	
			},
			"error" : function(xhr, status, err) {
				alert("댓글 등록 실패");
			}
			});
		</c:otherwise>
		</c:choose>
	});
	$("div#reviewMedia").on("click", "#addbtn a", function(event) {
		moreList();
	});
	
	function moreList() {
		var reviewPageNo = $("#review-pageno");
		reviewPageNo.val(parseInt(reviewPageNo.val()) + 1);
		var foodNo = $("#food-review-form input[name=foodNo]").val();

		$("div.reviewMedia").load(
			"find_food_review.action?foodNo=" + foodNo + "&reviewPageNo=" + reviewPageNo.val());
	 }
	
	/* Review Modify */
	
	$('div#modalDiv')
				.on(
						'click',
						'#update',
						function(event) {
							var content = $('#tx_content').val();
							if (content.length == 0) {
								alert('내용을 입력하세요');
								return;
							} else {
								var yes = confirm("수정하시겠습니까?");
								if (!yes) {
									return;
								}
							}
							var num = $("#reNo").val();
							var data = $("#updateform" + num).serialize();

							$
									.ajax({
										"url" : "modify_food_review.action",
										"method" : "POST",
										"data" : data,
										"success" : function(data, status, xhr) {
											alert("수정 완료");
											close_modal();
											$("#food-review-form textarea")
													.val("");
											var reviewPageNo = $("#review-pageno");
											var foodNo = $(
													'#food-review-form input[name=foodNo]')
													.val();
											$("div#reviewMedia").load(
													"find_food_review.action?foodNo="
															+ foodNo + "&reviewPageNo=" + reviewPageNo.val());
										},
										"error" : function(xhr, status, data) {
											alert("등록 실패");
										}
									});

						});

		$('div#reviewMedia')
				.on(
						'click',
						'#delete',
						function(event) {
							var yes = confirm("삭제하시겠습니까?");
							if (!yes) {
								return;
							}

							var reNo = $(this).attr('data-reviewno');

							$
									.ajax({
										"url" : "delete_food_review.action",
										"method" : "POST",
										"data" : "reNo=" + reNo,
										"success" : function(data, status, xhr) {
											alert("삭제 완료");
											$("#food-review-form textarea")
													.val("");
											var reviewPageNo = $("#review-pageno");
											var foodNo = $(
													'#food-review-form input[name=foodNo]')
													.val();
											$("div#reviewMedia").load(
													"find_food_review.action?foodNo="
													+ foodNo + "&reviewPageNo=" + reviewPageNo.val());
										},
										"error" : function(xhr, status, data) {
											alert("삭제 실패");
										}
									});
						});

		$("div#reviewMedia").on(
				'click',
				'a[id^=updateModal]',
				function(event) {
					event.preventDefault();
					open_modal($(this).attr('data-reviewno'), $(this).attr(
							'data-reviewcontent'));
				});
	
	function open_modal(reviewNo, reviewContent) {
		$("#tx_content").val(reviewContent);
		$("#reNo").val(reviewNo);
		$("#updateform").attr("id", "updateform" + reviewNo);
		$('#updateReviewModal').modal('show');
	}

	function close_modal() {
		$("#updateReviewModal").modal('hide');
	}

	
/* -----write & update--------------------------------------------------------------------------------------------  */	


	$('#imageCreate').on('click', function(event) {
		event.preventDefault();
		event.stopPropagation();
		var btn = $("<div class=\"form-group\"><input type=\"file\" class=\"form-control\" id=\"file\" name=\"foodImage\"></div>");
		$('#file-list').append(btn);
	});

	var select = $("select[name=citName]");
	var group = select.attr("data-select");
	select.find("option").each(function(idx, option) {
		if ($(this).text() == group) {
			$(this).attr("selected", "selected");
		}
	});

	$("a#cancel").on("click", function(event) {
		history.back();
	});

	
/* -----list-----------------------------------------------------------------------------------------------------  */	
	
	
	$("#searchBtn").on("click", function(event) {
		var area = $("#area").val();
		var area2 = $("#area2").val();
		var foodName = $("#foodName").val();
		
		if(area == "" && area2 == "" && foodName == "") {
			//alert("검색할 지역이나 맛집을 선택/입력하세요.");
			$("#searchCheckModal").modal("show");
			return;
		}
		
		location.href = "/janditour/food_list.action?area=" 
				+ encodeURI(area)
				+ "&area2=" 
				+ encodeURI(area2)
				+ "&foodName="
				+ encodeURI(foodName);
	});
	
	$(window).scroll(function() { 
		
		var scrollTop = $(window).scrollTop();
		
		if (scrollTop > 1000) { 
			return;
		}
		
		var newTop = scrollTop > newTop ? newTop + "px" : scrollTop + "px";
					
		$("#food-search").animate(
					{ top: newTop },
					{ queue: false, duration: 350 });
	});


/* -----login-check-----------------------------------------------------------------------------------------------------  */		

 
	$("#bookmarkbtn1").on("click", function(event) {
		event.preventDefault();
		$("#loginCheckModal").modal("show");
	});

	$("#confirm").on("click", function(event) {
		event.preventDefault();
		$("#login").modal("show");
	});

/* -----Naver Map-----------------------------------------------------------------------------------------------------  */


	var map = new naver.maps.Map('map');
	var myaddress = '${ food.foodAddress }';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
	naver.maps.Service
			.geocode(
					{
						address : myaddress
					},
					function(status,
							response) {
						if (status !== naver.maps.Service.Status.OK) {
							return alert(myaddress
									+ '의 검색 결과가 없거나 기타 네트워크 에러');
						}
						var result = response.result;
						// 검색 결과 갯수: result.total
						// 첫번째 결과 결과 주소: result.items[0].address
						// 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
						var myaddr = new naver.maps.Point(
								result.items[0].point.x,
								result.items[0].point.y);
						map
								.setCenter(myaddr); // 검색된 좌표로 지도 이동
						// 마커 표시
						var marker = new naver.maps.Marker(
								{
									position : myaddr,
									map : map
								});
						// 마커 클릭 이벤트 처리
						naver.maps.Event
								.addListener(
										marker,
										"click",
										function(
												e) {
											if (infowindow
													.getMap()) {
												infowindow
														.close();
											} else {
												infowindow
														.open(
																map,
																marker);
											}
										});
						// 마크 클릭시 인포윈도우 오픈
						var infowindow = new naver.maps.InfoWindow(
								{
									content : '<h4> [네이버 개발자센터]</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
								});
					});
	
	
/* -----Main End-----------------------------------------------------------------------------------------------------  */	

});
</script>
