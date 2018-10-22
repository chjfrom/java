<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      	
      	$('.subbaner').hover(function() {
			var img = $(this).children("img").attr('src');
			$(".banerMain").children("img").attr('src',img);
		});
      	
    	
      	// 관심등록 버튼
    	$(".check_kind").click(function(){
    		location.href="MyController?cmd=interest&treade_idx=${cvo.treade_idx}&u_idx=${mvo.u_idx}&checkI=${checkI}";
    	});
      	
    	function getList() {
			$.ajax({
				url : "/ajax/Comment",
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
						div +="<strong id='u_idx'>"+$(this).find("u_idx").text();
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
				url : "/ajax/comentAgree",
				type : "get",
				dataType : "text",
				data : $("#comment_agree").serialize(),
				success : function() {
					alert("댓글전송 성공");
					$(".text_view_box").remove();
					getList();
				},
				error : function() {
					alert("로그인후 이용해주세요");
				}
			});
		});	
		// 댓글 삭제
		$(document).on("click",'#rdel',function(){ 
			
			if (${mvo != null}){
				$(this).parent().parent().parent().append("<div class='rdel'><input type='text' id='pwcc'><p id='pwcbtn'>비밀번호입력</p></div>");
				$(document).on("click",'#pwcbtn',function(){ 
					var ch1 = $("#pwcc").val();
					var ch2 = $(".c_pwd:first").text();
					var ch3 = $("#mvo_u_idx").val();
					var ch4 = $(this).parent().prev().find("strong:last-child").html();
					if (ch1 == ch2 && ch3 == ch4){
						$.ajax({
							url : "/ajax/comentDell",
							type : "get",
							dataType : "xml",
							data : "c_idx="+ $(this).parent().prev().find("strong").eq(1).html(),
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
						alert("비밀번호가 틀림/권한이없습니다");
					}
			    });
			} else {
				alert("로그인후 이용해주세요");
			}
	    });
		
		// 댓글 수정
		$(document).on("click",'#rmodify',function(){ 
			if (${mvo != null}){
				$(this).parent().parent().parent().append("<div class='rdel'><input type='text' id='pwcc'><p id='pwcbtn1'>비밀번호입력</p></div>");
				$(document).on("click",'#pwcbtn1',function(){ 
					var ch1 = $("#pwcc").val();
					var ch2 = $(".c_pwd:first").text();
					var ch3 = $("#mvo_u_idx").val();
					var ch4 = $(this).parent().prev().find("strong:last-child").html();
					var ch5 = $(this).parent().prev().find("strong").eq(1).html();
					if (ch1 == ch2 && ch3 == ch4){
						alert("성공 답글을 수중하세요");
						$(this).parent().parent().append("<div class='rmodify'><div class='rmodify1'><textarea id='textarea'></textarea></div><div class='rmodify2'>수정버튼</div></div>");
						$(document).on("click",'.rmodify2',function(){ 
							var text = $("#textarea").val();
							var c_idx = $(".c_idx:first").text();
							$.ajax({
								url : "/ajax/comentModify",
								type : "get",
								dataType : "xml",
								data : "c_idx="+ ch5 + "&"+"c_content=" + text,
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
						alert("비밀번호가틀립니다/또는 본인이 등록한 댓글이아닙니다.");
					}
			    });
			} else {
				alert("로그인후 이용해주세요");
			}
	    });
		
		$(document).on("click",'#rwrite',function(){ 
			if (${mvo != null}){
				$(".text_view").append("<div class='rwrite'><textarea></textarea><p class='rwrite_tex'>답글입력</p></div>");
			} else {
				alert("로그인후 이용해주세요");
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
			<div id="tbody"></div>
			<div class="contsTradeView">
				<div class="title">
					<div>
						<h2>${cvo.edu_title}</h2>
						<span>조회수 : ${cvo.edu_hit}</span>
					</div>
				</div>
				<div class="viewIMg">
					<div class="banerMain"><img src="resources/images/db/${cvo.t_image_1}" alt=""></div>
					<ul>
						<li class="subbaner"><img src="resources/images/db/${cvo.t_image_1}" alt=""></li>
						<li class="subbaner"><img src="resources/images/db/${cvo.t_image_2}" alt=""></li>
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
								<td>${cvo.u_name}</td>
								<th scope="row">고객번호</th>
								<td class="treade_idx">${cvo.treade_idx}</td>
							</tr>
							<tr>
								<th scope="row">학습</th>
								<td>${cvo.eduK_step1}</td>
								<th scope="row">학습상세</th>
								<td>${cvo.eduK_step2}</td>
							</tr>
							<tr>
								<th scope="row">지역</th>
								<td>${cvo.areaK_step1}</td>
								<th scope="row">지역상세</th>
								<td>${cvo.areaK_step2}</td>
							</tr>
							<tr>
								<th scope="row">면적</th>
								<td>${cvo.edu_extends}</td>
								<th scope="row">층수구분</th>
								<td>${cvo.bulid_h}</td>
							</tr>
							<tr>
								<th scope="row">보증금</th>
								<td>${cvo.deposit }</td>
								<th scope="row">월세</th>
								<td>${cvo.monthly_rent}</td>
							</tr>
							<tr>
								<th scope="row">원생수</th>
								<td>${cvo.student_num }</td>
								<th scope="row">월세</th>
								<td>${cvo.monthly_rent}</td>
							</tr>
							<tr>
								<th scope="row">월매출</th>
								<td>${cvo.month_sales }</td>
								<th scope="row">순이익</th>
								<td>${cvo.netprofit}</td>
							</tr>
							<tr>
								<th scope="row">학원이름</th>
								<td>${cvo.edu_name}</td>
								<th scope="row">비밀번호</th>
								<td><input type="text" style="width:30px; margin-right: 5px;"><span style="display: inline-block; border: 1px solid #c1c1c1; padding: 3px; vertical-align: middle;">변경</span></td>
							</tr>
							<tr>
								<th scope="row">학원소개</th>
								<td colspan="3">
									<pre>${cvo.edu_introduce}</pre>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="interestApply">
					<c:choose>
						<c:when test="${checkI == 'empty'}"><div class="check_kind"></div></c:when>
						<c:otherwise><div class="check_kind on"></div></c:otherwise>
					</c:choose>
					<div class="comment_ico">
						<img src="resources/images/comment_ico.gif">
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
	                        			<input type="hidden" id="mvo_u_idx" name="u_idx" value="${mvo.u_idx }">
	                        			<input type="hidden" name="treade_idx" value="${cvo.treade_idx}">
	                        		</div>
	                        	</div>
	                        	<div class="tex_contents">
	                        		<textarea name="c_content" id="Content"></textarea>
	                        		<div class="coment_btn">
	                        			<img src="resources/images/btn_comment.gif" alt="등록버튼">
	                        		</div>
	                        	</div>
                        	</form>
                        	<div class="btn_prev">
                        		<p><a href="index.do"><img src="resources/images/btn_prev.png" alt="이전화면으로 가기"></a></p>
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