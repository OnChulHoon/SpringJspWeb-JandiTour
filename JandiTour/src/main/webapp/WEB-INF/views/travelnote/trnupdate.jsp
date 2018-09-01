<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- SITE TITTLE -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Shortcodes - Tabs&amp;Dropdowns - Star Travel</title>
<link rel="Stylesheet" href="/janditour/resources/css/colors/default.css" />
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(function() {
	$("#update").click(function(event) {
		event.preventDefault();
		$("#update_form").submit();
	});
});
</script>
<!-- PLUGINS CSS STYLE -->
<link href="resources/plugins/jquery-ui/jquery-ui.min.css"
	rel="stylesheet">
<link href="resources/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="resources/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="resources/plugins/selectbox/select_option1.css">
<link rel="stylesheet" type="text/css"
	href="resources/plugins/datepicker/datepicker.css">
<link rel="stylesheet" type="text/css"
	href="resources/plugins/isotope/jquery.fancybox.css">
<link rel="stylesheet" type="text/css"
	href="resources/plugins/isotope/isotope.css">
<!-- REVOLUTION SLIDER -->
<link rel="stylesheet"
	href="resources/plugins/revolution/css/settings.css">
<link rel="stylesheet"
	href="resources/plugins/revolution/css/layers.css">
<link rel="stylesheet"
	href="resources/plugins/revolution/css/navigation.css">
<!-- GOOGLE FONT -->
<link
	href='https://fonts.googleapis.com/css?family=Montserrat:400,600,700'
	rel='stylesheet' type='text/css'>
<!-- CUSTOM CSS -->
<link href="resources/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/colors/default.css"
	id="option_color">
<!-- FAVICON -->
<link rel="shortcut icon" type="image/png"
	href="resources/img/favicon.png" />
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body class="body-wrapper ">

