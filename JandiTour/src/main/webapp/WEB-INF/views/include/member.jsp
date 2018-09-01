<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:choose>
	<c:when test="${param.requestPage eq 'signup'}">

		<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#loginButton").on("click", function(event) {
					event.preventDefault();
					var idForm = $("#idForm").val();
					var pwForm = $("#pwForm").val();
					if (idForm == '') {
						alert("아이디를 입력하세요");
						return;
					}
					if (pwForm == '') {
						alert("비밀번호를 입력하세요");
						return;
					}

					if ((!(idForm == null)) && (!(pwForm == null))) {
						$('form#loginForm').submit();
					}

					$('#welcomeModal').modal('show');

				});

				$("#signupAction").on("click", function(event) {
					event.preventDefault();
					$('#signup').modal('show');
				});
				$("#loginAction").on("click", function(event) {
					event.preventDefault();
					$('#login').modal('show');
				});

				$("#findMyId").on("click", function(event) {
					event.preventDefault();
					$('#findId').modal('show');
				});

				$("#findButton").on("click", function(event) {
					event.preventDefault();
					$('#findIdResult').modal('show');
				});

				/* $("#closeButton").on("click",function(event){
					event.preventDefault();
					$('#signup').modal('show');
				}); */
			});
		</script>

		<div class="modal fade signupLoging" id="signup" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content modalContentCustom">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">회원가입</h4>
					</div>
					<div class="modal-body">
						<form method="post" action="/janditour/join.action">
							<div class="form-group">
								<input type="text" class="form-control bg-ash" name="memId"
									placeholder="아이디">
							</div>
							<div class="form-group">
								<input type="password" class="form-control bg-ash" name="memPw"
									placeholder="비밀번호">
							</div>
							<div class="form-group">
								<input type="text" class="form-control bg-ash" name="memName"
									placeholder="이름">
							</div>
							<div class="form-group">
								<input type="email" class="form-control bg-ash" name="memEmail"
									placeholder="이메일">
							</div>
							<div class="form-group">
								<input type="text" class="form-control bg-ash" name="memPhone"
									placeholder="휴대폰번호">
							</div>


							<div class="checkbox">
								<label> <input type="checkbox"> 개인정보 수집, 이용에 대해
									동의합니다.
								</label>
							</div>
							<button type="submit" class="btn btn-default">가입하기</button>
						</form>

					</div>

					<div class="modal-footer">
						<div class="dontHaveAccount">
							<p>
								이미 계정이 있으신가요?<a id="loginAction" href="" data-dismiss="modal"
									aria-hidden="true"> 로그인</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<c:if test="${param.requestPage eq 'login'}">
			<div class="modal fade signupLoging" id="login" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content modalContentCustom">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">로그인</h4>
						</div>

						<div class="modal-body">
							<form id="loginForm" method="post"
								action="/janditour/login.action">
								<div class="form-group">
									<input type="text" class="form-control bg-ash" id="idForm"
										name="memId" placeholder="아이디">
								</div>
								<div class="form-group">
									<input type="password" class="form-control bg-ash" id="pwForm"
										name="memPw" placeholder="비밀번호">
								</div>
								<div class="checkbox">
									<label> <input type="checkbox"> 아이디 기억하기
									</label><a id="findMyId" class="forgotPass clerfix" href=""
										data-dismiss="modal" aria-hidden="true">아이디 찾기</a>
								</div>
								<button id="loginButton" class="btn btn-default">로그인</button>
							</form>
							<!-- <div class="or">or</div>
					<a class="btn btn-default btnSocial" href="#">Log in with
						facebook</a> -->
						</div>

						<div class="modal-footer">
							<div class="dontHaveAccount">
								<p>
									계정이 없으신가요?<a id="signupAction" href="#" data-dismiss="modal"
										aria-hidden="true" onmouseover="true"> 회원가입</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<c:if test="${not empty loginuser}">
				<div class="modal fade bookingModal modalBook" id="welcomeModal"
					tabindex="-1">
					<div class="modal-dialog" align="center">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title">환영합니다!</h4>
							</div>
							<div class="modal-body">
								<button id="closeButton" type="button"
									class="btn buttonCustomPrimary" data-dismiss="modal"
									aria-hidden="true">확인</button>
							</div>
						</div>
					</div>
				</div>
			</c:if>


			<div class="modal fade signupLoging" id="findId" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content modalContentCustom">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">아이디 찾기</h4>
						</div>
						<div class="modal-body">
							<form method="post" action="/janditour/findId.action">

								<div class="form-group">
									<input type="text" class="form-control bg-ash" name="memName"
										placeholder="이름">
								</div>
								<div class="form-group">
									<input type="email" class="form-control bg-ash" name="memEmail"
										placeholder="이메일">
								</div>
								<div class="form-group">
									<input type="text" class="form-control bg-ash" name="memPhone"
										placeholder="휴대폰번호">
								</div>

								<button id="findButton" type="submit" class="btn btn-default"
									data-dismiss="modal" aria-hidden="true">아이디 찾기</button>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="modal fade signupLoging" id="findIdResult" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content modalContentCustom">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">회원님의 아이디</h4>
						</div>
							<div class="modal-body">
								<form action="">
									<div class="form-group">
									<table>
									<tr>
									<td>${member.memId}</td>
									</tr>
									</table>
									</div>
									<button id="findButton" type="submit" class="btn btn-default"
										data-dismiss="modal" aria-hidden="true">확인</button>
								</form>
							</div>
					</div>
				</div>
			</div>



		</c:if>
	</c:otherwise>
</c:choose>


