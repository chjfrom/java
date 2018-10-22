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
	<script type="text/javascript">
   
    function trade_aply() {
    	document.f.action="d_insert.do";
		document.f.submit();	
	}
    
    $(document).ready(function(){
        $('.bxslider').bxSlider({
  	  		auto: true,
  			autoControls: true,
  			stopAutoOnClick: true,
  			pager: true,
  			slideWidth: 800
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
			<div class="trade_aply">
				<div id="sub_tit">
					<h2>자료등록</h2>
				</div>
				<div class="viewTbl">
					<form method="post" name="f" enctype="multipart/form-data">
						<table class="table_st01" summary="">
							<caption></caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">작성자</th>
									<td><input type="text" name="d_write"></td>
									<th scope="row">담당부서</th>
									<td><input type="text" name="d_department"></td>
								</tr>
								<tr>
									<th scope="row">전화번호</th>
									<td><input type="text" name="d_phon"></td>
								</tr>
								<tr>
									<th scope="row">자료 제목</th>
									<td colspan="3"><input type="text" name="d_title" style="width:100%;"></td>
								</tr>	
								<tr>
									<th scope="row">자료 내용</th>
									<td colspan="3"><input type="text" name="d_content" style="width:100%;"></td>
								</tr>
								<tr>
									<th scope="row">첨부파일</th>
									<td colspan="3"><input type="file" name="t_data"></td>
								</tr>
								<input type="hidden" name="u_idx" value="${mvo.u_idx}" />
								<input type="hidden" name="u_name" value="${mvo.u_name}" />
							</tbody>
						</table>
					</form>
					<div class="btn_cen">
						<a class="btn_st04"><span onclick="trade_aply()">등록하기</span></a>
						<a class="btn_st03"><span>다시작성</span></a>
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