<div class="main-wrapper">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
    <a class="navbar-brand" href="index.jsp"></a> </div>
  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav navbar-right">
      <c:if test="${not empty loginuser}">
      <li class="dropdown singleDrop active"> <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Admin</a>
        <ul class="dropdown-menu dropdown-menu-right">
          <li class=""><a href="/janditour/profileImgUpload.action?memNo=${loginuser.memNo}">마이페이지</a></li>
          <li class=""><a href="/janditour/modifyAccount.action?memNo=${loginuser.memNo}">회원정보수정</a></li>
        </ul>
      </li>
      </c:if>
    </ul>
  </div>
  <!-- HEADER -->
  <header>
  <jsp:include page="/WEB-INF/views/include/header.jsp">
  <jsp:param name="requestPage" value="public" />
  </jsp:include>
  </header>
  <!-- DASHBOARD MENU  -->
  <section class="dashboardMenu"> <nav class="navbar dashboradNav">
  <div class="container">
    <div class="dashboardNavRight">
      <ul class="NavRight">
        <li class="dropdown singleDrop"><a href="#" class=" "
								data-toggle="" role="button" aria-haspopup="true"
								aria-expanded="false"><i class="fa fa-bell"
									aria-hidden="true"></i> <span class="notifyNumber">2</span></a> </li>
        <c:if test="${not empty loginuser}">
        <li class="dropdown singleDrop"><a href=""
								class="dropdown-toggle" data-toggle="dropdown" role="button"
								aria-haspopup="true" aria-expanded="false"><img
									src="/janditour/resources/upload-image/member-info/${loginuser.memFile}" alt=""><i
									class="fa fa-angle-down" aria-hidden="true"></i></a>
          <ul class="dropdown-menu dropdownMenu">
            <li><a href="/janditour/profileImgUpload.action?memNo=${loginuser.memNo}">
              <h5>마이페이지</h5>
              </a></li>
            <li><a href="/janditour/modifyAccount.action?memNo=${loginuser.memNo}">
              <h5>회원정보수정</h5>
              </a></li>
            <li><a href="/janditour/logout.action">
              <h5>로그아웃</h5>
              </a></li>
          </ul>
        </li>
        </c:if>
      </ul>
    </div>
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span> </button>
    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav dashboardNavLeft">
        <c:if test="${not empty loginuser}">
        <li><a href="/janditour/profileImgUpload.action?memNo=${loginuser.memNo}"><i class="fa fa-user"
									aria-hidden="true"></i>마이페이지</a></li>
        <li><a href="/janditour/modifyAccount.action?memNo=${loginuser.memNo}"><i class="fa fa-cogs"
									aria-hidden="true"></i>회원정보수정</a></li>
        </c:if>
      </ul>
    </div>
    <!-- /.navbar-collapse -->
  </div>
  <!-- /.container -->
  </nav> </section> <br>
  <br>
  <br>
  <!--=============================================================================================================================->
  <!-- RECENT ACTIVITY SECTION -->
  <section class="recentActivitySection">
  <div class="container">
    <div class="row">
      <div class="col-xs-12 ">
        <div class="recentActivityContent bg-ash">
          <div class="dashboardPageTitle">
            <h2>여행기 수정 </h2>
          </div>
          <div class="table-responsive" data-pattern="priority-columns">
            <form id="update_form" style="margin:0 auto"
            	action="travelnote_update.action" method="post" enctype="multipart/form-data">
              <!--                          <form id="updateForm" action="travelnote_update.action" 
                         	method="post" enctype="multipart/form-data" style="margin:0 auto"> -->
              <input type="hidden" value="test"/>
              <input type="hidden" name="trnNo" value="${ travelNote.trnNo }">
              <input type="hidden" name="memNo" value="${ loginuser.memNo }">
              <table style="text-align: center;" class="table listingsTable">
                <tr>
                  <th width="600" height="15">여행기 타이틀 </th>
                  <th width="160">여행기 번호</th>
                  <th width="220">여행기 제목</th>
                  <th width="220">작성자</th>
                </tr>
                <tr>
                  <th rowspan="5"> <input type="file" name="travelnote_image" 
					  	style="color:slategray; border:1 solid silver; width: 300 height: 20;"></th>
                  <th height="22"><div align="center">${ travelNote.trnNo }</div></th>
                  <th><input type="text" name="trnTitle"  value="${ travelNote.trnTitle }"/></th>
                  <th>${ travelNote.memId } (${ travelNote.memNo })</th>
                </tr>
                <tr>
                  <th height="16">여행기 지역</th>
                  <th>여행기 시작일정</th>
                  <th>여행기 종료일정</th>
                </tr>
                <tr>
                  <th height="18">
                  	<input type="text" name="trnArea"  value="${ travelNote.trnArea }" style="width:95px" /></th>
                  <th> <fmt:formatDate value="${ travelNote.trnSt }" pattern="yyyy-MM-dd" var="trnSt"/>
                    <input type="text" name="trnSt" value="${ trnSt }"  style="width:120px" />
                  </th>
                  <th> <fmt:formatDate value="${ travelNote.trnEnd }" pattern="yyyy-MM-dd" var="trnEnd"/>
                    <input type="text" name="trnEnd"  value="${ trnEnd }" style="width:120px"/>
                  </th>
                </tr>
                <tr>
                  <th height="15" colspan="3">여행기 내용 </th>
                </tr>
                <tr>
                  <th height="507" colspan="3"> <textarea name="trnContent"
					   style=" width:600px; height:500px;">
					   ${travelNote.trnContent}</textarea>
                  </th>
                </tr>
              </table>
              <a id="update" href="#">글수정</a> &nbsp;&nbsp; <a href="/janditour/travelnote_list.action">취소</a>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  </section>
  <!-- FOOTER -->
  <footer>
  <jsp:include page="/WEB-INF/views/include/footer.jsp">
  <jsp:param name="requestPage" value="footer" />
  </jsp:include>
  </footer> </div>
<!-- Signup Modal -->
<jsp:include page="/WEB-INF/views/include/member.jsp">
<jsp:param name="requestPage" value="signup" />
</jsp:include>
<!-- Login Modal -->
<jsp:include page="/WEB-INF/views/include/member.jsp">
<jsp:param name="requestPage" value="login" />
</jsp:include>
<!-- JAVASCRIPTS -->
<jsp:include page="/WEB-INF/views/include/javascript/public-javascript.jsp">
<jsp:param name="requestPage" value="public-js" />
</jsp:include>
</body>
</html>
