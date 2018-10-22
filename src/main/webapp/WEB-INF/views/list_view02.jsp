<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      	
    	function getList() {
			$.ajax({
				url : "/project01/CommentController",
				type : "get",
				dataType : "xml",
				data : "treade_idx="+$(".treade_idx").text(),
				success : function(data) {
					div = "<div class='text_view_box'>"
					$(data).find("member").each(function() {
						div += "<div class='text_view'>"
						div +="<div class='u_info'>";
						div +="<p>"+$(this).find("u_name").text()+" (회원)";
						div +="</p>";
						div +="<ul>";
						div +="<li id='rwrite'>" + "답글";
						div +="</ll>";
						div +="<li id='rmodify'>"+ "수정";
						div +="</ll>";
						div +="<li id='rdel'>"+ "삭제";
						div +="</ll>";
						div +="</ul>";
						div +="</div>";
						div +="<div class='u_contens'>";
						div +="<p>"+$(this).find("c_content").text();
						div +="</p>";
						div +="<span>";
						div +="<strong>"+$(this).find("regdate").text();
						div +="</strong>";
						div +="<strong class='c_idx'>"+$(this).find("c_idx").text();
						div +="</strong>";
						div +="<strong class='c_pwd'>"+$(this).find("c_pwd").text();
						div +="</strong>";
						div +="</span>";
						div +="</div>";
						div +="</div>";
						
					});
					div += "</div>"
					$(".tex_contents").after(div);	
				},
				error : function name() {
					alert("실패")
				}
			});
		}getList();
		// 댓글 삽입
		$(".coment_btn").click(function() {
			$.ajax({
				url : "${pageContext.request.contextPath}/CommentAgreeController",
				type : "get",
				dataType : "text",
				data : $("#comment_agree").serialize(),
				success : function() {
					alert("댓글전송 성공");
					$(".text_view_box").remove();
					getList();
				},
				error : function() {
					alert("댓글전송 실패");
				}
			});
		});	
		
		// 댓글 삭제
		$(document).on("click",'#rdel',function(){ 
			$(this).parent().parent().parent().append("<div class='rdel'><input type='text' id='pwcc'><p id='pwcbtn'>비밀번호입력</p></div>");
			$(document).on("click",'#pwcbtn',function(){ 
				var ch1 = $("#pwcc").val();
				var ch2 = $(".c_pwd:first").text();
				if (ch1 == ch2){
					
					$.ajax({
						url : "${pageContext.request.contextPath}/CommentDelController",
						type : "get",
						dataType : "xml",
						data : "c_idx="+$(".c_idx:first").text(),
						success : function() {
							alert("댓글삭제 성공");
							$(".text_view_box").remove();
							getList();
						},
						error : function() {
							alert("댓글전송 실패");
						}
					});
					
				} else {
					alert("비밀번호가 틀림");
				}
		    });

	    });

		// 댓글 수정
		$(document).on("click",'#rmodify',function(){ 
			$(this).parent().parent().parent().append("<div class='rdel'><input type='text' id='pwcc'><p id='pwcbtn1'>비밀번호입력</p></div>");
			$(document).on("click",'#pwcbtn1',function(){ 
				var ch1 = $("#pwcc").val();
				var ch2 = $(".c_pwd:first").text();
				if (ch1 == ch2){
					alert("성공 답글을 수중하세요");
					$(this).parent().parent().append("<div class='rmodify'><div class='rmodify1'><textarea id='textarea'></textarea></div><div class='rmodify2'>수정버튼</div></div>");
					$(document).on("click",'.rmodify2',function(){ 
						var text = $("#textarea").val();
						var c_idx = $(".c_idx:first").text();
						$.ajax({
							url : "${pageContext.request.contextPath}/CommentmodifyController",
							type : "get",
							dataType : "xml",
							data : "c_idx="+c_idx + "&"+"c_content=" + text,
							success : function() {
								alert("댓글수정 성공");
								$(".text_view_box").remove();
								getList();
							},
							error : function() {
								alert("댓글전송 실패");
							}
						});
					});
				} else {
					alert("비밀번호가 틀림");
				}
		    });
	    });
		
		$(document).on("click",'#rwrite',function(){ 
	    	$(".text_view").append("<div class='rwrite'><textarea></textarea><p class='rwrite_tex'>답글입력</p></div>");
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
			<div id="tbody"></div>
			<div class="contsTradeView">
				<div class="title">
					<div>
						<h2>${bvo.b_edu_title}</h2>
						<span>조회수 : ${bvo.edu_hit}</span>
					</div>
				</div>
				<div class="viewIMg">
					<div><img style="width:100%;" src="images/${bvo.t_image_2}"></div>
					<ul>
						<li><img style="width:100%;" src="images/${bvo.t_image_1}"></li>
						<li><img style="width:100%;" src="images/${bvo.t_image_2}"></li>
					</ul>
				</div>
				<div class="viewTbl">
					<table class="table_st01" summary="">
						<colgroup>
							<col style="width:120px;">
							<col style="width:120px;">
							<col style="width:120px;">
							<col style="width:120px;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">판매자</th>
								<td>${bvo.u_name}</td>
								<th scope="row">고객번호</th>
								<td class="treade_idx">${bvo.treadebuy_idx}</td>
							</tr>
							<tr>
								<th scope="row">지역</th>
								<td>${bvo.b_areaK_step1}</td>
								<th scope="row">지역상세</th>
								<td>${bvo.b_areaK_step2}</td>
							</tr>
							<tr>
								<th scope="row">면적</th>
								<td>${bvo.b_edu_extends}</td>
								<th scope="row">층수구분</th>
								<td>${bvo.b_bulid_h}</td>
							</tr>
							<tr>
								<th scope="row">보증금</th>
								<td>${bvo.b_deposit }</td>
								<th scope="row">월세</th>
								<td>${bvo.b_monthly_rent}</td>
							</tr>
							<tr>
								<th scope="row">원생수</th>
								<td>${bvo.b_student_num }</td>
								<th scope="row">순이익</th>
								<td>${bvo.b_month_sales}</td>
							</tr>
							<tr>
								<th scope="row">사고싶은 내역</th>
								<td colspan="3">
									<pre>${bvo.b_edu_introduce}</pre>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="interestApply">
					<div class="comment_ico">
						<img src="images/comment_ico.gif">
					</div>
					<div class="comment_box">
                        <div class="layout">
                        	<form id="comment_agree">
	                        	<div class="userName">
	                        		<div>
	                        			<label for="name">이름 : </label>
	                        			<input type="text" readonly   name="u_name" id="name" value="${mvo.u_name}">
	                        			<label for="pass">비밀번호 : </label>
	                        			<input type="text" name="c_pwd" id="pass">
	                        			<input type="hidden" name="u_idx" value="${mvo.u_idx }">
	                        			<input type="hidden" name="treade_idx" value="${cvo.treade_idx}">
	                        		</div>
	                        	</div>
	                        	<div class="tex_contents">
	                        		<textarea name="c_content" id="Content"></textarea>
	                        		<div class="coment_btn">
	                        			<img src="images/btn_comment.gif" alt="등록버튼">
	                        		</div>
	                        	</div>
                        	</form>
                        	<div class="btn_prev">
                        		<p><a href="MyController?cmd=index"><img src="images/btn_prev.png" alt="이전화면으로 가기"></a></p>
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