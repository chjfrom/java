<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<script type="text/javascript">	
		$(document).ready(function() {
			$(".check_login").click(function() {
				alert("로그인후 이용해주세요");
			});
		});
	</script>
</head>
<body>
	<header>
		<div class="utill">
			<h1>로고</h1>
			<c:choose>
				<c:when test="${empty mvo}">
					<ul style="width:155px;">
						<li><a href="login.do">로그인</a></li>
						<li><a href="login_agree.do">회원가입</a></li>
						<!-- <li class="mypage"><a href="MyController?cmd=mypage1">마이페이지</a></li> -->
					</ul>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${mvo.u_id == 'master'}">
							<ul class="login_ui" style="width:470px;">
								<li>${mvo.u_id} 님로그인</li>
								<li><a href="masterPage.do">관리자페이지</a></li>
								<li><a href="interest.do?u_idx=${mvo.u_idx}">마이페이지</a></li>
								<li><a href="logout.do">로그아웃</a></li>
							</ul>
						</c:when>
						<c:otherwise>
							<ul class="login_ui">
								<li>${mvo.u_id} 님로그인</li>
								<li><a href="interest.do?u_idx=${mvo.u_idx}">마이페이지</a></li>
								<li><a href="logout.do">로그아웃</a></li>
							</ul>
						</c:otherwise>		
					</c:choose>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="menu">
			<c:choose>
				<c:when test="${empty mvo}">
					<ul>
						<li><a href="index.do">매물리스트</a></li>
						<li class="check_login">매물등록</li>
						<li class="check_login">매수등록</li>
						<li><a href="MyController?cmd=buylist">매수리스트</a></li>
						<li class="check_login"><a href="">자료실</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul>
						<li><a href="index.do">매물리스트</a></li>
						<li><a href="tradeaply.do">매물등록</a></li>
						<li><a href="treade_aply2.do">매수등록</a></li>
						<li><a href="buylist.do">매수리스트</a></li>
						<li><a href="reference_room.do">자료실</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</header>
</body>
</html>