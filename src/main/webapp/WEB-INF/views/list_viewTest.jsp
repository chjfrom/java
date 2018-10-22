<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>점포 매물 사이트</title>
	<link rel="stylesheet" type="text/css" href="css/common.css" />
	<link rel="stylesheet" type="text/css" href="css/jquery.bxslider.css" />
	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
	<script type="text/javascript" src="js/jquery.bxslider.js"></script>
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
    });
  </script>
</head>
<body>
	<section id="wrap">
		<jsp:include page="headerInc.jsp"></jsp:include>
		<section id="container">
			<div class="contsTop">
				<div class="bxslider">
					<div><img src="images/img01.jpg" alt=""></div>
					<div><img src="images/img01.jpg" alt=""></div>
				</div>
			</div>
			<div class="contsTradeView">
				<div class="title">
					<div>
						<h2>매물 타이틀</h2>
						<span>조회수 : 10</span>
					</div>
				</div>
				<!-- <div class="viewIMg">
					<div>이미지</div>
					<ul>
						<li>1</li>
						<li>2</li>
						<li>3</li>
					</ul>
				</div> -->
				<div class="viewTbl adSty">
					<table class="table_st01" summary="">
						<colgroup>
							<col style="width:120px;">
							<col style="width:120px;">
							<col style="width:120px;">
							<col style="width:120px;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">고객명</th>
								<td>조건희</td>
								<th scope="row">고객번호</th>
								<td>4011752606</td>
							</tr>
							<tr>
								<th scope="row">휴대폰번호</th>
								<td>010-**06-**90</td>
								<th scope="row">휴대폰모델명</th>
								<td>SHV-E210L</td>
							</tr>
							<tr>
								<th scope="row">가입일</th>
								<td>2014.07.14 가입</td>
								<th scope="row">가입대리점</th>
								<td>로그플래닛</td>
							</tr>
							<tr>
								<th scope="row">가입일</th>
								<td>2014.07.14 가입</td>
								<th scope="row">가입대리점</th>
								<td>로그플래닛</td>
							</tr>
							<tr>
								<th scope="row">가입일</th>
								<td>2014.07.14 가입</td>
								<th scope="row">가입대리점</th>
								<td>로그플래닛</td>
							</tr>
							<tr>
								<th scope="row">고객명</th>
								<td>조건희</td>
								<th scope="row">고객번호</th>
								<td>4011752606</td>
							</tr>
							<tr>
								<th scope="row">휴대폰번호</th>
								<td>010-**06-**90</td>
								<th scope="row">휴대폰모델명</th>
								<td>SHV-E210L</td>
							</tr>
							<tr>
								<th scope="row">학원소개</th>
								<td colspan="3">
									<pre>좋은학원이다</pre>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="interestApply">
					<div class="check_kind"></div>
					<div class="comment_ico">
						<img src="images/comment_ico.gif">
					</div>
					<div class="comment_box">
                        <div class="layout">
                        	<div class="userName">
                        		<div>
                        			<label for="name">이름 : </label>
                        			<input type="text" name="name" id="name">
                        			<label for="pass">비밀번호 : </label>
                        			<input type="text" name="pass" id="pass">
                        		</div>
                        	</div>
                        	<div class="tex_contents">
                        		<textarea name="Content" id="Content"></textarea>
                        		<div>
                        			<img src="images/btn_comment.gif" alt="등록버튼">
                        		</div>
                        	</div>
                        	<div class="text_view">
                        		댓글 나오는 영역
                        	</div>
                        	<div class="btn_prev">
                        		<p><img src="images/btn_prev.png" alt="이전화면으로 가기"></p>
                        	</div>
                        </div>	
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