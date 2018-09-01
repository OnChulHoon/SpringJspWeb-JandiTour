<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
$(function() {
	
/* -----datail--------------------------------------------------------------------------------------------------  */	
	
	$('#writereview').on(
			'click',
			function(event) {
				event.preventDefault();

				<c:choose>
				<c:when test="${ empty loginuser }">
				//alert('로그인 한 사용자만 리뷰를 작성할 수 있습니다.');
				$("#loginCheckModal").modal('show');
				</c:when>
				<c:otherwise>
				//$('#reviewform').submit();
				var content = $('#reviewform textarea').val();

				if (content.length == 0) {
					alert('내용을 입력하세요');
					return;
				}

				var data = $("#reviewform").serialize();

				$.ajax({

					"url" : "stay_review.action",
					"method" : "post",
					"data" : data,
					"success" : function(data, status, xhr) {
						alert("등록 성공");
						$("#updateReviewModal").modal("hide");
						$("#reviewform textarea").val(""); //기존에 작성된 입력내용 제거
					
						var pageno = $("#review-pageno");
						var staNo = $("#reviewform input[name=staNo]").val();
						
						$("div.reviewMedia").load(
								"findreviews.action?staNo=" + staNo + "&pageNo="+pageno.val());

					},
					"error" : function(xhr, status, err) {
						alert("등록 실패");
					}

				});
				
				</c:otherwise>
				</c:choose>
			});
	
	$('div#reviewMedia').on('click',' #addbtn a',function(event){
		moreList();
	});
	

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
									"url" : "update_review.action",
									"method" : "POST",
									"data" : data,
									"success" : function(data, status, xhr) {
										alert("수정 완료");
										close_modal();
										$("#reviewform textarea").val("");
										var re_pageno = $("#review-pageno");
										var staNo = $("#reviewform input[name=staNo]").val();
										$("div#reviewMedia").load(
												"findreviews.action?staNo=" + staNo + "&pageNo="+ re_pageno.val());
												
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
							"url" : "delete_review.action",
							"method" : "POST",
							"data" : "reNo=" + reNo,
							"success" : function(data, status, xhr) {
								alert("삭제 완료");
								$("#reviewform textarea").val("");
								
								var re_pageno = $("#review-pageno");
								var staNo = $('#reviewform input[name=staNo]').val();
								
								$("div#reviewMedia").load(
										"findreviews.action?staNo=" + staNo + "&pageNo="+ re_pageno.val());
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

function moreList(){

	var pageno = $("#review-pageno");
	pageno.val(parseInt(pageno.val()) + 1);
	var staNo = $("#reviewform input[name=staNo]").val();
	
	$("div.reviewMedia").load(
			"findreviews.action?staNo=" + staNo + "&pageno="+pageno.val());
	
}

function open_modal(reviewNo, reviewContent) {
	$("#tx_content").val(reviewContent);
	$("#reNo").val(reviewNo);
	$("#updateform").attr("id", "updateform" + reviewNo);
	$('#updateReviewModal').modal('show');
}
function close_modal() {
	$("#updateReviewModal").modal('hide');
}

/* login-check */
$("#bookmarkbtn1").on("click", function(event) {
	event.preventDefault();
	$("#loginCheckModal").modal("show");
});

$("#confirm").on("click", function(event) {
	event.preventDefault();
	$("#login").modal("show");
});

	
/* -----write & update--------------------------------------------------------------------------------------------  */	
});
</script>
