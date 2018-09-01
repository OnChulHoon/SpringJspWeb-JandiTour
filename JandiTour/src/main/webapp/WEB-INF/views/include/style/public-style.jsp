<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if
	test="${param.requestPage eq 'public-style'
			or param.requestPage eq 'food-list-style'
			or param.requestPage eq 'food-write-style'}">

	<!-- PLUGINS CSS STYLE -->
	<link href="/janditour/resources/plugins/jquery-ui/jquery-ui.min.css"
		rel="stylesheet">
	<link href="/janditour/resources/plugins/bootstrap/css/bootstrap.min.css"
		rel="stylesheet">
	<link href="/janditour/resources/plugins/font-awesome/css/font-awesome.min.css"
		rel="stylesheet">
	<link rel="stylesheet" type="text/css"
		href="/janditour/resources/plugins/selectbox/select_option1.css">
	<link rel="stylesheet" type="text/css"
		href="/janditour/resources/plugins/datepicker/datepicker.css">
	<link rel="stylesheet" type="text/css"
		href="/janditour/resources/plugins/isotope/jquery.fancybox.css">
	<link rel="stylesheet" type="text/css"
		href="/janditour/resources/plugins/isotope/isotope.css">
	<!-- REVOLUTION SLIDER -->
	<link rel="stylesheet"
		href="/janditour/resources/plugins/revolution/css/settings.css">
	<link rel="stylesheet"
		href="/janditour/resources/plugins/revolution/css/layers.css">
	<link rel="stylesheet"
		href="/janditour/resources/plugins/revolution/css/navigation.css">

	<!-- GOOGLE FONT -->
	<link
		href='https://fonts.googleapis.com/css?family=Montserrat:400,600,700'
		rel='stylesheet' type='text/css'>

	<!-- CUSTOM CSS -->
	<link href="/janditour/resources/css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="/janditour/resources/css/colors/default.css"
		id="option_color">

	<!-- FAVICON -->
	<link rel="shortcut icon" type="image/png"
		href="/janditour/resources/img/favicon.png" />
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
  	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  	<![endif]-->

</c:if>
