<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>관리자 페이지</title>
	<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/jquery.bxslider.css" />
	<script type="text/javascript" src="resources/js/jquery-1.7.1.js"></script>
	<script type="text/javascript" src="resources/js/jquery.bxslider.js"></script>
	<script>
    $(document).ready(function(){
      	$('.bxslider').bxSlider({
	  		auto: true,
			autoControls: true,
			stopAutoOnClick: true,
			pager: true,
			slideWidth: 800
		});
    	$(".check_kind").click(function(){
    		$(this).toggleClass("on");
    	});
    	$(".trade").click(function() {
    		var treade_idx = $("#treade_idx").val();
    		location.href="MyController?cmd=bestsch&treade_idx="+treade_idx;
		});
    	$(".D_trade").click(function() {
    		var treade_idx = $("#d_treade_idx").val();
    		location.href="MyController?cmd=bestdell&treade_idx="+treade_idx;
		});
    	var rsul = $(".rest_r").text();
    	if (rsul == 1){
    		alert("프리미엄광고 등록 성공");
    	}
    	var rsu2 = $(".rest_d").text();
    	if (rsu2 == 1){
    		alert("프리미엄광고 삭제 성공");
    	}
    	$(".user_sch").click(function() {
    		var u_id = $("#user_id").val();
    		location.href="MyController?cmd=usersch&u_id="+u_id;
		});
    	$(".user_dell").click(function() {
    		var u_idx = $(".u_idxCheck").text();
    		location.href="MyController?cmd=userdell&u_idx="+u_idx;
		});	
    	$(".trade_sch").click(function() {
    		var trade_idx = $("#trade_idx").val();
    		location.href="MyController?cmd=trade_sch&trade_idx="+trade_idx;
		});
    	$(".treade_dell").click(function() {
    		var trade_idx = $(".t_idxCheck").text();
    		location.href="MyController?cmd=trade_dell&trade_idx="+trade_idx;
		});
    });
  </script>
</head>
<body>
	<section id="wrap">
		<jsp:include page="headerInc.jsp"></jsp:include>
		<section id="container">
			<div class="contsTop">
				<div class="bxslider">
					<div><img src="resources/images/img01.jpg" alt=""></div>
					<div><img src="resources/images/img01.jpg" alt=""></div>
				</div>
			</div>
			<div id="sub_tit">
				<h2>관리자페이지</h2>
			</div>
			<div class="masterBox">
				<h3>유저 관리</h3>
				<div class="user_adver">
					<ul>
						<li>유저 탈퇴</li>
						<li>유저아이디</li>
						<li><input type="text" id="user_id"></li>
						<li class="user_sch">검색</li>
					</ul>
					<p class="u_dell">${res2}</p>
					<c:choose>
						<c:when test="${u_list != null}">
							<ul>
								<li>검색 결과</li>
								<li>${u_list.u_id}</li>
								<li>${u_list.u_name}</li>
								<li class="user_dell">삭제</li>
							</ul>
							<P class="u_idxCheck">${u_list.u_idx}</P>
						</c:when>
						<c:otherwise>
							<p class="nodata">검색결과 없음</p>
						</c:otherwise>
					</c:choose>
				</div>
				
				<h3>매물리스트 관리</h3>
				<div class="user_adver">
					<ul>
						<li>매물 확인</li>
						<li>매물 정보</li>
						<li><input type="text" id="trade_idx"></li>
						<li class="trade_sch">검색</li>
					</ul>
					<p class="u_dell">${res2}</p>
					<c:choose>
						<c:when test="${tradelist != null}">
							<ul>
								<li>검색 결과</li>
								<li>${tradelist.edu_title}</li>
								<li>${tradelist.u_name}</li>
								<li class="treade_dell">삭제</li>
							</ul>
							<P class="t_idxCheck">${tradelist.treade_idx}</P>
						</c:when>
						<c:otherwise>
							<p class="nodata">검색결과 없음</p>
						</c:otherwise>
					</c:choose>
				</div>
				
				<h3>광고 관리</h3>
				<div class="premium_adver">
					<ul>
						<li>프리미엄 광고 등록</li>
						<li>매물번호</li>
						<li><input type="text" id="treade_idx"></li>
						<li class="trade">검색</li>
					</ul>
					<p class="rest_r">${res}</p>
					<c:choose>
						<c:when test="${cvo != null}">
							<ul>
								<li>검색결과</li>
								<li>${cvo.treade_idx}</li>
								<li>${cvo.u_name}</li>
								<li><a href="MyController?cmd=bestadd&treade_idx=${cvo.treade_idx}">광고추가</a></li>
							</ul>
						</c:when>
						<c:otherwise>
							<p class="nodata">검색결과 없음</p>
						</c:otherwise>
					</c:choose>
					<ul>
						<li>프리미엄 광고 삭제</li>
						<li>매물번호</li>
						<li><input type="text" id="d_treade_idx"></li>
						<li class="D_trade">삭제</li>
					</ul>
					<p class="rest_d">${res1}</p>
				</div>
				
				<h3 style="margin-top: 10px;">자료실</h3>
				<div class="data_adver">
					<p><a href="data_Insert.do"> 자료실 등록 </a></p>
				</div>
			</div>
		</section>
		<jsp:include page="left_baner.jsp"></jsp:include>
		<jsp:include page="right_baner.jsp"></jsp:include>
		<jsp:include page="footerInc.jsp"></jsp:include>
	</section>
</body>
</html>