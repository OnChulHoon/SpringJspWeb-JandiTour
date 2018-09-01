<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

  <!-- SITE TITTLE -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>잔디 투어 - 회원 정보 수정</title>

  <!-- PLUGINS CSS STYLE -->
  <link href="resources/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet">
  <link href="resources/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="resources/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="resources/plugins/selectbox/select_option1.css">
  <link rel="stylesheet" type="text/css" href="resources/plugins/datepicker/datepicker.css">
  <link rel="stylesheet" type="text/css" href="resources/plugins/isotope/jquery.fancybox.css">
  <link rel="stylesheet" type="text/css" href="resources/plugins/isotope/isotope.css">
  <!-- REVOLUTION SLIDER -->
	<link rel="stylesheet" href="resources/plugins/revolution/css/settings.css">
	<link rel="stylesheet" href="resources/plugins/revolution/css/layers.css">
	<link rel="stylesheet" href="resources/plugins/revolution/css/navigation.css">


  <!-- GOOGLE FONT -->
  <link href='https://fonts.googleapis.com/css?family=Montserrat:400,600,700' rel='stylesheet' type='text/css'>

  <!-- CUSTOM CSS -->
  <link href="resources/css/style.css" rel="stylesheet">
  <link rel="stylesheet" href="resources/css/colors/default.css" id="option_color">

  <!-- FAVICON -->
  <link rel="shortcut icon" type="image/png" href="resources/img/favicon.png"/>

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

</head>

<section class="pageTitle"
	style="background-image: url(/janditour/resources/img/pages/page-title-bg9.jpg);">
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="titleTable">
					<div class="titleTableInner">
						<div class="pageTitleInfo">
							<h1>회원정보수정</h1>
							<div class="under-border"></div>
							<br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<body class="body-wrapper ">
  <div class="main-wrapper">

    <!-- HEADER -->
    <header>
			<jsp:include page="/WEB-INF/views/include/header.jsp">
			<jsp:param name="requestPage" value="public"/>
		</jsp:include>
		</header>



<section class="settingSection">
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <div class="settingContent bg-ash" >
          <h4>회원정보 수정</h4>
          <!-- Change Password -->
          <div class="changeId">
            <p>아이디 변경</p>
            <div class="row">
              <form action="modifyId.action?memNo=${loginuser.memNo}" method="post">
                <div class="col-sm-12">
                 <input type="text" class="form-control" id="oldId" name="oldId" placeholder="현재 아이디">
                </div>
                <div class="col-sm-12">
                  <input type="text" class="form-control" id="newId" name="newId" placeholder="새 아이디">
                </div>
                <div class="col-sm-12">
                  <input type="text" class="form-control" id="confirmId" name="confirmId" placeholder="새 아이디 확인">
                </div>
                <div class="col-sm-12">
                  <button type="submit" class="btn buttonTransparent">Update ID</button>
                </div>
              </form>
            </div>
          </div>
          <hr>
          
          
          <div class="changePassword">
            <p>비밀번호 변경</p>
            <div class="row">
              <form action="modifyPw.action?memNo=${loginuser.memNo}" method="post">
                <div class="col-sm-12">
                 <input type="text" class="form-control" name="oldPw" placeholder="현재 비밀번호">
                </div>
                <div class="col-sm-12">
                  <input type="text" class="form-control" name="newPw" placeholder="새 비밀번호">
                </div>
                <div class="col-sm-12">
                  <input type="password" class="form-control" name="confirmPw" placeholder="새 비밀번호 확인">
                </div>
                <div class="col-sm-12">
                  <button type="submit" class="btn buttonTransparent">Update Password</button>
                </div>
              </form>
            </div>
          </div>
          <hr>

<!-------------------------------------------이메일변경---------------------------------------------->
          <div class="changeEmail">
            <p>이메일 변경</p>
            <div class="row">
              <form action="modifyAccount.action?memNo=${loginuser.memNo}" method="post">
                <div class="col-sm-12">
                  <input type="text" class="form-control" id="oldEmail" name="oldEmail" placeholder="현재 이메일">
                </div>
                <div class="col-sm-12">
                  <input type="text" class="form-control" id="newEmail" name="newEmail" placeholder="새 이메일">
                </div>
                <div class="col-sm-12">
                  <input type="text" class="form-control" id="confirmEmail" name="confirmEmail" placeholder="새 이메일 확인">
                </div>
                <div class="col-sm-12">
                  <button type="submit" class="btn buttonTransparent">Update Email Address</button>
                </div>
              </form>
            </div>
          </div>
          <hr>

         

        </div>
      </div>
    </div>
  </div>
</section>


</div>

<!-- Inquiry Modal -->
	<jsp:include page="/WEB-INF/views/include/inquiry.jsp">
		<jsp:param name="requestPage" value="inquiry" />
	</jsp:include>
	
<!-- Signup Modal -->
<jsp:include page="/WEB-INF/views/include/member.jsp">
		<jsp:param name="requestPage" value="signup"/>
	</jsp:include>

<!-- Login Modal -->
<jsp:include page="/WEB-INF/views/include/member.jsp">
		<jsp:param name="requestPage" value="login"/>
	</jsp:include>

<!-- JAVASCRIPTS -->
<jsp:include page="/WEB-INF/views/include/javascript/public-javascript.jsp">
		<jsp:param name="requestPage" value="public-js"/>
	</jsp:include>

</body>

</html>

