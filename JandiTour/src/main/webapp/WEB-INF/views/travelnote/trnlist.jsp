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
<title>잔디 투어 - 여행기 정보 게시판</title>

<!-- PLUGINS CSS STYLE & FONT & FAVICON -->
<jsp:include page="/WEB-INF/views/include/style/public-style.jsp">
	<jsp:param name="requestPage" value="public-style"/>
</jsp:include>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="body-wrapper ">
<div class="main-wrapper">

  <header>
	  <jsp:include page="/WEB-INF/views/include/header.jsp">
	  	<jsp:param name="requestPage" value="public" />
	  </jsp:include>
  </header>
  
  <jsp:include page="/WEB-INF/views/include/travelnote/pagetitle/travelnote-pagetitle.jsp"/>
	<br><br><br>
  <!--=============================================================================================================================->
  <!-- RECENT ACTIVITY SECTION -->
  <section class="recentActivitySection">
  <div class="container">
    <div class="row">
      <div class="col-xs-12 ">
        <div class="recentActivityContent bg-ash">
          <div class="dashboardPageTitle">
            <h2>여행기 목록</h2>
          </div>
          <div class="table-responsive" data-pattern="priority-columns">
            <table class="table listingsTable" style="border-radius: 30px">
              <tr style="background-color:white;height:25px">
                <th style="width:80px"><div align="center"><strong>여행기 번호</strong></div></th>
                <th style="width:100px"><div align="center"><strong>여행기 이미지</strong></div></th>
                <th style="width:300px"><div align="center"><strong>여행기 제목</strong></div></th>
                <th style="width:150px"><div align="center"><strong>여행기 작성자</strong></div></th>
                <th style="width:120px"><div align="center"><strong>여행기 시작일자</strong></div></th>
                <th style="width:120px"><div align="center"><strong>여행기 종료일자</strong></div></th>
                <th style="width:120px"><div align="center"><strong>여행기 지역</strong></div></th>
              </tr>
              <c:forEach var="travelNote" items="${ noteList }"> 
              <tr align="center" style="background-color:white;height:30px">
                <td>${ travelNote.trnNo }</td>
                <td><img src="/janditour/resources/upload-image/travelnote-info/${travelNote.trnPic}" style="width:80px;height:50px"></td>
                <td><a href="travelnote_detail.action?trnNo=${ travelNote.trnNo }"> ${ travelNote.trnTitle } </a> </td>
                <td>${ travelNote.memId } (${ travelNote.memNo  })</td>
                <td>
                	<fmt:formatDate var="trnSt" value="${ travelNote.trnSt }" pattern="yyyy-MM-dd" />
                	${ trnSt }
                </td>
                <td>
                	<fmt:formatDate var="trnEnd" value="${ travelNote.trnEnd }" pattern="yyyy-MM-dd" />
                	${ trnEnd }
                </td>
                <td>${ travelNote.trnArea }</td>
              </tr>
              </c:forEach>
            </table>
			<!-- <input id="trnWriter" type="button" value="여행기 등록" style="width:300px;height:25px" /> -->
			<a id="link_register" href="javascript:">여행기 등록</a>
            <input type="hidden" value="test"/>
          </div>
          ${ pager } </div>
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

<script type="text/javascript">
	$(function() { //jQuery의 main 함수
		$('#link_register').on('click', function(event) {
			<c:choose>
				<c:when test="${ empty loginuser }">
				//alert('로그인 한 사용자만 글을 작성할 수 있습니다.');
				//location.href = '/janditour';
				$('#login').modal('show');
				</c:when>
				<c:otherwise>
				location.href = '/janditour/travelnote_writer.action';				
				</c:otherwise>
			</c:choose>			
		});
	});
	</script>
</body>
</html>
