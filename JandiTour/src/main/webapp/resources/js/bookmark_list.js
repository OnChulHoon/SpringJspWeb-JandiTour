$(function(){

	$('.recentActivitySection').css("display","none")
	$('#sectionTourist').css("display","block");
	if("${attachmentTou}".length==0 || "${attachmentTou}"=="[]"){
		$('#myModal1').modal();
	}
	
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
	
	$('#Stay').on('click',function(event){
		if("${attachmentSta}".length==0 || "${attachmentSta}"=="[]"){
			$('#myModal1').modal();
		}
	});
	$('#Tourist').on('click',function(event){
		if("${attachmentTou}".length==0 || "${attachmentTou}"=="[]"){
			$('#myModal1').modal();
		}
	});
	$('#Food').on('click',function(event){
		if("${attachmentFoo}".length==0 || "${attachmentFoo}"=="[]"){
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
				alert("북마크가 삭제 되었습니다.");
				$('tr.rowItem[data-bookdiv='+dataNo+']').remove();
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
				alert("북마크가 삭제 되었습니다.");
				$('tr.rowItem[data-bookdiv='+dataNo+']').remove();
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
				alert("북마크가 삭제 되었습니다.");
				$('tr.rowItem[data-bookdiv='+dataNo+']').remove();
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
					location.href="/janditour/tourist/tourist_detail.action?touNo="+dataNo;
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