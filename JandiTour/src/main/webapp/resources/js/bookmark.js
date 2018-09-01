/**
 * bookmark.jsp의 스크립트 소스파일
 * id=bookmarkbtn에 event가 걸려있음.
 */

$(function(){

$('#bookmarkbtn').on('click', function(event){
			event.preventDefault();
			var data = $('#bookmark').serialize();
			$.ajax({
				"url" :"bookMark.action",
				"method" :"post",
				"data" :data,
				"success" :function(data, status, xhr){
					$('#myModal').modal();
					},
				"error" :function(request,status,error){
					alert("북마크 실패");
					//alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
			});

		});	
});
