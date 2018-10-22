<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>점포 매물 사이트</title>
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
    	
    	$(".login_btn").click(function() {
    		if ($("#id").val() == ""){
    			alert("아이디없음");
    		} else if ($("#pw").val() == ""){
    			alert("비밀번호없음");
    		}else {
    			f.submit();
    		}
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
					<h2>로그인</h2>
				</div>
			<div class="login_box">
				<div class="login_box">
					<div class="login_cont">
						<form name="f"  method="post" action="LoginSign.do">
							<div class="login_form">
								<dl class="login_in">
									<dt><label for="uid">아이디</label></dt>
									<dd><input id="id" class="i_text" type="text"  name="id" placeholder="아이디를 입력해 주세요."></dd>
									<dt><label for="upw">비밀번호</label></dt>
									<dd><input id="pw" class="i_text" type="password" name="pw" placeholder="비밀번호를 입력해 주세요."></dd>
								</dl>
								<p class="login_btn"><img alt="로그인버튼" src="resources/images/btn_login.gif"><!--   <input class="submit" type="image" id="loginBtn" name="loginBtn" alt="로그인" src="images/btn_login.gif"> --></p>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
		<jsp:include page="left_baner.jsp"></jsp:include>
		<jsp:include page="right_baner.jsp"></jsp:include>
		<jsp:include page="footerInc.jsp"></jsp:include>
	</section>
</body>
</html>