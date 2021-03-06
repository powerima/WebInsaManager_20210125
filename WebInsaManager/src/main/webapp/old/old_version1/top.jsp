<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사관리시스템</title>

<!-- 주소 api를 사용하기 위한 추가 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- 모달 창을 위한 추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
 
<!-- datePickup을 위한 jquery -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<!-- 자바스크립트 파일 추가 -->
<script src="/biz/js/form_script.js"></script>
<!-- css 파일 추가 -->
<link rel="stylesheet" href="/biz/old_version//css/style.css" type="text/css">
</head>
<body>
<header>
	<div class="topleft">
		<a href="/biz/old_version/index.jsp">PinoSoft</a>		
	</div>
	<div class="topright">
		<a class="header_link" href="/biz/old_version/insa/insaInputForm.jsp">입력하기</a>
		<a class="header_link" href="/biz/old_version/insa/insaListForm.jsp">조회하기</a>
		<a class="header_link" href="/biz/old_version/insacom/getInsacomList.jsp">공통코드</a>
	</div>
</header>