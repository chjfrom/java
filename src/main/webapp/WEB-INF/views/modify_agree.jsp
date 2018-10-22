<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>마이페이지</title>
	<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/jquery.bxslider.css" />
	<script type="text/javascript" src="resources/js/jquery-3.2.1.js"></script>
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
    	
    	
    	// 중복확인
		$("#pwCheck").keyup(function() {
			$.ajax({
				url : "/ajax/pwChkController",
				type : "get",
				dataType : "text",
				data : $("#myform").serialize(),
				success : function(data) {
					$("#spanRHidden").html(data); 
					if (data ==1){
						$("#spanR").html("비빌번호확인"); 
					} else if (data ==0){
						$("#spanR").html("비빌번호불일치"); 
					}
				},
				error : function() {
				}
			});
		});
    	
		$("#selCheck").change(function() {
			var chekS = $("#selCheck option:checked").val();
			$("#email2").val(chekS);
		});
		
		// 나의정보 수정하기
		$(document).on("click",'.btn_st04',function(){ 
			var modifyAc = true;
			var check =  $("#spanRHidden").text();
			
			if ($("#id").val() == ""){
				alert("아이디없음");
				modifyAc = false;
			} else if ($("#name").val() == ""){
				alert("이름없음");
				modifyAc = false;
			} else if ($("#pwCheck").val() == ""){
				alert("비밀번호없음");
				modifyAc = false;
			} else if ($("#phon").val() == ""){
				alert("핸드폰번호 없음");
				modifyAc = false;
			} else if ($("#edu_name").val() == ""){
				alert("학원명 없음");
				modifyAc = false;
			} else if ($("#email").val() == ""){
				alert("이메일 없음");
				modifyAc = false;
			} else if (check == 1){
				alert("비밀번호일치");
				modifyAc = true;
			} else if (check == 0){
				alert("비밀번호불일치");
				modifyAc = false;
			}
			if (modifyAc == true){
				$.ajax({
					url : "/ajax/modifyUser",
					type : "get",
					dataType : "text",
					data : $("#myform").serialize(),
					success : function() {
						alert("회원정보 수정완료");
						location.href='index.do';
					},
					error : function() {
						alert("회원정보 수정 실패");
					}
				});
			}
		});
    });
    function aply_go() {
		f.submit();
	}
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
			<div class="logimForm">
				<div id="sub_tit">
					<h2>나의정보수정</h2>
				</div>
				<div class="viewTbl">
					<form name="myform" method="post" id="myform">
						<table class="table_st01" summary="">
							<caption></caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:50%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">아이디</th>
									<td><input type="text" id="id" name="id" value="${mvo.u_id}"></td>
									<th scope="row">고객명</th>
									<td><input type="text" name="name" id="name" value="${mvo.u_name}"></td>
								</tr>
								<tr>
									<th scope="row">비밀번호</th>
									<td colspan="3">
										<input id="pwCheck" type="password"  name="pw">
										<span id="spanRHidden" style="padding-left:14px;"></span>
										<span id="spanR" style="padding-left:14px;"></span>
									</td>
								</tr>
								<tr>
									<th scope="row">핸드폰번호</th>
									<td><input type="text"  id="phon" name="phon"></td>
									<th scope="row">성별</th>
									<td class="gen_radio">
										<label for="men">남자</label><input type="radio" value="남자" checked=checked name="gen" id="men">
										<label for="girl">여자</label><input type="radio" value="여자" name="gen" id="girl">
									</td>
								</tr>
								<tr>
									<th scope="row">학원명</th>
									<td><input type="text" id="edu_name" name="edu_name"></td>
									<th scope="row">이메일</th>
									<td>
										<input type="text" style="width:100px;" name="email1" id="email1"> @
										<input type="text" style="width:100px;" name="email2" id="email2">
										<select id="selCheck">
											<option>메일선택</option>
											<option>naver.com</option>
											<option>daum.net</option>
											<option>google.com</option>
										</select>
									</td>
								</tr>
								<input type="hidden" name="u_idx" value="${mvo.u_idx}">
							</tbody>
						</table>
					</form>
				</div>
				<div class="btn_cen">
					<a class="btn_st04"><span >수정</span></a>
					<a class="btn_st03" href="#"><span>취소</span></a>
				</div>
			</div>
		</section>
		<jsp:include page="left_baner.jsp"></jsp:include>
		<jsp:include page="right_baner.jsp"></jsp:include>
		<jsp:include page="footerInc.jsp"></jsp:include>
	</section>
</body>
</html>