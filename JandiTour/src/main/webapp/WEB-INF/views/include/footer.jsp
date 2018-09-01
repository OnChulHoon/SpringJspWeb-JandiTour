<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:choose>
	<c:when test="${param.requestPage eq 'footer'}">
		<div class="footer clearfix">
				<div class="container">
					<div class="row">
						<div class="col-sm-3 col-xs-12">
							<div class="footerContent">
								<a href="/janditour/home.action" class="footer-logo"><img
									src="/janditour/resources/img/logo-color-small.png" alt="footer-logo"></a>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt ut labore et dolore magna
									aliqua. Ut enim ad minim veniam, quis nostrud exercitation
									ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
									aute</p>
							</div>
						</div>
						<div class="col-sm-3 col-xs-12">
							<div class="footerContent">
								<h5>contact us</h5>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit
									sed do eiusmod.</p>
								<ul class="list-unstyled">
									<li><i class="fa fa-home" aria-hidden="true"></i>61 Park
										Street, Fifth Avenue, NY</li>
									<li><i class="fa fa-phone" aria-hidden="true"></i>[88] 657
										524 332</li>
									<li><i class="fa fa-envelope-o" aria-hidden="true"></i><a
										href="mailTo:info@star-travel.com">info@star-travel.com</a></li>
								</ul>
							</div>
						</div>
						
						<div class="col-sm-3 col-xs-12">
							<div class="footerContent">
								<h5>newsletter</h5>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit
									sed do.</p>
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Enter your email"
										aria-describedby="basic-addon21"> <span
										class="input-group-addon" id="basic-addon21"><i
										class="fa fa-long-arrow-right" aria-hidden="true"></i></span>
								</div>
								<ul class="list-inline">
									<li><a href="#"><i class="fa fa-facebook"
											aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter"
											aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-google-plus"
											aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-pinterest-p"
											aria-hidden="true"></i></a></li>
									<li><a href="#"><i class="fa fa-vimeo"
											aria-hidden="true"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="copyRight clearfix">
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-sm-push-6 col-xs-12">
							<ul class="list-inline">
								<li><a href="#">Privacy Policy</a></li>
								<li><a href="#">About Us</a></li>
								<li><a href="#">Support</a></li>					
							</ul>
						</div>
						<div class="col-sm-6 col-sm-pull-6 col-xs-12">
							<div class="copyRightText">
								<p>
									Copyright&copy; 2018. All Rights Reserved by Team JANDI.
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
	</c:when>
	<c:otherwise>
		<c:if test="${param.requestPage eq ''}">

						
		</c:if>
	</c:otherwise>
</c:choose>
