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
	$(function() { //jQuery의 main 함수
		$('#update').on('click', function(event) {
			<c:choose>
				<c:when test="${ empty loginuser }">
				alert('로그인 한 사용자만 글을 작성할 수 있습니다.');
				location.href = '/janditour';
				</c:when>
				<c:otherwise>
				location.href = '/janditour/travelnote_update.action?trnNo=${travelNote.trnNo}';
				</c:otherwise>
			</c:choose>			
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
  </div>
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
            <h2>여행기 보기 </h2>
          </div>
          <div class="table-responsive" data-pattern="priority-columns">
            <form id="update" action="travelnote_update.action" 
                         	method="post" enctype="multipart/form-data" style="margin:0 auto">
              <input type="hidden" value="test"/>
              <input type="hidden" name="memNo" value="${ loginuser.memNo }">
              <table class="table listingsTable">
                <tr style="background-color:white; ">
                  <th width="600" height="15"><div align="center"><b>여행기 타이틀</b></div></th>
                  <th width="160"><div align="center"><b>여행기 번호</b></div></th>
                  <th width="220"><div align="center"><b>여행기 제목</b></div></th>
                  <th width="220"><div align="center"><b>작성자</b></div></th>
                </tr>
                <tr  style="background-color:white">
                  <th rowspan="5"> <div align="center"><img src="/janditour/resources/upload-image/travelnote-info/${travelNote.trnPic}" style="width:400px;height:600px"></div></th>
                  <th height="22"><div align="center">${ travelNote.trnNo }</div></th>
                  <th><div align="center">${ travelNote.trnTitle }</div></th>
                  <th><div align="center">${ travelNote.memId } (${ travelNote.memNo })</div></th>
                </tr>
                <tr  style="background-color:white">
                  <th height="16"><div align="center"><b>여행기 지역</b></div></th>
                  <th><div align="center"><b>여행기 시작일정</b></div></th>
                  <th><div align="center"><b>여행기 종료일정</b></div></th>
                </tr>
                <tr  style="background-color:white">
                  <th height="18"><div align="center">${ travelNote.trnArea }</div></th>
                  <th>
                  <fmt:formatDate var="trnSt" value="${ travelNote.trnSt }" pattern="yyyy-MM-dd" />
                  <div align="center">${ trnSt }</div>
                  </th>
                  <th>
                  <fmt:formatDate var="trnEnd" value="${ travelNote.trnEnd }" pattern="yyyy-MM-dd" />
                  <div align="center">${ trnEnd }</div>
                  </th>
                </tr>
                <tr  style="background-color:white">
                  <th height="15" colspan="3"><div align="center"><b>여행기 내용</b></div></th>
                </tr>
                <tr style="background-color:white">
                  <th height="507" colspan="3" > ${travelNote.trnContent} </th>
                </tr>
              </table>
              <a id="update" href="#">글수정</a> &nbsp;&nbsp; <a id="list" href="travelnote_list.action">목록보기</a> <a id="delete" href="travelnote_delete.action?trnNo=${travelNote.trnNo}">삭제</a>
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
