<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
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
      
    	$(".aply_go").click(function() {
    		var idCheck = $(".id_c_tex2").text();
    		
    		if ($("#id").val() == ""){
    			alert("아이디없음");
    		} else if ($("#name").val() == ""){
    			alert("고객명없음");
    		} else if ($("#pw").val() == ""){
    			alert("비밀번호없음");
    		} else if ($("#pw1").val() == ""){
    			alert("비밀번호없음");
    		} else if ($("#pw").val() != $("#pw1").val()){
    			alert("비밀번호가 일치하지않음");
    		} else if ($("#phon").val() == ""){
    			alert("핸드폰번호없음");
    		} else if ($("#edu_name").val() == ""){
    			alert("학원명없음");
    		} else if ($("#email1").val() == ""){
    			alert("이메일주소없음");
    		} else if ($("#email2").val() == ""){
    			alert("이메일회사없음");
    		}else if (idCheck == 1){
    			alert("아이디 중복오류");
    		} else {
    			f.submit();
    		}
    	});
    	$("#selCheck").change(function() {
			var chekS = $("#selCheck option:checked").val();
			$("#email2").val(chekS);
		});
    	
    	// 아이디 중복확인
		$("#id").keyup(function() {
			$.ajax({
				url : "/ajax/idChkController",
				type : "get",
				dataType : "text",
				data : "u_id="+$("#id").val(),
				success : function(data) {
					$(".id_c_tex2").html(data); 
					if (data ==1){
						$(".id_c_tex1").html("아이디중복"); 
					} else if (data ==0){
						$(".id_c_tex1").html("아이디중복안됨"); 
					}
				},
				error : function() {
				
				}
			});
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
			<div class="logimForm">
				<div id="sub_tit">
					<h2>회원가입</h2>
				</div>
				<div class="viewTbl">
					<form action="insert.do" name="f" method="post">
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
									<th scope="row">
										아이디
										<p class="id_c_tex1"></p>
										<p class="id_c_tex2"></p>
									</th>
									<td>
										<input type="text" name="id" id="id">
									</td>
									<th scope="row">고객명</th>
									<td><input type="text" name="name" id="name"></td>
								</tr>
								<tr>
									<th scope="row">비밀번호</th>
									<td><input type="password" name="pw" id="pw"></td>
									<th scope="row">비밀번호확인</th>
									<td><input type="password" id="pw1"></td>
								</tr>
								<tr>
									<th scope="row">핸드폰번호</th>
									<td><input type="text"  name="phon" id="phon"></td>
									<th scope="row">성별</th>
									<td class="gen_radio">
										<label for="men">남자</label><input type="radio" checked=checked name="gen" value="남자" id="men">
										<label for="girl">여자</label><input type="radio" name="gen" value="여자" id="girl">
									</td>
								</tr>
								<tr>
									<th scope="row">학원명</th>
									<td><input type="text" name="edu_name" id="edu_name"></td>
									<th scope="row">이메일</th>
									<td>
										<input type="text" id="email1" style="width:100px;" name="email_1"> @
										<input type="text" id="email2" style="width:100px;" name="email_2">
										<select id="selCheck">
											<option>메일선택</option>
											<option>naver.com</option>
											<option>daum.net</option>
											<option>google.com</option>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<div class="btn_cen" style="margin-bottom: 20px;">
					<a class="btn_st04"><span class="aply_go">가입</span></a>
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