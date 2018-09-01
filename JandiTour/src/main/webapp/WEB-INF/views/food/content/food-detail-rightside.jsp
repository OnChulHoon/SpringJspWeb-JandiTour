<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${param.requestPage eq 'food-detail-rating'}">
	<div class="col-sm-3 col-xs-12">
		<aside>
			<form action="/janditour/food_list.action" method="post">
				<div class="panel panel-default packagesFilter">
					<div class="panel-heading">
						<h3 class="panel-title">다른 사람들은 어땠을까?</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-xs-12">
								<div class="searchFilter">
									<select name="area" id="area" class="form-control">
										<option value="">-지역선택-</option>
										<option value="전체">전체</option>
										<option value="서울특별시">서울특별시</option>
										<option value="인천광역시">인천광역시</option>
										<option value="경기도">경기도</option>
										<option value="부산광역시">부산광역시</option>
										<option value="울산광역시">울산광역시</option>
										<option value="대구광역시">대구광역시</option>
										<option value="경상북도">경상북도</option>
										<option value="경상남도">경상남도</option>
										<option value="광주광역시">광주광역시</option>
										<option value="전라북도">전라북도</option>
										<option value="전라남도">전라남도</option>
										<option value="대전광역시">대전광역시</option>
										<option value="충청북도">충청북도</option>
										<option value="충청남도">충청남도</option>
										<option value="강원도">강원도</option>
										<option value="제주도">제주도</option>
									</select> <br>
								</div>
							</div>

							<div class="col-xs-12">
								<div class="" data-provide="">
									<input type="text" class="form-control" placeholder="지역검색"
										id="area2" name="area2"> <br>
								</div>
							</div>

							<div class="col-xs-12">
								<div class="" data-provide="">
									<input type="text" class="form-control" placeholder="맛집 검색"
										id="foodName" name="foodName"> <br>
								</div>
							</div>

							<div class="col-sm-12">
								<a id="search" href="#" class="btn btn-block buttonTransparent">검색</a>
							</div>
						</div>
					</div>
				</div>
			</form>
		</aside>
	</div>
</c:if>

<c:if test="${param.requestPage eq 'food-detail-weather'}">
	<div class="col-sm-4 col-xs-12">
		<aside>
			<div class="weatherInfo">
				<img src="/janditour/resources/img/cities/weather-bg.jpg"
					alt="image">
				<div class="cityWeather">
					<div class="cityTable">
						<div class="cityTableInner">
							<div class="cityWeatherInfo">
								<img src="/janditour/resources/img/icons/cloud.png">
								<h2>
									28<sup>0</sup>
								</h2>
								<p>France, Paris</p>
							</div>
						</div>
					</div>
				</div>
				<div class="dayTime">
					<span class="pull-left">April 20, 2016</span> <span
						class="pull-right">Monday</span>
				</div>
				<div class="daysWeather">
					<ul class="list-inline">
						<li>Tue <span><img
								src="/janditour/resources/img/icons/cloud-rain.png" alt="image"></span>18<sup>0</sup></li>
						<li>Wed <span><img
								src="/janditour/resources/img/icons/sun.png" alt="image"></span>25<sup>0</sup></li>
						<li>Thu <span><img
								src="/janditour/resources/img/icons/cloud-sm.png" alt="image"></span>22<sup>0</sup></li>
					</ul>
				</div>
			</div>
		</aside>
	</div>
</c:if>